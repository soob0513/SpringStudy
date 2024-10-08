#include <ESP32Servo.h>
#include <WiFi.h>
#include <HTTPClient.h>  // 어디로 요청할지, 어떻게 요청할지
#include <ArduinoJson.h>

const char* ssid = "aischool class03(2.4Ghz)";  // WiFi ID
const char* password = "gjaischool";          // WiFi PW

// 응답 형태 -> JSON
String result = "";  // 응답 결과를 저장할 변수

HTTPClient http;  // 통신을 요청하는 객체

Servo myServo;  // 서보모터 제어 객체


// 서버 요청 주소
String address = "http://192.168.0.88:8081/controller/loadIot";

void setup() {

  myServo.attach(17);
  pinMode(26, OUTPUT);  // 노
  pinMode(25, OUTPUT);  // 빨

  Serial.begin(115200);  // 시리얼 통신 설정

  WiFi.begin(ssid, password);  // 와이파이 연결

  while (WiFi.status() != WL_CONNECTED) {  // 와이파이 연결이 안 되었을 때 반복 실행
    delay(1000);
    Serial.println("Connected to WiFi...");
  }
  Serial.println("Connected to the WiFi network");
}

void loop() {
  if (WiFi.status() == WL_CONNECTED) {  // WiFi 연결 체크
    http.begin(address);                // Server로 요청하기

    int httpCode = http.GET();  // 요청방식 및 요청하기 -> 0과 1로 반환함

    if (httpCode > 0) {          // 통신성공
      Serial.println(httpCode);  // 응답 코드 출력
      result = http.getString();
      Serial.println(result);

      // JSON 변환 객체
      DynamicJsonBuffer jsonBuffer;
      JsonObject& json = jsonBuffer.parseObject(result);

      String led1 = json["led1"];
      String led2 = json["led2"];
      int Servo = json["servo"];

      if(led1.equals("ON")){
        digitalWrite(26, 1);
      }else if(led1.equals("OFF"){
        digitalWrite(26, 0);
      }

      if(led2.equals("ON")){
        digitalWrite(25, 1);
      }else if(led2.equals("OFF"){
        digitalWrite(25, 0);
      } 

      myServo.write(servo);
    } 

    http.end();  // 연결 종료

  } else {
    Serial.println("Error on HTTP Request");
  }

  delay(300);
}