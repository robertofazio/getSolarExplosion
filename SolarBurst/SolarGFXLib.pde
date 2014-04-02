
void setPixel( int cube, int pos, color c  ) 
{
    List<Strip> strips = registry.getStrips();
    Strip strip = strips.get(cube);
    strip.setPixel( c, pos);
}

void scrapeLines(int numLines ) 
{
    for( int x = 0; x< numLines; x++ )
    {
      color c = get( x, 0 );
      drawScanLineSequence( 18, x, c );
    }
}

void drawScanLine( int cube, int scanline, color c )
{
  for( int i = 0; i<scanLines[scanline].length; i++ )
  {
    setPixel( cube, scanLines[scanline][i], c );
  }
}

void drawScanLineSequence( int linesPerCube, int scanline, color c )
{
  
  int cube = scanline / linesPerCube ;
  scanline = scanline % linesPerCube;
  
  for( int i = 0; i<scanLines[scanline].length; i++ )
  {
    setPixel( cube, scanLines[scanline][i], c );
  }
}



int[][] scanLines = {
{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,
 18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,
 34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,
 136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151 },
 
{184,52,135,183},
{185,53,134,182},
{186,54,133,181},
{187,55,132,180},
{188,56,131,179},
{189,57,130,178},
{190,58,129,177},
{191,59,128,176},
{192,60,127,175},
{193,61,126,174},
{194,62,125,173},
{195,63,124,172},
{196,64,123,171},
{197,65,122,170},
{198,66,121,169},
{199,67,120,168},

{102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,
68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,
152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167},
};
