int testLine = 0;
void testProcedure( )
{
  test1( );
  //scrapeLines( 18*8 );  
}

void test1( )
{
  if( testLine == 0 )
  {
    background( 0 );
    scrapeLines( 18*8 );
  }
    
  println( "testing" );
  
  drawScanLineSequence( 18, testLine, color( 255, 0, 0, 255 ) );
  testLine++;
  if( testLine >= 18*8 )
    testLine  = 0;
  wait( 100 );
}

void test2( )
{
  background( 0, 0, 255, 255 );
}
