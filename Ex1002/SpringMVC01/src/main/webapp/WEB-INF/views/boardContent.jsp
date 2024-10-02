<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  추가함! 자동완성 사용하기 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<h2>AI School Board</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Board Insert</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover">
					<tr>
						<td align="center">제목</td>
						<td>${dto.title}</td>
					</tr>
					<tr>
						<td align="center">내용</td>
						<td>
							<textarea readonly="readonly" class="form-control" rows="7" cols="">${dto.content}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">이미지</td>
						<td><img width="200" height="200" src="data:image/jpeg;base64,${dto.img}"></td>
					</tr>
					<tr>
						<td align="center">작성자</td>
						<td>${dto.writer}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<a href="boardList.do">
								<button type="button" class="btn btn-info">목록</button>
							</a>
							<button type="button" onclick="location.href='boardUpdateForm.do/${dto.idx}'" class="btn btn-danger">수정</button>
							<button type="button" onclick="location.href='boardDelete.do?idx=${dto.idx}'" class="btn btn-warning">삭제</button>
						</td>
					</tr>
				</table>

			</div>
			<div class="panel-footer">사물지능 - 박병관</div>
		</div>
	</div>

</body>
</html>