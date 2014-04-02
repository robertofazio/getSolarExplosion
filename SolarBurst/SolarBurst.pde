/**
  * SolarBurst 
  *  Authors: Roberto Fazio, Luca 'aXon' Marchetti
  *
  *
  *
  *
  */

import java.util.*;
import processing.serial.*;

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;

import ddf.minim.analysis.*;
import ddf.minim.*;

// helpers!
Minim         minim;
AudioPlayer   backgroundMusic;
AudioPlayer[] burstMusic;
FFT           fft; 
Serial myPort; 


DeviceRegistry registry;

// 'constants'
int w             = 18*8;    // 48 LED per MT * 5 MT = 240 evry cube has 200 PIXELS
int h             = 200;      // 8 STRIPES LED 64 PIXEL( EVERY STRIPES 8 PIXEL = 64 ) x10 x100 ...
int maxBurstValue = 10;      // Maximum value for a solar burst
int timeToFetch   = 60000;   // Time to wait for each event
int mainCycle     = 8;       // Number of events to wait for main music and effects
int mainLoopPos   = 8;

boolean  performTest = true;

// class variables
int lastTime;
int cycleCounter;
int typeOfLoop;
float burst;

PixelPusherObserver ppObserver;

void setup() 
{
  // Audio Init
  minim           = new Minim(this);
  burstMusic      = new AudioPlayer[ maxBurstValue ];
  backgroundMusic = minim.loadFile( "Audio/intro.mp3", 1024) ;
  
  for( int i = 1; i <= maxBurstValue; i++ )
    burstMusic[ i-1 ] = minim.loadFile( "Audio/Solar 25_ "+i+".mp3" );
    
  // Canvas Init
  size(w,h);
  background(0,0,0);
  colorMode(RGB, 100); 
  // List all the available serial ports:
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[5], 9600);
  // pixel Pusher Init
  ppObserver = new PixelPusherObserver( );
  registry = new DeviceRegistry();
  registry.setAntiLog(true);
  registry.addObserver(ppObserver);
}

boolean firstTime = true;
int timeGap       = 0;
void draw() 
{
  if( !ppObserver.started )
    return;
  
  registry.startPushing();
  registry.setExtraDelay(0);
  registry.setAutoThrottle(true);
  
  if( performTest )
  {
    testProcedure( );    
    return;
  }
  
  if( firstTime )
    lastTime = -timeToFetch;
    
  firstTime       = false;
  
  int currentTime = millis( );
  timeGap     = currentTime - lastTime;
  
  if( timeGap >= timeToFetch )
  {
    typeOfLoop  = cycleCounter%mainCycle;
    
    if( typeOfLoop == mainLoopPos )
      startMainLoop( );
    else
      startExplosion( );
      
    cycleCounter ++;
    lastTime = currentTime;      
  }
  
  if( typeOfLoop == mainLoopPos )
    mainLoop( );
  else
    explosionLoop( ); 
    
    sendExplosion();

  // now transfer from canvas to pixelPusher
  scrapeLines( 18*8 );  
}




float getExplosion( )
{
  String[] lines    = loadStrings("http://www.swpc.noaa.gov/ftpdir/lists/xray/Gp_xr_1m.txt" );  
  String lastLine   = lines[ lines.length -1 ];  
  String[] vals     = split( lastLine, ' '  );  
  String lastVal    = vals[ vals.length -1 ];  
  float explosion   = Float.valueOf(lastVal.substring(0, 4 ));
  if (explosion == -1.0)
    explosion = 1;
  println("Last Explosion: " +explosion);
  //myPort.write((char)explosion);
  return explosion;
 
}



void wait( int millis )
{
  int start = millis( );
  int now;  
  do
  {
    now = millis( );
  } while( now-start < millis ); 
}
