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
	<title>결제 페이지</title>
	<%@ include file="../module/head.jsp" %>
 <style type="text/css">
 
      
     .container {
       width: 550px;
       margin: 0 auto;
       }
      
  	 .border-width{
	  width:700px;
	  margin-left : auto;
	  margin-right : auto;
	 }
	 
	 .whole-size{
	  margin: auto;
      min-width: 769px;
	 }
	 
	 .form-label{
	   text-align: left;
	   width:auto;
	   display:block;
	   fontweight: bold;
	   margin-bottom:0.4rem;
	 }
	 
	 .form-input{
	   width:auto;
	   display:block;
	   padding:0.5rem;
	   border:1px solid #CCCCCC;
	   margin-bottom:0.4rem;
	   border-radius: 5px 5px 5px 5px;
	 }
	 	 
	 .form-inline-input{
	  display:inline-block;
	 }
	 
	 .form-size-300{
	   width:300px;
	 }
	 
	  .form-size-610{
	   width:610px;
	 }
	 
	   .form-size-200{
	   width:200px;
	 }
	  .button-left{
	  margin-right: 70px;
	  }
	  
	  input:focus{
	  outline : 1.5px solid  rgba(13, 110, 253, 0.9);
	  }
	 
	 
	
	 
 </style>	
	
</head>
<body>
 <header>
    <%@ include file="../module/navigation.jsp" %>
 </header>
	<%@ include file="../module/categoryNavigation.jsp" %>
  <section class="container whole-size" style="width:750px">
     <div class="mt-5">
     <div class="mb-4 border-bottom border-2 border-secondary border-width">
        <div class="mb-3">
          <h3> <b>결 제</b> <i class="bi bi-credit-card"></i></h3>   
        </div>
    </div>
  </div>
   
<!--주소 Check-->
	<c:url var="payUrl" value="/payment/pay" />
	<form action="${payUrl}" method="post">
	<div style="text-align: center;">
		<div>
			<div class="form-inline-input">
				<label class="form-label">수령인</label>
				<input class="form-input form-size-300 mb-4 cursor" type="text" name="pkgName" placeholder="홍길동" required>
			</div>
		</div>  

		<div>
			<div class="form-inline-input">
				<label class="form-label">전화번호</label>
				<input class="form-input form-size-300 mb-4 cursor" type="number" name="phone" value="${data.phone}" required>
			</div>
		</div>  
      
		<label class="input-label w-100">배송지</label>
		<div>  
		
			<div class="form-inline-input">
			<!-- <label class="form-label">Country</label> -->
				<input class="form-input form-size-200 mb-4 cursor" type="text" name="address1" value="${data.address1}" placeholder="우편번호">
			</div>
			
			<div class="form-inline-input">
         <!--   <label class="form-label">State</label> -->
				<input class="form-input form-size-200 mb-4 cursor" type="text" name="address2" value="${data.address2}" placeholder="주소">         
			</div>
			
			<div class="form-inline-input">
         <!--   <label class="form-label">State</label> -->
				<input class="form-input form-size-200 mb-4 cursor" type="text" name="address3" value="${data.address3}" placeholder="상세주소">
					<div>		
					<input class="btn btn-primary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" ><br>	 
					</div>         
			</div>
			
			<div class="form-inline-input">
         <!--   <label class="form-label">State</label> -->
				<input class="form-input form-size-200 mb-4 cursor" type="text" name="address4" value="${data.address4}" placeholder="참고항목">         
			</div>
			
		</div> 
	</div>
	
		<div>
			<div class="form-inline-input">
				<label class="form-label">결제금액</label>
				<input class="form-input form-size-300 mb-4 cursor" type="number" name="price" value="${data.phone}" required>
			</div>
		</div>  
        
        
          <div class="text-end button-left">
            <button class="btn btn-primary" type="button" onclick="cancel();">취 소</button>
            <button class="btn btn-primary" type="button" id="check_module">결 제</button>
          </div>
       </form>       
  
   
  </section>

 <!--하단--> 
 <%@ include file="../module/footer.jsp" %>
 
 <script type="text/javascript">
 <!--취소버튼-->
  function cancel(){
	if(confirm("결제를 취소하시겠습니까?") === true){
		window.history.back();
	}
	return "/home";
  }
 
 
 <!-- 결제 api 테스트!!!!!!!!!! -->
 <!--결제 버튼-->
 <!--정보입력 빈 칸 방지-->
 
 
 $("#check_module").click(function () {
	var IMP = window.IMP;
	var code = "imp33043558"; //가맹점 식별코드
	/* <c:forEach items="${params}" var="price">
		alert("${item.val}");	// 위에 list나 변수를 선언하고 alert 자리에 담으면 차례대로 값을 받는다.
	</c:forEach> */
	IMP.init(code);
		//결제요청
		IMP.request_pay({
			pg : 'kcp',
			pay_method: 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '결제테스트', // 상품명
			amount : 1 
			,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',  //필수항목
			buyer_addr: '서울특별시 강남구 삼성동',   
			buyer_postcode: '123-456',
			//결제완료후 이동할 페이지 kko나 kkopay는 생략 가능
			m_redirect_url : 'localhost/home'
		}, function(rsp){
			if(rsp.success){//결제 성공시
				var msg = '결제가 완료되었습니다';
				var result = {
				"imp_uid" : rsp.imp_uid,
				"merchant_uid" : rsp.merchant_uid,
				"pay_date" : new Date().getTime(),
				"amount" : rsp.paid_amount,
				"card_no" : rsp.apply_num,
				"refund" : 'payed'
				}
				console.log("결제성공 " + msg);
			}
			else{//결제 실패시
				var msg = '';
				msg += '에러 : ' + rsp.error_msg
			}
			console.log(msg);
			alert(msg);
		});
	});
 
 
  
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