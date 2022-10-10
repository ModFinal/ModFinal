<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품정보</title>

	<%@ include file="../module/head.jsp" %>
	<link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
</head>



<body>
	<header><%@ include file="../module/navigation.jsp" %>
	</header>
	<%@ include file="../module/categoryNavigation.jsp" %>
	<c:url var="boardUrl" value="/board" />
	
	
		<!--  data.buystatus는 board테이블의 buystatus를 이용해 null이면 구매전, id가 들어가있으면 구매자 id
				로그인데이터에서 id를 가져와서 buystatus와 동일하면 내가 구매자.
		 -->
		<c:if test="${not empty data}">
			<c:set var="status" value="${data.buyStatus}"/>
			<c:set var="accountId" value="${loginData.accountid}" />
			<c:set var="uploadId" value="${data.accountId}" />
		</c:if>
		<!-- 목업 확인용 -->
		<c:if test="${data == null}">
			<c:set var="status" value="111"/>
			<c:set var="loginData.accountId" value="111" />
			<c:set var="accountId" value="111" />
			<c:set var="uploadId" value="111" />
		</c:if>
			

	
	<c:if test="${empty data}">
	<section class="container" style="width:1250px;">

				<table class="table">
					<tr>
						<td style="text-align:left; vertical-align : bottom;"><h4>카테고리 > 가전/디지털</h4></td>
						<td style="text-align:right; vertical-align : bottom; color:gray;"><h6>2022년 00월 00일          조회수 : 0회</h6></td>
					</tr>
				</table>
		<div style="width:100%;">
			<div style="float:left;">
				<div style="width:400px; height:400px; background-color:gray;">
					<img id="previewImg" class="image-360" alt="profile" src="https://asset.fujifilm.com/www/kr/files/styles/600x400/public/2021-05/65281e835b2f6b169876a63441a39c7f/pic_xsystem_50.jpg?itok=TF-yhBJI"
                  width="400px" height="400px" style="max-width:400px; max-height:400px;" />
				</div>
			</div>
			<div style="float:left; width:800px; margin-left:5px;">
				<div style="float:right;" onclick="ajaxWishList(id_wishList, ${loginData.accountid});">
					<span class="material-icons" id="id_wishList">
						favorite_border
					</span>
				</div>
				<br><br>
				<h3>제목</h3>
				<br>
				<h4 style="text-align:right;">1,000,000원</h4>
				<hr>
				<label>유형 : 직거래</label>
				<br>
				<label>상태 : 새상품</label>
				<br><br><br>
				
				<c:if test="${empty data.buyStatus} ">
					<c:if test="${not empty loginData}">
						<button class="btn btn-primary" style="float:right;" onclick="location.href='/pay'">바로구매</button>
					</c:if>
				<h4 style="float:right;">판매중</h4>
				</c:if>
				<c:if test="${not empty data.buyStatus}">
				<button class="btn btn-primary" style="float:right; background-color:red;" disabled>구매불가</button>
				<h4 style="float:right;">판매완료</h4>
				</c:if>
			</div>	
		</div>		
		
