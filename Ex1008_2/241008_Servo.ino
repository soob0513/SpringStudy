#include <ESP32Servo.h>

Servo myServo;

void setup() { 

  myServo.attach(17);
  pinMode(26, OUTPUT); //빨
  pinMode(25, OUTPUT); //초
}

void loop() {
  myServo.write(180);
  digitalWrite(26, 1);
  digitalWrite(25, 1);
  delay(1000); // 1초
  myServo.write(90); // 직각
  digitalWrite(25, 0);
  digitalWrite(26, 0);
  delay(1000); 
}