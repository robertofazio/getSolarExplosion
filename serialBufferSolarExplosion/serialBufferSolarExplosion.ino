
int serialLastExplosion;

void setup() {

  Serial.begin(9600);
    if(Serial){
       Serial.print("Serial opened at : " );
       Serial.print(9600);
    }
}

void loop(){
    
   if(Serial.available() > 0)
   { 
      serialLastExplosion = Serial.read();
      delay(1); // importante per non perdere sicronismo con unity3d
      Serial.println(serialLastExplosion);
    }
}