<br>
			
			<div style="clear:both;">
			<hr>
			
				<h5>상품정보</h5>
				<br><br>
				<p>
					상품에 대한 내용이 들어갈 위치.상품에 대한 내용이 들어갈 위치.
					상품에 대한 내용이 들어갈 위치.상품에 대한 내용이 들어갈 위치.
					상품에 대한 내용이 들어갈 위치.상품에 대한 내용이 들어갈 위치.
					상품에 대한 내용이 들어갈 위치.상품에 대한 내용이 들어갈 위치.
					상품에 대한 내용이 들어갈 위치.상품에 대한 내용이 들어갈 위치.
					상품에 대한 내용이 들어갈 위치.상품에 대한 내용이 들어갈 위치.
					상품에 대한 내용이 들어갈 위치.상품에 대한 내용이 들어갈 위치.
					상품에 대한 내용이 들어갈 위치.상품에 대한 내용이 들어갈 위치.
				</p>
			</div>	
			
			<br><br><br><br><br><br>
			<!-- 판매자아이디 uploadId     로그인한아이디 loginData.accountid    
				 동일할 경우 내가 작성한 게시글이므로 수정 버튼 출력 -->
			<c:if test="${uploadId eq loginData.accountid}">
				<button class="btn btn-primary" style="float:right;" onclick="location.href='/home/board/modify?id=${data.bId}'">게시글 수정</button>
				<br><br>
			</c:if>
			<hr>
			<!-- 
					<div class="mb-1">
						<form action="/board/boardDetail" method="post">
							<input type="hidden" name="bid" value="${bid}">
							<div class="input-group">
								<textarea class="form-control" name="content" rows="2"></textarea>
								<button class="btn btn-outline-dark" type="button" onclick="formCheck(this.form);">등록</button>
							</div>
						</form>
					</div>
			 
			
		
			<c:choose>
				<c:when test="${not empty status}">
					<c:if test="${empty review}">
						<label>후기 미등록</label>
					</c:if>
				</c:when>
				<c:when test="${empty status}">				
					<label>구매하시고 후기를 남겨보세요.</label>
				</c:when>
				
			</c:choose>
			-->
	</section>
	</c:if>
				
	
	
	<c:if test="${not empty data}">
		<section class="container" style="width:1250px;">

				<table class="table">
					<tr>
						<td style="text-align:left; vertical-align : bottom;"><h4>카테고리 > ${data.cateName}</h4></td>
						<fmt:formatDate value="${data.createDate}" var="createDate" dateStyle="long" />
						<td style="text-align:right; vertical-align : bottom; color:gray;"><h6>${data.createDate}          조회수 : ${data.viewCnt}회</h6></td>
					</tr>
				</table>
		<div style="width:100%;">
			<div style="float:left;">
				<div style="width:400px; height:400px; background-color:gray;">
					<img id="previewImg" class="image-360" alt="profile" src="<%=request.getContextPath() %>${data.url}"
                  width="400px" height="400px" style="max-width:400px; max-height:400px;" />
				</div>
			</div>  
			<div style="float:left; width:800px; margin-left:5px;">
				<div style="float:right;" onclick="ajaxWishList(${data.bId});">
						<c:if test="${not empty loginData && loginData.accountid != data.accountId}">
							<span class="material-icons" style = "color:red" id="id_wishList">
								favorite_border
						</c:if>
					</span>
				</div>
				<br><br>
				<h3>${data.bTitle}</h3>
				<br>
				<h4 style="text-align:right;">${data.price}원</h4>
				<hr>
				<label>유형 : ${data.dealMethod}</label>
				<br>
				<label>상태 : ${data.pCondition}</label>
				<br><br><br>
				
				<c:if test="${empty data.buyStatus}">
					<c:if test="${not empty loginData && loginData.accountid != data.accountId}">
						<button class="btn btn-primary" style="float:right;" id ="purchase_btn">바로구매</button>
					</c:if>
				<h4 style="float:right;">판매중</h4>
				</c:if>
				<c:if test="${data.buyStatus != null}">
				<button class="btn btn-primary" style="float:right; background-color:red;" disabled>구매불가</button>
				<h4 style="float:right;">판매완료</h4>
				</c:if>
			</div>	
		</div>		
		
