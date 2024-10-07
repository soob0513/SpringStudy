package kr.board.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.board.entity.Iot;

@Mapper
public interface IoTMapper {
	
	@Select("SELECT * FROM IOT ORDER BY INDATE DESC limit 1")
	public Iot loadIot();
	
}
