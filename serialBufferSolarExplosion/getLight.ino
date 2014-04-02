// function turn on the group R G B of the whole stripe dmx led
void getLight(int index, int value){
 
if (index == 1){
   for (int i=1; i<=512; i+=3){
      DmxMaster.write(i,value);
      delay(1);
   }
}
 
if (index == 2){
   for (int i=2; i<=512; i+=3){
      DmxMaster.write(i,value);
           delay(1);

   }
}
 
 
if (index == 3){
   for (int i=3; i<=512; i+=3){
      DmxMaster.write(i,value);
          delay(1);

   }
}
}

void setColor(int index, int r, int g, int b)
{
  DmxMaster.write( index*3+1, r );
  DmxMaster.write( index*3+2, g ); 
  DmxMaster.write( index*3+3, b );
}
