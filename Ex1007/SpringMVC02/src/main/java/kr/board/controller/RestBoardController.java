package kr.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

// 일반 컨트롤러 : view 반환. 요청이 들어오면 view 이름을 돌려준다.
// REST Controller : Model(데이터) 반환. 요청이 들어오면 데이터를 뿌려주기만 한다! 
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
	
	// 게시글 수정
	// @RequestMapping(/a -> GET인지 POST인지 식별 어려움)-> 옛날에 쓰던 방식
	// 전송 방식에 따라 @GetMapping(""), @PostMapping(""), @PutMapping("")
	// @RequestBody -> 요청 패킷의 body 영역에 실어진 데이터 꺼내올 때 사용
	//              => 자바 객체로 쉽게 변환 가능!
	@PutMapping("/boardUpdate.do")
	public String boardUpdate(@RequestBody Board b) {
		// System.out.println(b);
		mapper.boardUpdate(b);
		return "done";
	}
	
	// 게시글 삭제
	@DeleteMapping("/boardDelete.do/{idx}")
	public String boardDelete(@PathVariable("idx") int idx) {
		// System.out.println(idx);
		mapper.boardDelete(idx);
		return "done";
	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board b) {
		// @ModelAttribute (생략가능)
		System.out.println(b);
		mapper.boardInsert(b);
		return "done";
	}
	
}
