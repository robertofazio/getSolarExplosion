int gradientIndex = 0;
void  startExplosion( )
{
  println( "Time to fetch! " );
  burst = getExplosion( );
  println( "Explosion Value: "+burst );  

  
  //now, play...
  backgroundMusic.pause( );
  int burstIndex = floor( burst );
  burstMusic[ burstIndex ].rewind( );
  burstMusic[ burstIndex ].play( );
  gradientIndex = 0;
}

color[][]   explosionColors = new color[][]  { {color( 0, 0, 0), color( 163, 247, 103 ), color( 235, 24, 135 ), color(163, 247, 103 ), color(0,0,0)}, // Exlplosion 1
                                               {color( 0, 0, 0), color( 230, 103, 25 ), color( 36, 60, 189 ), color( 230, 103, 25 ), color(0,0,0)},   // Exlplosion 2
                                               {color( 0, 0, 0), color( 179, 12, 100 ), color( 255, 0, 0 ), color( 179, 12, 100 ), color(0,0,0)},     // Exlplosion 3
                                               {color( 0, 0, 0), color( 131, 135, 254 ), color( 196, 196, 196 ), color( 131, 135, 254 ), color(0,0,0)}, // Exlplosion 4
                                               {color( 0, 0, 0), color( 154, 210, 243), color( 40, 99,133 ), color( 154, 210, 243), color(0,0,0)},   // Exlplosion 5
                                               {color( 0, 0, 0), color( 246, 45, 80), color( 55, 50, 209 ), color( 246, 45, 80), color(0,0,0)},   // Exlplosion 6
                                               {color( 0, 0, 0), color( 131, 135, 254), color( 246, 45, 80), color(131, 135, 254), color(0,0,0)}, // Exlplosion 7
                                               {color( 0, 0, 0), color( 230, 103, 25), color( 163, 247, 103), color(230, 103, 25), color(0,0,0)},   // Exlplosion 8
                                               {color( 0, 0, 0), color( 179, 12, 100), color( 55, 50, 209), color(179, 12, 100), color(0,0,0)}, // Exlplosion 9
                                               {color( 0, 0, 0), color( 255, 0, 0), color( 0, 0, 255), color(255, 0, 0), color(0,0,0)}, // Exlplosion 10
                                             };
int[]     size            = new int[]    { 18*8/2, 18*8*3, 18*8*3, 18*8*2, 18*8/4 };


color[]    pulseColor = new color[] { color(255, 0, 0), 
                                      color(255, 247, 103), 
                                      color(230, 103, 25), 
                                      color(179, 12, 100),
                                      color(131, 135, 254), 
                                      color(154, 210, 243), 
                                      color(246, 45, 80), 
                                      color(131, 135, 254), 
                                      color(230, 103, 25), 
                                      color(179, 12, 100) 
                                    }; 

void explosionLoop( )
{
  background( 0 );
  int maxSize = 0;
  for( int cnt = 0; cnt < size.length; cnt ++)
    maxSize += size[cnt];
    
  int burstIndex = floor( burst );
  float dec = burst -(float) burstIndex;
    
  int sizeAccumul = 0;
  for( int cnt = 0; cnt < size.length-1; cnt ++)
  {
    setGradient( -maxSize+sizeAccumul+gradientIndex, 0, size[cnt], h, explosionColors[burstIndex][cnt] , explosionColors[burstIndex][cnt+1], 0 );
    sizeAccumul += size[cnt];
  }  
  gradientIndex++;
  
  if( timeGap > 25000 )
  {
    float sinV = (sin( (timeGap -25000)/700.0 )+1)/2.0;
    float cosV = (cos( (timeGap -25000)/1000.0 )+1)/2.0;
    noStroke( );
    color argb = pulseColor[ burstIndex ];
    
    int a = (argb >> 24) & 0xFF;
    int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    int b = argb & 0xFF;  
    
    fill( round(r*sinV), round(g*sinV), round(b*sinV), round(a*sinV) );
    rect( 0, 0, w, h );
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) 
{
  noFill();
  if (axis == 1) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == 0) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
