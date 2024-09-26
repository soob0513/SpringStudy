package kr.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

//이 클래스가 컨트롤러이다!라고 적어야 handler가 찾을 수 있음
//★@Controller 어노테이션 
@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
   
   // 게시글 전체 조회
   // 내가 어떤 url을 요청하느냐에 따라 다양한 기능을 수행 
   // ★@RequestMapping(url/"~") : 아래 메소드와 연결해서 기능을 수행하겠다
   @RequestMapping("/boardList.do")
   public String boardList(Model model) {
	   
	   ArrayList<Board> list = mapper.boardList();
	   model.addAttribute("list", list);
	   
	   return "boardList";
	   
	   
	   /* 
      // public : 누구나 접근
      // String : Controller가 기능을 수행하고 return이 ViewName은 문자열임
      // 메소드 이름 = View Name과 동일하게 씀
      // 데이터는 Model에 저장하고 우리가 봐야할 JSP이름을 돌려줌
      
      // 번호(특정 게시글을 구분 짓기 위해), 제목, 내용, 작성자, 날짜, 조회수
      // 하나의 게시글정보는 총 6개 정보가 있음
      // 우리는 이 6개의 데이터를 하나로 묶고싶다(=하나의 데이터타입으로)
      // 그런데, 번호,숫자,제목 ...등 데이터 타입이 다름 -> 원래 자바는 불가능함 -> 만들자 -> DTO
      // 클래스 DTO(=VO 값을 담고 있는 객체)만들기
      // kr.board.entity - Board.java
      
      // DTO만들기
        Board dto1 = new Board(1, "안녕하세요 여러분! 저는 최수빈입니다.", "ㅋㅋ", "최수빈", "2024-09-25", 7);
        Board dto2 = new Board(2, "오늘 KT메뉴 뭐야", "ㅋㅋ", "김도아", "2024-09-25", 12);
        Board dto3 = new Board(3, "오오오! 신난다 신나", "ㅋㅋ", "신범식", "2024-09-26", 7);
      // 총 게시글 3개 boardList가져가야함 -> 그럼 Model에 넣어줘야함 -> 하나로 묶어서 넣자 -> 개수 안정해짐 -> ArrayList에 넣어 저장
      
        ArrayList<Board> list = new ArrayList<Board>();
        // <데이터타입> Board=클래스명=데이터타입 빈리스트만들었음, 이제 list안에 3개의 데이터 넣기 
        list.add(dto1);
        list.add(dto2);
        list.add(dto3);
      
      // 잠깐 저장할수있는 Model필요 -> boardlist()안에 Model
      // public String boardList(Model model) {
      model.addAttribute("list", list);
      // 모델에 저장하기 - 변수이름표 달아서! (문자열형태)
      // --> list 라는 이름으로 Model에 저장하겠습니다
      
      return "boardList";
      // ViewName : 보통 메소드이름과 url을 맞춤  
      */
   }
   
    // 게시글 작성 페이지 이동
	@RequestMapping("/boardInsertForm.do")
	public String boardInsertForm() {
		
		return "boardInsertForm";
	}
	
	// 게시글 작성 기능
	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board dto) {
		mapper.boardInsert(dto);

		return "redirect:/boardList.do";
	}
	
	// 게시글 상세 보기 기능
	@RequestMapping("boardContent.do")
	public String boardContent(@RequestParam("idx") int idx, Model model) {
		
		// idx와 인식하는 객체 ★하나★를 mapper로 받아오겠다!
		Board dto = mapper.boardContent(idx);
		model.addAttribute("dto", dto);
		return "boardContent";
	}
   
}
