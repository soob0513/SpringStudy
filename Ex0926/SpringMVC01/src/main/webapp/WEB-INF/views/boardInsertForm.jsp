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
       	  <form action="boardInsert.do" method="post">
	          <table class="table table-bordered table-hover">
					<!-- 제목, 내용, 작성자 세 개를 작성해주어야 한다! -->
					<tr>
						<td align="center">제목</td>
						<td><input name="title" type="text" class="form-control"></td>
					</tr>
					<tr>
						<td align="center">내용</td>
						<td><textarea name="content" class="form-control" rows="7"></textarea></td>
					</tr>
					<tr>
						<td align="center">작성자</td>
						<td><input name="writer" type="text" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<a href="boardList.do"><button type="button" class="btn btn-info">목록</button></a>
							<button type="reset" class="btn btn-danger">취소</button>
							<button type="submit" class="btn btn-warning">작성</button>
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