<br>
			
			<div style="clear:both;">
			<hr>
			
				<h5>상품정보</h5>
				<br><br>
				<p>
					${data.bContent}
				</p>
			</div>	
			
			<br><br><br><br><br><br>
			<!-- 판매자아이디 uploadId     로그인한아이디 loginData.accountid    
				 동일할 경우 내가 작성한 게시글이므로 수정 버튼 출력 -->
		
			<c:if test="${uploadId eq myId}">
				<button class="btn btn-primary" style="float:right;" onclick="location.href='/home/board/modify?id=${data.bId}'">게시글 수정</button>
				<br><br>
			</c:if>
			<hr>
			<div style="width:100%; background-color:lightgray;">
				<label style="font-size:20px;">상품 후기</label>
			</div>
			
		

		
		<nav>
			<div>
				<ul class="pagination justify-content-center">
					<c:url var="boardUrl" value="/board/detail">
						<c:param name="id">${data.bId}</c:param>
					</c:url>
					<c:if test="${reviewPage.hasPrevPage()}">
						<li class="page-item">
							<a class="page-link" href="${boardUrl}&page=${reviewPage.prevPageNumber}">Prev</a>
						</li>
					</c:if>
					<c:forEach items="${reviewPage.getPageNumberList(reviewPage.currentPageNumber - 2, reviewPage.currentPageNumber + 2)}" var="num">
						<li class="page-item ${reviewPage.currentPageNumber eq num ? 'active' : ''}">
							<a class="page-link" href="${boardUrl}&page=${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${reviewPage.hasNextPage()}">
						<li class="page-item">
							<a class="page-link" href="${boardUrl}&page=${reviewPage.nextPageNumber}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>
     </section>
	</c:if>
	
			
		<div class="mt-3 mb-3">
		<c:forEach items="${review}" var="review">
			<div class="mb-1"> 
               <div class="card border-light"> 
                   <div class="card-header"> 
                       <div class="d-flex justify-content-between">
	                     <span><small>${review.accountId}</small></span>
			             <span><small>${review.createDate}</small></span>
                       </div>
                     </div>
                     <div class="card-body">
                      <input type="hidden" value="${review.id}">
                         <c:choose>
                         <c:when test="${review.isDeleted()}">
                         <p class="text-muted">삭제된 댓글 입니다.</p>
                         </c:when>
                        <c:otherwise>
	                        <c:set var="newLine" value="<%= \"\n\" %>" />
	                       <p class="card-text">${fn:replace(review.content, newLine, '<br>')}</p>
                        </c:otherwise>
                       </c:choose>
                    <c:if test="${sessionScope.loginData.accountid eq review.accountId}">
							<c:if test="${not review.isDeleted()}">
							<div class="text-end">
					             <button class="btn btn-sm btn-outline-dark" type="button" onclick="changeEdit(this);">수정</button>
						         <button class="btn btn-sm btn-outline-dark" type="button" onclick="reviewDelete(this, ${review.id})">삭제</button>
			                 </div>
			                </c:if>
				         </c:if>				
			        </div>
			      </div>
	            </div>
	           </c:forEach>
	                    
                    
                    <!-- buyId == myId  -> 구매자아이디와 내 아이디가 동일할 경우 내가 구매자이므로 
				     후기 작성 메뉴가 나옴 -->
					<div class="mb-1">
						<form action="../review/add" method="post" autocomplete="off">
							<input type="hidden" name="bid" value="${bId}">
							<div class="input-group">
								<textarea class="form-control" name="content" id="content" rows="2"></textarea>
								<button class="btn btn-outline-dark" type="button" onclick="formCheck(this.form);">등록</button>
							</div>
						</form>
					</div>
			   </div>
	
					
			<c:choose>
				<c:when test="${not empty status}">
					<c:if test="${empty review}">
						<label>후기 미등록.</label>
					</c:if>
				</c:when>
				<c:when test="${empty status}">				
					<label>구매하시고 후기를 남겨보세요.</label>
				</c:when>	
			</c:choose>
		
			<!-- 
				<c:choose>
					<c:when test="${not empty data.buyStatus}">
						<c:if test="${empty review}">
							<div style="width:100%;">
								<label style="text-align:center;">후기 미등록.</label>
							</div>
						</c:if>
					</c:when>
					<c:when test="${empty data.buyStatus}">				
						<div style="width:100%;">
							<label style="text-align:center;">구매하시고 후기를 남겨보세요.</label>
						</div>
					</c:when>	
				</c:choose>
			 -->
		</div>
	
	
	<footer><%@ include file="../module/footer.jsp" %></footer>
	
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js">
	
	var puchase_btn = document.getElementById("puchase_btn");

	 puchase_btn.addEventListener("click", function purchase() {
	 	 IMP.init('imp16851710');  // 가맹점 식별코드
		
		 IMP.request_pay({
		     pg : 'kakaopay',
		     pay_method : 'kakaopay',
		     merchant_uid : 'ORD20180131'+ new Date().getTime(),
		     amount : "${data.price}",
		     buyer_tel: "${loginData.phone}" + '-0000' + '-0000'
		     
		 }, function (rsp) { // callback
	          if (rsp.success) {
	        	  console.log(rsp.imp_uid);
	              $.ajax({
	            	 type:"post",
	            	 url: "<%=request.getContextPath()%>/board/pay",
	            	 data: {
	            		 bId: ${data.bId}
	            	 },
	            	 success:function(data) {
	            		 if(data.code == done)
	                     alert(data.message);
	            		 location.href = "/board/detail?id=${data.bId}"
	            	 } if else(data.code == fail) {
	            		 alert(data.message)
	            		 location.href = "/board/detail?id=${data.bId}"
	            	 }
	            	  
	              });
	          } else {
	        	  var msg = '결제에 실패하였습니다.';
	              msg += '에러내용 : ' + rsp.error_msg;
	              alert(msg);
	          }
	      });
	    }
	 , false);
	
	</script>
	<script type="text/javascript">
	
	var spanValue =  document.getElementById("id_wishList");

	function ajaxWishList(bId) {
		$.ajax({
			type: "post",
			url: "<%=request.getContextPath()%>/board/wishList",
			data: {
				bId : bId
				
			},
			success: function(data) {
				
				if(data.code === 'like') {
					/* 찜목록에 들어갔을 경우 */
					spanValue.innerHTML = 'favorite';
				}
				else if(data.code === 'unlike') {
					/* 찜목록에서 제거되었을 경우 */
					spanValue.innerHTML = 'favorite_border';
					
				} else if (data.code === 'fail') {
					alert(data.message);
					location.href = "<%=request.getContextPath()%>/board/detail"
				
				}
			}
				
			
		});
	}

	
	
		function changeEdit(element) {
			element.innerText = "확인";
			element.nextElementSibling.remove();
			
			var value = element.parentElement.previousElementSibling.innerText;
			var textarea = document.createElement("textarea");
			textarea.setAttribute("class", "form-control");
			textarea.value = value;
			
			element.parentElement.previousElementSibling.innerText = "";
			element.parentElement.previousElementSibling.append(textarea);
			
			element.setAttribute("onclick", "reviewUpdate(this);");
		}
		    function changeText(element) {
			element.innerText = "수정";
			var cid = element.parentElement.parentElement.children[0].value;
			var value = element.parentElement.previousElementSibling.children[0].value;
			element.parentElement.previousElementSibling.children[0].remove(); //기존의 것 삭제
			element.parentElement.previousElementSibling.innerText = value;
			
			var btnDelete = document.createElement("button");
			btnDelete.innerText = "삭제";
			btnDelete.setAttribute("class", "btn btn-sm btn-outline-dark");
			btnDelete.setAttribute("onclick", "reviewDelete(this, " + cid + ");");
			
			element.parentElement.append(btnDelete);
			element.setAttribute("onclick", "changeEdit(this);");
		}
		function reviewUpdate(element) {
			var cid = element.parentElement.parentElement.children[0].value;
			var value = element.parentElement.previousElementSibling.children[0].value;
			
			$.ajax({
				url: "/home/review/modify",
				type: "post",
				data: {
					id: cid,
					content: value
				},
				success: function(data) {
					element.parentElement.previousElementSibling.children[0].value = data.value
					changeText(element);
				}
			});
		}
		
		function reviewDelete(element, id) {
			$.ajax({
				url: "/home/review/delete",
				type: "post",
				data: {
					id: id
				},
				success: function(data) {
					if(data.code === "success") {
						element.parentElement.parentElement.parentElement.parentElement.remove();
					}
				}
			});
		}
		function formCheck(form) {
			if(form.content.value.trim() === "") {
				alert("댓글 내용을 입력하세요.");
			} else {
				form.submit();
			}
		}
		
		function favoriteTest() {
			if(id_wishList.innerHTML === 'favorite') {
				id_wishList.innerHTML = 'favorite_border';
				}
			else id_wishList.innerHTML = 'favorite';

		}
		
		
		
	</script>

</body>
</html>