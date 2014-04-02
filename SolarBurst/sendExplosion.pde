float pulsef = 0;

void sendExplosion ( ) {
  pulsef += 0.2;
  //println(burst);
  float sinPulse = sin(pulsef)+1;
  myPort.write((byte)sinPulse);


}
