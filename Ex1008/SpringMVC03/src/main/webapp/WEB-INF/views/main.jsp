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
							<button onclick="ledDo('LED1', 'ON')" id="btn1on" class="btn">ON</button>
							<button onclick="ledDo('LED1', 'OFF')" id="btn1off" class="btn">OFF</button>
						</td>
					</tr>
					<tr>
						<td>LED2</td>
						<td>
							<button onclick="ledDo('LED2', 'ON')" id="btn2on" class="btn">ON</button>
							<button onclick="ledDo('LED2', 'OFF')" id="btn2off" class="btn">OFF</button>
						</td>
					</tr>
					<tr>
						<td>Servo</td>
						<td>
							<input id="servo" type="number" class="form-control" style="width:150px; float:left;">
							&nbsp;&nbsp;
							<input type="range" id="servoRange" oninput="servoRange()" min="0" max="180" style="width:200px; float:left;margin-top:10px;margin-left:10px;">
							<button type="button" onclick="servoDo()" class="btn">angle</button>
						</td>
					</tr>
				</table>

			</div>
			<div class="panel-footer">사물지능 - 박병관</div>
		</div>
	</div>

	<script type="text/javascript">
		// 자바스크립트에서 콜백함수를 사용할 때에는 ()를 붙이지 않는다!
		
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
			
			$("#btn1on").removeClass("btn-primary");
			$("#btn1off").removeClass("btn-primary");
			$("#btn2on").removeClass("btn-primary");
			$("#btn2off").removeClass("btn-primary");
			
			$("#servo").val(data.servo);
			$("#servoRange").val(data.servo);
			
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
		
		function ledDo(LED, POWER){
			
			$.ajax({
				url : "ledDo",
				type : "get",
				data : {"LED" : LED, "POWER" : POWER},
				success : loadIot,
				error : function(){ alert("error"); }
			});
			
		}
		
		function servoRange(){
			$("#servo").val($("#servoRange").val());
		}
		
		function servoDo(){
			
			var servo = $("#servoRange").val();
			
			// console.log(servo);
			
			$.ajax({
				url : "servoDo",
				type : "get",
				data : {"SERVO" : servo},
				success : loadIot,
				error : function(){alert("error");}
			});
		}
		
	</script>

</body>
</html>