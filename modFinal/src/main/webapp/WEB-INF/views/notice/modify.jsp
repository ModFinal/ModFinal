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
	<title>공지사항 수정</title>
	<%@ include file="../module/head.jsp" %>
</head>
<body class="d-flex flex-column min-vh-100">
    <header>
    <%@ include file="../module/navigation.jsp" %>
 </header>
	<%@ include file="../module/categoryNavigation.jsp" %> 
	
	
   <section class="container">
   <div class="mt-5">
     <h5>공지사항 수정 <i class="bi bi-pencil-square"></i></h5>
   </div> 
       <div class="mt-4">
       <c:url var="noticeUrl" value="/notice"/>
       <c:url var="noticeModifyUrl" value="/notice/modify"/>
          <form action="${noticeModifyUrl}" method="post">
<!--value에 data.noticeId // 어떤게시물에대한 수정인지 확인하기위한 hidden input-->          
           <input type="hidden" name ="notId" value="${data.notId}">
             <div class="mb-3">
<!--value에 data.title -->            
                <input class="form-control" type="text" name="title" value="${data.title}" placeholder="제목을 입력하세요">
             </div>
             <hr>
             <div class="mb-3">
<!--data.content -->                
                 <textarea class="form-control" name="content" rows="15"
                  placeholder="내용을 입력하세요">${data.content }</textarea>
             </div>
             <div class="mb-3 text-end">
                <button class="btn btn-primary" type="button" onclick="return addCancel();">취 소</button>
                <button class="btn btn-primary" type="submit" onclick="modifyCheck(this.form);">수 정</button>
             </div>
          </form>
       </div> 
   </section>
   
   
<!--하단페이지-->  
<%@ include file="../module/footer.jsp" %>

<script type="text/javascript">

<!-- 수정 완료 로케이션check -->
 function modifyCheck(form){
	 if(form.title.value === undefined || form.title.value.trim() ===""){
		 alert("제목을 입력해주세요");
		 return false;
	 }else{
		 if(confirm("수정 하시겠습니까?") == true){
		     form.submit();
		     alert("수정이 완료되었습니다.");
		     location.href="${noticeUrl}";
		 }else{
			 return false;
		 }
	 }
 }
 
<!-- 수정 취소  로케이션check -->
 function addCancel(){
	 if(confirm("수정을 취소 하시겠습니까?") == true){
		 location.href="${noticeUrl}"; 
	   }else{
		  return false;
	   }
	 }
 
 
</script>   
</body>
</html>