package kr.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

// 일반 컨트롤러 : 요청이 들어오면 view 이름을 돌려준다.
// REST Controller : 요청이 들어오면 데이터를 뿌려주기만 한다! 
//                   --> 받는 쪽이 화면을 알아서 구성해야함
@RestController
public class RestBoardController {
	
	// @Autowired : 자동으로 데이터를 주입해주세요
	@Autowired
	private BoardMapper mapper;
	
	// 게시글 전체 조회
	@RequestMapping("/boardList.do")
	public ArrayList<Board> boardList(){
		
		return mapper.boardList();
	}
	
	// 게시글 상세 조회
	@RequestMapping("/boardContent.do")
	public Board boardContent(@RequestParam("idx") int idx){
		// @RequestParam은 안 적어줘도 되지만, 
		// param 값이 두 개 이상 들어올 때는 꼭 적어주어야 한다! 
		return mapper.boardContent(idx);
	}
	
}
