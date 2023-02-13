#include <Key.h>
#include <Keypad.h>
#include <Ultrasonic.h>

Ultrasonic ultrasonic(A1,A4); //(trig, echo)

int FPGA_pin = 2; // sensor out pin

// keypad out pins
int pinNum0 = 10; 
int pinNum1 = 11;
int pinNum2 = 12;
int pinNum3 = 13;

int distance;
char key;

const byte rows = 4; //four rows
const byte cols = 3; //three columns
char keys[rows][cols] = {
  {'1','2','3'},
  {'4','5','6'},
  {'7','8','9'},
  {'*','0','#'}
};
byte rowPins[rows] = {9, 8, 7, 6}; //connect to the row pinouts of the keypad
byte colPins[cols] = {5, 4, 3}; //connect to the column pinouts of the keypad
Keypad keypad = Keypad( makeKeymap(keys), rowPins, colPins, rows, cols );

void setup() {
  // put your setup code here, to run once:
  pinMode(FPGA_pin,OUTPUT);
  pinMode(pinNum0,OUTPUT);
  pinMode(pinNum1,OUTPUT);
  pinMode(pinNum2,OUTPUT);
  pinMode(pinNum3,OUTPUT);
  digitalWrite(pinNum0,LOW);
  digitalWrite(pinNum1,LOW);
  digitalWrite(pinNum2,LOW);
  digitalWrite(pinNum3,LOW);
  digitalWrite(FPGA_pin, LOW);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  char key = keypad.getKey();
  if(key){ // checking if a key is pressed
     Serial.print(key);
    if(key == '0'){ // converting numbers to binary
      digitalWrite(pinNum0,LOW);
      digitalWrite(pinNum1,LOW);
      digitalWrite(pinNum2,LOW);
      digitalWrite(pinNum3,LOW);
    }else if(key == '1'){
      digitalWrite(pinNum0,HIGH);
      digitalWrite(pinNum1,LOW);
      digitalWrite(pinNum2,LOW);
      digitalWrite(pinNum3,LOW);
    }else if(key == '2'){
      digitalWrite(pinNum0,LOW);
      digitalWrite(pinNum1,HIGH);
      digitalWrite(pinNum2,LOW);
      digitalWrite(pinNum3,LOW);
    }else if(key == '3'){
      digitalWrite(pinNum0,HIGH);
      digitalWrite(pinNum1,HIGH);
      digitalWrite(pinNum2,LOW);
      digitalWrite(pinNum3,LOW);
    }else if(key == '4'){
      digitalWrite(pinNum0,LOW);
      digitalWrite(pinNum1,LOW);
      digitalWrite(pinNum2,HIGH);
      digitalWrite(pinNum3,LOW);
    }else if(key == '5'){
      digitalWrite(pinNum0,HIGH);
      digitalWrite(pinNum1,LOW);
      digitalWrite(pinNum2,HIGH);
      digitalWrite(pinNum3,LOW);
    }else if(key == '6'){
      digitalWrite(pinNum0,LOW);
      digitalWrite(pinNum1,HIGH);
      digitalWrite(pinNum2,HIGH);
      digitalWrite(pinNum3,LOW);
    }else if(key == '7'){
      digitalWrite(pinNum0,HIGH);
      digitalWrite(pinNum1,HIGH);
      digitalWrite(pinNum2,HIGH);
      digitalWrite(pinNum3,LOW);
    }else if(key == '8'){
      digitalWrite(pinNum0,LOW);
      digitalWrite(pinNum1,LOW);
      digitalWrite(pinNum2,LOW);
      digitalWrite(pinNum3,HIGH);
    }else if(key == '9'){
      digitalWrite(pinNum0,HIGH);
      digitalWrite(pinNum1,LOW);
      digitalWrite(pinNum2,LOW);
      digitalWrite(pinNum3,HIGH);
    }else {
      digitalWrite(pinNum0,LOW);
      digitalWrite(pinNum1,LOW);
      digitalWrite(pinNum2,LOW);
      digitalWrite(pinNum3,LOW);
    }
  }
  distance = ultrasonic.read();
  //Serial.print("Distance in CM:");
  //Serial.println(distance);
  if (distance <= 10){
    //Serial.println("close");
    digitalWrite(FPGA_pin, HIGH);
  }
  else{
    //Serial.println("far");
    digitalWrite(FPGA_pin, LOW);
  }
}
