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
		<h2>AI School IoT</h2>
		<div class="panel panel-default">
			<div class="panel-heading">IoT List</div>
			<div class="panel-body">
				<table id="tlist" class="table table-bordered table-hover">
					<tr>
						<td>LED1</td>
						<td>
							<button id="btn1on" class="btn">ON</button>
							<button id="btn1off" class="btn">OF</button>
						</td>
					</tr>
					<tr>
						<td>LED2</td>
						<td>
							<button id="btn2on" class="btn">ON</button>
							<button id="btn2off" class="btn">OF</button>
						</td>
					</tr>
					<tr>
						<td>Servo</td>
						<td>
							<input id="servo" type="number" class="form-control" style="width:150px; float:left;">
							&nbsp;&nbsp;
							<button type="button" class="btn">angle</button>
						</td>
					</tr>
				</table>

			</div>
			<div class="panel-footer">사물지능 - 박병관</div>
		</div>
	</div>

	<script type="text/javascript">
	
		loadIot();
		
		function loadIot(){
			$.ajax({
				url : "loadIot",
				type : "get",
				dataType : "json",
				success : makeView,
				error : function(){ alert("error"); }
			});	
		}
		
		function makeView(data){
			console.log(data);
			
			$("#servo").val(data.servo);
			
			if(data.led1 == "ON"){
				$("#btn1on").addClass("btn-primary");
			}else{
				$("#btn1off").addClass("btn-primary");
			}
			
			if(data.led2 == "ON"){
				$("#btn2on").addClass("btn-primary");
			}else{
				$("#btn2off").addClass("btn-primary");
			}
		}
		
	</script>

</body>
</html>