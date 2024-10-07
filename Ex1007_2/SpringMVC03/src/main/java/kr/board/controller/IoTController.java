package kr.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/loadIot")
	public @ResponseBody Iot loadIot() {
		return mapper.loadIot();
	}
}
