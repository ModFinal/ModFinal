<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 수정</title>
	<%@ include file="../module/head.jsp" %>
<c:url var="ckeditor" value="/static/ckeditor" />
	<script type="text/javascript" src="${ckeditor}/ckeditor.js"></script>
	
</head>
<body>
	<header></header>
	<br><br><br><br><br><br>
	<section class="container">
	<div class="mb-1">
	<c:url var="boardAddUrl" value="/board/modify" />
	<form action="${boardAddUrl}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bId" value="${data.bId}">
	<table class="table">
		<tr>
			<th>대표 이미지</th>
			<th><img id="previewImg" class="image-360 mt-5 mb-4" alt="profile" src="<%=request.getContextPath()%>${data.url}" width="250" height="250"></th>
			<th><input id="imgSelect" name="photoUpload" type="file" onchange="preview()"></th>
			<th></th>
		</tr>
		
		<tr>
			<th>제목</th>
			<th><input class="form-control" type="text" name="bTitle" placeholder="제목을 입력하세요." size="5" value="${data.bTitle}"></th>
			<th></th>
			<th></th>
		</tr>
		
		<tr>
			<th>카테고리</th>
			<th><select class="form-select" id="id_category" name="cateId" >
					<option>카테고리 선택</option>
					<c:forEach items="${cData}" var="category" >
						<option value="${category.cateId}">[${category.cateId}] ${category.cateName}</option>
					</c:forEach>
				</select></th>
			<th></th>
			<th></th>
		</tr>
		
		<tr>
			<th>내용</th>
			<th colspan="3"><textarea name="bContent" rows="10" cols="100" placeholder="내용을 입력해주세요." >${data.bContent}</textarea></th>
		</tr>
		
		<tr>
			<th>유형</th>
			<th><input type="radio" name="dealMethod" value="직거래" checked>직거래</th>
			<th><input type="radio" name="dealMethod" value="택배거래">택배거래</th>
			<th></th>
		</tr>
		<tr>
			<th>가격</th>
			<th><input class="" type="text" name="price" placeholder="가격을 입력하세요." value="${data.price}"></th>
			<th></th>
			<th></th>
		</tr>
		
		<tr>
			<th>유형</th>
			<th><input type="radio" name="pCondition" value="새상품" checked>새상품</th>
			<th><input type="radio" name="pCondition" value="중고">중고상품</th>
			<th>　　　　　　　</th>
		</tr>
		
	</table>
		<button class="btn btn-primary" onclick="location.href='/home'">취소</button>
		<button class="btn btn-primary" type="submit">수정완료</button>
		<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#removeModal">삭제</button>
	</div>
	<div class="modal fade" id="removeModal" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title">삭제 확인</h6>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						해당 데이터를 삭제하겠습니까?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal" onclick="deleteBoard(${data.bId})">확인</button>
					</div>
				</div>
			</div>
		</div>
	
	</form>
	</section>
	<c:url var="upload" value="/upload/image" />
	<script type="text/javascript">
	
	CKEDITOR.replace("bContent", {
		filebrowserUploadUrl: "${upload}?type=image"
	})
	
	function preview() { previewImg.src=URL.createObjectURL(event.target.files[0]); }
	
	function deleteBoard(id) {
		$.ajax({
			url: "<%=request.getContextPath()%>/board/delete",
			type: "post",
			data: {
				id: id
			},
			dataType: "json",
			success: function(data) {
				if(data.code === "success") {
					alert("삭제 완료");
					location.href = "/home";
				} else if(data.code === "permissionError") {
					alert("권한이 오류");
				} else if(data.code === "notExists") {
					alert("이미 삭제되었습니다.")
				}
			}
		});
	}
			
$(document).ready(function(){
	 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=chk_type]").click(function(){
 
        if($("input[name=chk_type]:checked").val() == "directdelivery"){
            $("input:text[name=location]").attr("disabled",false);
           //직거래일경우 텍스트박스 활성화
 
        }else if($("input[name=chk_type]:checked").val() == "delivery"){
              $("input:text[name=location]").attr("disabled",true);
            //택배거래일경우 텍스트박스 비활성화
        }
    });
});

</script>
</body>
</html>