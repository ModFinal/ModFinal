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
	<title>공지사항 작성</title>
	<%@ include file="../module/head.jsp" %>
</head>
<body>
  <header>
    <%@ include file="../module/navigation.jsp" %>
 </header>
	<%@ include file="../module/categoryNavigation.jsp" %> 
  
   <section class="container">
   <div class="row mt-5"> 
    <h5>공지사항 작성 <i class="bi bi-pencil-square"></i></h5>
       <div class="mt-4">
       
 <!--로케이션 주소체크 -->         
       <c:url var="noticeAddUrl" value="/notice/add"/>
          <form action="${noticeAddUrl}" method="post">
             <div class="mb-3">
                <input class="form-control" type="text" name="title" placeholder="제목을 입력하세요.">
             </div>
             <hr>
             <div class="mb-3">
                 <textarea class="form-control" name="content" rows="15"
                  placeholder="내용을 입력하세요"></textarea>
             </div>
             <div class="mb-3 text-end">
                <c:url var="noticeUrl" value="/notice"/>
                <button type="button" class="btn btn-primary" onclick="addCancel();">취소</button>
                <button type="submit" class="btn btn-primary" onclick="addComplete(this.form);">완료</button>
             </div>
          </form>
       </div>
    </div>       
   </section>
   
<!--하단페이지-->    
<%@ include file="../module/footer.jsp" %> 

<script type="text/javascript">	     

 <!--취소 로케이션주소확인--> 
  function addCancel(){
	 if(confirm("작성을 취소 하시겠습니까?") == true){
		 location.href="${noticeUrl}";
	   }else{
		  return false;
	   }
	 }
  
  
<!--완료 창 로케이션주소확인-->
  function addComplete(form){
	 if(form.title.value === undefined || form.title.value.trim() ===""){
		 alert("제목과 내용을 반드시 입력해 주세요.");
		 return false;
	 }else{
		 if(confirm("저장하시겠습니까?") == true){
			 form.submit();
			 alert("저장이 완료되었습니다.");
			 location.href="${noticeUrl}";
		 }else{
			 return false;
		 }
	 }
  }
  </script> 
</body>
</html>