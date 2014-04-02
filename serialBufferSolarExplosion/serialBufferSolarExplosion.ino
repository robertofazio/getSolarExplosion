#include <DmxMaster.h>
#include <math.h>
String inputString = "";         // a string to hold incoming data
boolean stringComplete = false;  // whether the string is complete
String subString;              
char charArray[3]; 
float floatValue;               // output float value
float mapValue;                 // map solar explosion range 1-9 to 0,255
int mapIndex;

int r, g, b;

void setup() {
  
  DmxMaster.usePin(3);
  DmxMaster.maxChannel(512);
  // initialize serial:
  Serial.begin(9600);
  // reserve 200 bytes for the inputString:
  inputString.reserve(200);
  
}

int l = 0;;
void loop() {
  // print the string when a newline arrives:

  for( int i = 0; i< 120; i++ )
  {
       setColor( i, r, g, b );
  }
  
  if (stringComplete) {
//    subString = inputString.substring(0,4);
//    Serial.println("subString: "+subString);
//    subString.toCharArray(charArray,6);        // convert String to charArray
//    floatValue = (atof (charArray));           // atof() C++ function no documentation on Arduino reference
//    Serial.println(floatValue);                // my output float value
//    mapValue = map(floatValue, 1.0, 9.0, 20, 255);
//    mapIndex = map(floatValue, 1.0, 9.0, 1, 3);
//    Serial.println(mapValue);
//    Serial.println(mapIndex);
    
   
    // clear the string:
    inputString = "";
    stringComplete = false;

  }
  
     //getLight(3,255);

}

//double pulsef = 0;
//void  pulse( int r, int g, int b, int freq )
//{
//  
//  pulsef += 0.2;
//  double sinv = (sin( pulsef ) +1) /2 ;
//  double cosv = (cos( pulsef/3 ) +1) /2 ;
//  
//  for( int i = 0; i< 120; i++ )
//  {
//       setColor( i, (int)(sinv*cosv*r),(int)(sinv*cosv*g),(int)(sinv*cosv*b) );
//  }
//  delay( freq);
//}

/*
  SerialEvent occurs whenever a new data comes in the
 hardware serial RX.  This routine is run between each
 time loop() runs, so using delay inside loop can delay
 response.  Multiple bytes of data may be available.
 */
void serialEvent() {
  if (Serial.available() > 0) 
  {    
    r = (char)Serial.read();
    Serial.print(r);
    // get the new byte:
//    char inChar = (char)Serial.read(); 
    // add it to the inputString:
//    inputString += inChar;
    // if the incoming character is a newline, set a flag
    // so the main loop can do something about it:
//    if (inChar == '\n') {
//      stringComplete = true;
//    } 
  }
}
