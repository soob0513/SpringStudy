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
				<!-- 자바 코드를 HTML 태그 형식으로 사용할 수 있도록 taglib 불러오기 -->
				<!-- 자바코드를 태그처럼 사용하기 
					맨 위 자바 언어를 표준언어처럼 쓰겠다,
					forEach가 반복문 for(int i~ 안 써도 됨)
					items i 반복돌면서 꺼낼 배열 꺼낼 때 달러 중괄호
					var라는 변수만들기 - 배열이 돌면서 값이 하나씩 꺼내지면서 dto에 담김 이제 담길 때마다 값 꺼내오기
					dto는 총 6개 데이터, idx는 pricate로 나와있음 -->
               <c:forEach var="dto" items="${list}">
                  <tr>
                     <td>${dto.idx}</td>
                     <td>${dto.title}</td>
                     <td>${dto.writer}</td>
                     <td>${dto.indate}</td>
                     <td>${dto.count}</td>
                  </tr>                     
               </c:forEach>
                                       
             </tbody>
          
          </table>
              
       </div>
          <div class="panel-footer">사물지능 - 박병관</div>
        </div>
   </div>

</body>
</html>