BufferedReader reader;

String oldline;
String line;

void setup() {    
}
 
void draw() 
{
 oldline = null; 
  try {
    openFile( );
    line = reader.readLine();
  } catch (IOException e) {
    line = null;
  }

  if (line != null && line != oldline) {
    println( line);
  } 
  oldline = line;
}

void openFile( )
{
reader = createReader("/Users/robertofazio/Desktop/#LIGHT_INSTALLATION/shellScript/filedaleggere.txt");  
}
