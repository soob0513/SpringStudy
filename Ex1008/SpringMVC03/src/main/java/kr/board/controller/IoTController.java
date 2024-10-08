package kr.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Iot;
import kr.board.mapper.IoTMapper;

@Controller
public class IoTController {
	
	@Autowired
	private IoTMapper mapper;
	
	@RequestMapping("/")
	public String main() {
		
		return "main";
	}
	
	// IoT 센서값 가져오기
	// RestController를 사용하지 않고 일반 Controller에서 비동기통신하기!
	// --> @ResponseBody
	@RequestMapping("/loadIot")
	public @ResponseBody Iot loadIot() {
		return mapper.loadIot();
	}
	
	// LED 제어하기
	@RequestMapping("/ledDo")
	public @ResponseBody void ledDo(@RequestParam("LED") String LED, @RequestParam("POWER") String POWER) {
		// LED, POWER 두 개의 값 넘어온다
		System.out.println(LED+"/"+POWER);
		
		// 1. LED 값이 LED1이고 ON일 때 IoT Table에 LED1 컬럼에 ON 값을 넣어주어야 한다
		// 단, 기존 LED2의 값과 Servo의 값은 유지한 상태로!
		Iot iot = mapper.loadIot();
		
		if(LED.equals("LED1")) {
			iot.setLed1(POWER);
		}else if(LED.equals("LED2")) {
			iot.setLed2(POWER);
		}
		
		mapper.ledDo(iot);
	}
	
	// Servo Motor 제어
	@RequestMapping("/servoDo")
	public @ResponseBody void servoDo(@RequestParam("SERVO") int servo) {
		
		System.out.println(servo);
		
		Iot iot = mapper.loadIot();
		iot.setServo(servo);
		
		// System.out.println(iot);
		mapper.servoDo(iot);
	}
	
}
