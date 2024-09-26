package kr.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.board.entity.Board;

@Mapper
public interface BoardMapper {
	
	@Select("SELECT * FROM BOARD")
	public ArrayList<Board> boardList();
	// --> MyBatis가 알아서 코드를 짜주기 때문에 추상 메소드로 작성

	@Insert("INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES(#{title}, #{content}, #{writer})")
	public void boardInsert(Board dto);

	@Select("SELECT * FROM BOARD WHERE IDX = #{idx}")
	public Board boardContent(int idx);
	
}
