<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<%@ include file="../module/head.jsp" %>
</head>

<script type="text/javascript">
	/* 아이디 중복 확인 */
 	function idOverlap() {
		console.log("idOverlap 호출")
		console.log("아이디 입력 값 " + $("#id_accountid").val())
		$.ajax({
			url : "idOverlap",
			type : "post",
			data : {"accountid" : $("#id_accountid").val()},
			dataType : "json",
			success : function(data) {
				if(data.code == "fail") {
					alert("이미 사용중인 아이디입니다. 다른 아이디를 입력하세요.");
					$("#button_register").attr("disabled",true); 
				} else if(data.code == "success") {
					alert("사용 가능한 아이디입니다.");
					$("#button_register").removeAttr("disabled"); 
				}
			}
		})
	} 

	
	 
	/* 비밀번호 확인 */
	function passConfirm() {
		var password = document.getElementById('id_password');
		var passwordConfirm = document.getElementById('id_passwordConfirm');
		var confirmMsg = document.getElementById('confirmMsg');
		var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
		var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
		
		if(password.value == passwordConfirm.value) {
			confirmMsg.style.color = correctColor;
			confirmMsg.innerHTML = "비밀번호 일치";
			$("#button_register").removeAttr("disabled"); 
		} else {
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML = "비밀번호 불일치";
			$("#button_register").attr("disabled",true); 
		}
	}
</script>

<body>
	<header class="mb-3"></header>
	<c:url var="mainUrl" value="." />
	<section class="container" style="width: 480px;">
		<c:url var="loginUrl" value="/register" />
		<form action="${loginUrl}" name="register" method="post">
		<div class="center-block">
			<h1 align="center"><a href="/home">지구마켓</a></h1>
		</div>
			<br><br>
			<input type="hidden" name="url" value="${param.url}">
 			<div class="form-floating mb-2">
				<input class="form-control" type="text" id="id_accountid" name="accountid" value="" placeholder="아이디를 입력하세요" required>
				<label for="id_accountid">아이디</label>
				<input type="button" onclick="idOverlap()" value="중복확인" />
			</div>
			<br>
			<div class="form-floating mb-2">
				<input class="form-control" type="password" id="id_password" name="password" value="" placeholder="비밀번호를 입력하세요" required>
				<label for="id_password">비밀번호</label>
			</div>
			<div class="form-floating mb-2">
				<input class="form-control" type="password" id="id_passwordConfirm" name="passwordConfirm" placeholder="비밀번호를 입력하세요" onkeyup="passConfirm()" required>
				<label for="id_passwordConfirm">비밀번호 확인</label>
				<span id ="confirmMsg"></span>
			</div>
			<br>
			
			<div class="form-floating mb-2">
				<input class="form-control" type="text" id="id_name" name="name" value="" placeholder="닉네임을 입력하세요" required>
				<label for="id_name">닉네임</label>
			</div>
			<br>
			<div class="form-floating mb-2">
				<input class="form-control" type="text" id="id_email" name="email" value="" placeholder="이메일을 입력하세요" required>
				<label for="id_email">이메일</label>
			</div>
			<br>
			<div class="form-floating mb-2">
				<input class="form-control" type="text" id="id_phone" name="phone" value="" placeholder="전화번호를 입력하세요" required>
				<label for="id_phone">전화번호</label>
			</div>
			<br>
				
			<div class="input-group">
			   <input class="form-control mb-3" type="text" id="sample6_postcode" name="address1" value="" placeholder="우편번호"><br>
		    </div>
			<div class="input-group">
			    <input class="form-control mb-3" type="text" id="sample6_address" name="address2"  value="" placeholder="주소">	 
			</div>
			 <div class="input-group">
				<input class="form-control mb-3" type="text" id="sample6_detailAddress" name="address3"  value="" placeholder="상세주소(동,호수)">
			   <div>		
				<input class="btn btn-primary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" ><br>	 
			   </div>
			 </div>		
		
		    <div class="input-group">
			   <input class="form-control mb-3" type="text" id="sample6_extraAddress" name="address4"  value="" placeholder="주소 참고항목">
		  
		 </div>
			
			
			<br><br>
			
			<div class="mb-2 text-end">
				<button class="btn btn-outline-primary bluebtn" type="submit" id="button_register" disabled>가입하기</button>
			</div>
			
			<br>
			
		</form>
	</section>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<%@ include file="../module/footer.jsp" %>
	<!--우편번호 API-->
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
     function sample6_execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var addr = ''; // 주소 변수
                 var extraAddr = ''; // 참고항목 변수

                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                 }
  
                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                 if(data.userSelectedType === 'R'){
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if(extraAddr !== ''){
                         extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                     document.getElementById("sample6_extraAddress").value = extraAddr;
                 
                 } else {
                     document.getElementById("sample6_extraAddress").value = '';
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('sample6_postcode').value = data.zonecode;
                 document.getElementById("sample6_address").value = addr;
                 // 커서를 상세주소 필드로 이동한다.
                 document.getElementById("sample6_detailAddress").focus();
             }
         }).open();
     }
</script>
	
	
</body>
</html>