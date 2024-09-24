package kr.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	// 게시글 전체 조회
	// view name을 돌려주어야 한다. -> 리턴타입 String 
	@RequestMapping("/boardList.do")
	public String boardList() {
		
		// 게시글 전체 조회 로직
		
		return "boardList";
	}
	
}
