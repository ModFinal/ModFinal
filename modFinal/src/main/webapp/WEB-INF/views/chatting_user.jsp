<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang= "ko">
<head>
	<meta charset="UTF-8">
	<title>판매글 문의하기</title>

	<%@ include file="./module/head.jsp" %>
	<link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<header><%@ include file="./module/navigation.jsp" %>
	</header>
	<%@ include file="./module/categoryNavigation.jsp" %>
	<section class="container">
		<div style="height:500px; overflow:scroll;" id="id_chat" >
		</div>
		<div>
			<form onsubmit="return sendMessage(this.context);">
				<input type="text" id="id_context" name="context">
				<button type="submit">전송</button>
			</form>
		</div>
	</section>

</body>
<script type="text/javascript">
	ws = new WebSocket("ws://localhost/home/chatting/cs");
	ws.onopen = function() {
		console.log("Chatting Server Connection...");
	};
	ws.onmessage = function(data) {
		console.log(data);
		id_chat.innerHTML += data.data;
		id_chat.scrollTo(0, id_chat.scrollHeight);
	};
	ws.onclose = function() {
		console.log("Chatting Server Close...");
	};
	
	function sendMessage(element) {
		vlaue = element.value;
		element.value = "";
		ws.send(value);
		element.focus();
		return false;
	}

</script>
</html>