package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
// @da하고 자동완성 누르면 import, 오른쪽 outline이 바뀜
@AllArgsConstructor
// 생성자 추가 함수 
@NoArgsConstructor
// 기본 생성자 함수 -> DTO안에는 기본생성자가 무조건 있어야함!
public class Board {
   
   private int idx; // 번호 - private 번호 은닉
   private String title; // 제목
   private String content; // 내용
   private String writer; // 작성자
   private String indate; // 날짜
   private int count; // 조회수
   
   // 객체지향 특징 : 캡상추다 
   // 캡슐화 private은 외부에서 접근 불가능(같은 클래스안에서만 가능) -> get, set만듦   
   // 단축키 alt+shit+s
   
   // 객체 생성할 때 만든 메소드 -> 생성자(6개의 데이터를 입력받아서 각각의 필드에 입력받도록)
   // 문제점 - 만약에 필드를 추가하거나, 데이터타입이 변경된다면 메소드, 생성자 전부 수정해야 함
   // 기존엔 일일이 다 만들었지만 자동으로 만들어 주는 API 사용하기!(다운)
   // 개발자라면 알아야하는 사이트 maven -> 무료 api 가져올수있는 곳
   // API추가는 pom.xml에 넣기
   // 오른쪽 outline은 현재 클래스를 요약해줌. 만약에 타입,필드 수정하면 알아서 변경 됨~
   
   // => 하나의 Board DTO객체는 하나의 게시글임!

}
