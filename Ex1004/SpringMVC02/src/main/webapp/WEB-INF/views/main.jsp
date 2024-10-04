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

					<tbody id="view">

					</tbody>

				</table>

				<a href="boardInsertForm.do">
					<button class="btn btn-info">글쓰기</button>
				</a>

			</div>
			<div class="panel-footer">사물지능 - 박병관</div>
		</div>
	</div>

	<script type="text/javascript">
		
		loadList();
	
		function loadList(){
			// 서버와의 비동기통신
			$.ajax({
				url : "boardList.do", // 요청 URL
				type : "get", // 요청 방식
				dataType : "json",  // 받아올 데이터 타입
				success : makeView, // 통신 성공 시 실행할 함수 -> Call Back 함수(요청이 다 끝나고 나중에 실행되는 함수)
				error : function() {alert("error...");} // 익명 함수
			});
		}
		
		function makeView(data){
			console.log("makeView", data);
			
			let listHTML = "";
			
			for(let i=0; i < data.length; i++){
				// console.log(data[i].title);
				listHTML += "<tr>";
				listHTML += "<td>" + (i+1) + "</td>";
				listHTML += "<td>";
				listHTML += "<a href='javascript:goContent("+ data[i].idx +")'>"
				listHTML += data[i].title + "</a></td>";
				listHTML += "<td>" + data[i].writer + "</td>";
				listHTML += "<td>" + data[i].indate + "</td>";
				listHTML += "<td>" + data[i].count + "</td>";
				listHTML += "</tr>";
				
				listHTML += "<tr id='c"+ data[i].idx +"' style='display:none;'>";
				listHTML += "<td>내용</td>";
				listHTML += "<td colspan='4'>";
				listHTML += "<textarea id='ta"+ data[i].idx +"' readonly rows='7' class='form-control'></textarea>";
				listHTML += "</td>";
				listHTML += "</tr>";
			}
			
			$("#view").html(listHTML);
			
		}
		
		function goContent(idx){
			if($("#c"+idx).css("display") == "none"){
				
				$.ajax({
					url : "boardContent.do",
					type : "get",
					data : {"idx" : idx},
					dataType : "json",
					success : function(data){
						
						console.log("goContent", data);
						$("#ta"+idx).val(data.content);
						
					},
					error : function(){ alert("error..."); }
				});
				
				$("#c"+idx).css("display", "table-row"); // 일반적으로 block 쓰면 되고, tr 태그만 table-row로!
			}else{
				$("#c"+idx).css("display", "none"); 
			}
		}

	</script>

</body>
</html>