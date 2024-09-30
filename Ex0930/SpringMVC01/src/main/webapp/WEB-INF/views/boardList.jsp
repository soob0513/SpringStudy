<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  추가함! 자동완성 사용하기 -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
   <div class="container">
     <h2>AI School Board</h2>
     <div class="panel panel-default">
       <div class="panel-heading">Board List</div>
       <div class="panel-body">
          <table class="table table-bordered table-hover">
             <thead>          
                <tr class="info">
                   <td>번호</td>
                   <td>제목</td>
                   <td>작성자</td>
                   <td>작성일</td>
                   <td>조회수</td>
                </tr>
             </thead>
             
             <tbody>
             	<!-- JSTL : jsp에서 java 코드를 HTML 태그 형식으로 간편하게 사용하도록 도와주는 라이브러리 -->
				<!-- 자바 코드를 HTML 태그 형식으로 사용할 수 있도록 taglib 불러오기 -->
				<!--
					forEach가 반복문 for(int i~ 안 써도 됨)
					영역 안에 있는 데이터를 꺼낼 때에는 달러 중괄호 형식으로 꺼내온다!!
					list에 있는 것을 꺼내서 변수에 담아주겠다 -> var이라는 속성 사용!	
					배열이 돌면서 값이 하나씩 꺼내지면서 dto에 담긴다. (Board 형태의 데이터들이 담김!)
					dto는 총 6개 데이터, idx는 private로 나와있음 -->
					
               <c:forEach var="dto" items="${list}" varStatus="status">
                  <tr>
                     <td>${status.count}</td> 
                     <td>
                     	<a href="boardContent.do?idx=${dto.idx}">${dto.title}</a>
                     </td>
                     <td>${dto.writer}</td>
                     <td>${dto.indate}</td>
                     <td>${dto.count}</td>
                  </tr>                     
               </c:forEach>                     
             </tbody>
          
          </table>
          
          <a href="boardInsertForm.do">
          	<button class="btn btn-info">글쓰기</button>
          </a>

       </div>
          <div class="panel-footer">사물지능 - 박병관</div>
        </div>
   </div>

</body>
</html>







