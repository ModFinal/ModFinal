<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 개인정보 수정 </title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<%@ include file="../module/head.jsp" %>
 
<style type="text/css">
 .input-file-button{
  padding: 6px 25px;
  background-color:#0d6efd;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}
</style>
</head>
<body>
 <header></header>
 
 <section class="container">
  <div class="mt-5">
     <div class="mb-5 border-bottom border-2 border-secondary">
        <div class="mb-3">
          <h3> 회원정보 수정 <i class="bi bi-pencil-square"></i></h3>   
        </div>
    </div>
  </div> 
  
  
  <c:url var="myinfoModify" value="/myinfo/modify"/>
  <form id="ajaxform" class="large-form" action="${myinfoModify}" method="post" enctype="multipart/form-data">
 <div class="d-flex">
   <div class="col-sm-4 text-center">
    <div class="mb-4 mt-4">
       <div style="background-color:rgba(233,236,239)">
     
          
<img id="previewImg" class="image-360 mt-5 mb-4" alt="profile" src="<%=request.getContextPath() %>${photo.url}" 
                    width="250" height="250">      
     

			<div class="image-form left">
				<img id="previewImg" class="image-360" alt="여기에는 증명 사진이 배치됩니다." src="${imagePath}">
				<br>
			</div> 

<!--닉네임 value값입력 -->
          <div>
            <input class="text-center mb-3" type="text" name="name" value="${data.name}" size="17">
          </div>

           <div>
           <label class="input-file-button mb-4" for="imgSelect">프로필사진 변경</label>
          <input id="imgSelect" name="photoUpload" type="file" onchange="preview()" style ="display:none;">
          </div> 
          
       </div>
    </div>
  </div>
<!--value값에 값 입력하기 -->	
	<div class="input-form col-sm-7">		    
		<div class="input-group">
		    <label class="input-label w-100">ID</label>
			<input class="form-control  form-control-lg  w-100 mb-3" type="text" name="accountid" value="${data.accountid}" readonly>
		</div>
		<div class="input-group">
			<label class="input-label w-100">비밀번호</label>
			<input class="form-control  form-control-lg w-auto mb-3" type="password" name="password" value="" required>
		</div>
		<div class="input-group">
			<label class="input-label w-100">전화번호</label>
			<input class="form-control  form-control-lg w-auto mb-3" type="number" name="phone" value="${data.phone}" required>
		</div>
		  <div class="input-group">
		  		  
			<label class="input-label w-100">주소</label>
		    <div class="input-group">
			   <input class="form-control mb-3" type="text" id="sample6_postcode" name="address1" value="${data.address1}" placeholder="우편번호"><br>
		    </div>
			<div class="input-group">
			    <input class="form-control mb-3" type="text" id="sample6_address" name="address2" value="${data.address2}" placeholder="주소">	 
			</div>
			 <div class="input-group">
				<input class="form-control mb-3" type="text" id="sample6_detailAddress" name="address3" value="${data.address3}" placeholder="상세주소">
			   <div>		
				<input class="btn btn-primary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" ><br>	 
			   </div>
			 </div>		
		
		    <div class="input-group">
			   <input class="form-control mb-3" type="text" id="sample6_extraAddress" name="address4" value="${data.address4}" placeholder="참고항목">
		  
		 </div>
		</div>	
		<div class="input-group">
			<label class="input-label w-100">이메일</label>
			<input class="form-control   form-control-lg w-auto mb-3" type="text" name="email" value="${data.email}" required>
		</div>
		
  <hr>
<!--회원 탈퇴 경로수정 --> 
	  <div class="text-end">
	    <button class="btn btn-danger" onclick="return unregister();">회원탈퇴</button>   
	  </div>
	</div>	
  </div>
  <hr>
	  <div class="text-end col-sm-11 mb-5 mt-2">
	    <button class="btn btn-primary" onclick="return myInfoCancel();">취 소</button>
	    <button class="btn btn-primary" type="submit">수 정</button>
	  </div>			
 </form>
 </section>

<!--하단 -->
<footer>

</footer>


<script type="text/javascript">



function preview() { previewImg.src=URL.createObjectURL(event.target.files[0]); }

<!--이미지 업로드 미리보기-->
function showImagePreview(e){
	 var file = e.target.files[0];
	 var imgUrl = URL.createObjectURL(file);
	 previewImg.src = imgUrl;	 
}

<!--이미지 업로드 Ajax-->
 function ajaxImageUpload(e){
	 var file  =  e.target.files[0];
	 var fData = new FormData();
	 fData.append("uploadImage", file, file.name);
	 
	 $.ajax({
		 type:"post",
		 enctype:"multipart/form-data",
		 url:"/ajax/imageUpload",
		 data:fData,
		 processData:false,
	     contentType:false,
	     success:function(data, status){
	    	 previewImg.src = data.src;
	     }
	  
	 });
 } 
 
 <!--회원탈퇴 check-->
 <!--경로 수정할것.-->
 function unregister(){
	 if(confirm("회원탈퇴를 진행하시겠습니까?")==true){
		 location.href="/home/myinfo/signout";
	 }else{
		 return false;
	 }
 }
 
<!--취소 check-->
<!--경로 수정할것.-->
function myInfoCancel(){
	if(confirm("수정을 취소 하시겠습니까?") == true){
	    location.href="/home";
	  }else{
		  return false;
	  }
	}
  
<!--완료 check-->
<!--경로 수정할것.-->
 function myInfoModiCheck(form){
	if(confirm("수정하시겠습니까?") == true){
		form.submit();
	    alert("수정이 완료되었습니다.");
	}else{
		return false;
	}
 }
 </script>
 
 
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