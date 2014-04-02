void startMainLoop( )
{
  // initialize fft
  burst = getExplosion( );
  println( "Explosion Value: "+burst );      
  //now, play...
  backgroundMusic.pause( );
  println( "start main" );
  
  backgroundMusic.rewind( );
  backgroundMusic.play( );
  fft = new FFT( backgroundMusic.bufferSize( ), backgroundMusic.sampleRate( ) );
  colorMode(RGB,255);
}

float noiseScale=0.02;

void mainLoop( )
{  
  fft.forward( backgroundMusic.mix ); 
  drawFFT();
}

float[] lastBand = new float[w];
void drawFFT( )
{
  noStroke();
  background( 0 );
  //blendMode(ADD);
  
  int burstIndex = floor( burst );
  color argb = pulseColor[ burstIndex ];
    
  int a = (argb >> 24) & 0xFF;
  int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = argb & 0xFF;    
  
  float band1 = calcDB( 100, 0, 0.5 );
  float bandy = calcDB( 50, 0, 1 );
  float band2 = calcDB( 50, 0, 1);
  float band3 = calcDB( 120, 0, 1);

  for(int x = 0; x< w; x++ )
  { 
    for( int y = 0; y<h; y++ )
    {
      float noiseVal = noise( x * noiseScale * band2, y*noiseScale*bandy) *4;
      fill(color( r * noiseVal*band3/1.8, g* noiseVal*band3/1.9, b*noiseVal*(band2+band3)/1.4, 255 ));
      rect(x, y, 1, 1);
    }     
  }  
}

float calcDB( int band, float min, float max )
{
  float bandDB = 20 * log( 2 * fft.getBand( band ) / fft.timeSize() );
  float myBand = map( bandDB, -240, 0, min, max );
  return myBand;
}
