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
       <div class="panel-heading">Board Insert</div>
       <div class="panel-body">
       
     	  <!-- http://localhost:8081/controller/boardUpdateForm.do/4 -->
       	  <!-- action="/"일 때 => http://localhost:8081 -->
       	  <form action="/controller/boardUpdate.do" method="post">
	          <table class="table table-bordered table-hover">
					<!-- 사용자 눈에는 안 보이지만, form 태그에 포함해서 서버로 전송할 수 있도록 만듦! -->
					<input type="hidden" value="${dto.idx}" name="idx">
					<tr>
						<td align="center">제목</td>
						<td><input name="title" type="text" value="${dto.title}" class="form-control"></td>
					</tr>
					<tr>
						<td align="center">내용</td>
						<td><textarea name="content" class="form-control" rows="7">${dto.content}</textarea></td>
					</tr>
					<tr>
						<td align="center">작성자</td>
						<td><input name="writer" type="text" value="${dto.writer}" readonly class="form-control"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<a href="/controller/boardList.do">
								<button type="button" class="btn btn-info">목록</button>
							</a>
							<button type="reset" class="btn btn-danger">취소</button>
							<button type="submit" class="btn btn-warning">수정</button>
						</td>
					</tr>
					
	          </table>
		  </form>
       </div>
          <div class="panel-footer">사물지능 - 박병관</div>
        </div>
   </div>

</body>
</html>