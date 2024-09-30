package kr.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;

@Mapper
public interface BoardMapper {
	
	// SELECT문은 반환값이 있으므로 리턴타입을 반환값에 맞게.
	// INSERT, DELETE 문은 실행만 하니까 리턴타입 void
	// --> 제대로 삽입이 됐는지 값을 받아서 조건문으로 로직을 짤 경우,
	//     리턴타입은 int : 삽입된 행의 개수 정상동작 => 1 이상의 값이 리턴 / 실패 => 0
	
	@Select("SELECT * FROM BOARD")
	public ArrayList<Board> boardList();
	// --> MyBatis가 알아서 코드를 짜주기 때문에 추상 메소드로 작성

	@Insert("INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES(#{title}, #{content}, #{writer})")
	public void boardInsert(Board dto);

	@Select("SELECT * FROM BOARD WHERE IDX = #{idx}")
	public Board boardContent(int idx);

	@Delete("DELETE FROM BOARD WHERE IDX = #{idx}")
	public void boardDelete(int idx);

	@Update("UPDATE BOARD SET TITLE=#{title}, CONTENT=#{content} WHERE IDX=#{idx}")
	public void boardUpdate(Board dto);
	
	@Update("UPDATE BOARD SET COUNT=COUNT+1 WHERE IDX=#{idx}")
	public void boardCountUpdate(int idx);
	
}
