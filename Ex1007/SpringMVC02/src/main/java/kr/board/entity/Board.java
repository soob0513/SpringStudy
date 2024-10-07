package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor 
@NoArgsConstructor
public class Board {
   
   private int idx; // 번호 - private 번호 은닉
   private String title; // 제목
   private String content; // 내용
   private String writer; // 작성자
   private String indate; // 날짜
   private int count; // 조회수
   
}
