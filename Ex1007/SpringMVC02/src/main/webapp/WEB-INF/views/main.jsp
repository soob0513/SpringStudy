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
				<table id="tlist" class="table table-bordered table-hover">
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

				<!-- form : submit => 동기통신, action x -->
				<div class="panel-body" id="wform" style="display:none;">
					<form id="frm">
						<table class="table">
							<tr>
								<td>제목</td>
								<td><input type="text" id="title" name="title" class="form-control"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea class="form-control" id="content"  name="content" rows="7"
										cols=""></textarea></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" id="writer"  name="writer" class="form-control"></td>
							</tr>
							<tr align="center">
								<td colspan="2">
									<button class="btn btn-success btn-sm" type="button"
										onclick="goInsert()">등록</button>
									<button class="btn btn-warning btn-sm" type="reset" id="fclear">취소</button>
									<button class="btn btn-info btn-sm" type="button"
										onclick="goList()">리스트로가기</button>
								</td>
							</tr>
						</table>
					</form>
				</div>

				<button class="btn btn-info" onclick='goWriteForm()'>글쓰기</button>


			</div>
			<div class="panel-footer">사물지능 - 박병관</div>
		</div>
	</div>

	<script type="text/javascript">
		
		loadList();
	
		function loadList(){
			
			// 리스트는 보이고, 글쓰기 양식은 안보이도록!
			goList();
			
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
				listHTML += "<td id='t"+data[i].idx+"'>";
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
				
				listHTML += "<br>";
				listHTML += "<span id='ub"+data[i].idx+"'>";
				listHTML += "<button class='btn btn-sm btn-success' onclick='goUpdateForm("+data[i].idx+")'>수정화면</button>";
				listHTML += "</span>";
				
				listHTML += "<button class='btn btn-sm btn-warning' onclick='goDelete("+data[i].idx+")'>삭제</button>";
				
				listHTML += "</td>";
				listHTML += "</tr>";
			}
			
			$("#view").html(listHTML);
			
		}
		
		function goInsert(){
			// 사용자가 작성한 제목, 내용, 작성자 => 서버로 전송
			// var title = $("#title").val();
			// var content = $("#content").val();
			// var writer = $("#writer").val();
			
			var frm = $("#frm").serialize();
			console.log("frm", frm);
			
			$.ajax({
				url : "boardInsert.do",
				type : "post",
				data : frm,
				success : loadList,
				error : function(){ alert("error"); }
			});
			
			// form에 reset 버튼이 자동으로 눌리도록! => trigger
			$("#fclear").trigger("click");
			
		}
		
		function goWriteForm(){
			// 글 작성하는 양식이 보이도록! (아이디가 wform인 div 태그)
			// display : inline(a,span), block(div, p) 
			$("#wform").css("display", "block");
			$("#tlist").css("display", "none");
		}
		
		function goList(){
			$("#wform").css("display", "none");
			$("#tlist").css("display", "table");
		}
		
		// boardDelete.do?idx=1 => 쿼리스트링 방식(RequestParam 사용)
		// boardDelete.do/idx => 경로 변수 (PathVariable)
		// GET, DELETE => 서버로 파라미터를 보낼 때 HEAD에 담김!
		// PUT, POST => BODY에 담김
		function goDelete(idx){
			$.ajax({
				url : "boardDelete.do/"+idx,     // 경로 변수 (PathVariable)
				type : "delete",
				success : loadList,
				error : function(){ alert("error"); }
			});
		}

		function goUpdateForm(idx){
			// 1. textarea => readonly 없애기
			$("#ta"+idx).attr("readonly", false);
			
			// 2. 제목(a -> input)
			// text() : 태그 사이에 작성된 텍스트만 가져오기
			// html() : 태그 사이에 작성된 텍스트 + html 태그 가져오기
			// val() : input 태그에 작성된 값 가져오기
			
			// text("a") : 태그 사이에 텍스트 추가
			
			var title = $("#t"+idx).text();
			var newInput = "<input id='ni"+idx+"' type='text' class='form-control' value='"+title+"'>";
			$("#t" + idx).html(newInput);
			
			
			// 3. 수정화면 버튼 => 수정 버튼
			var newButton = "<button class='btn btn-sm btn-primary' onclick='goUpdate("+idx+")'>수정</button>";
			$("#ub"+idx).html(newButton);
			
		}
		
		function goUpdate(idx){
			// 새로 입력한 타이틀, 내용 가져오기
			var title = $("#ni"+idx).val();
			var content = $("#ta"+idx).val();
			
			console.log("title", title);
			console.log("content", content);
			
			// 수정 요청
			// data : JSON 형식의 문자열로 구성
			$.ajax({
				url : "boardUpdate.do",
				type : "put",  //수정 요청
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify({"idx" : idx, "title" : title, "content" : content}),
				//success : function(data){console.log(data);},
				success : loadList,
				error : function(){alert("error");}
			});			
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