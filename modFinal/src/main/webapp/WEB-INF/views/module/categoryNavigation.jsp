<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../module/head.jsp" %>

<c:url var="mainUrl" value="." />

		
		<table class="table">
			<tr style="text-align:center;">
				<td><a class="dropdown-item" href="/home/main/list?type=1">가전/디지털</a></td>
				<td><a class="dropdown-item" href="/home/main/list?type=2">의류</a></td>
				<td><a class="dropdown-item" href="/home/main/list?type=3">가방</a></td>
				<td><a class="dropdown-item" href="/home/main/list?type=4">액세서리</a></td>
				<td><a class="dropdown-item" href="/home/main/list?type=5">유아/출산</a></td>
				<td><a class="dropdown-item" href="/home/main/list?type=6">반려동물상품</a></td>
				<td><a class="dropdown-item" href="/home/main/list?type=7">가구</a></td>
				<td><a class="dropdown-item" href="/home/main/list?type=8">뷰티/미용</a></td>
				<td><a class="dropdown-item" href="/home/main/list?type=9">사무용품</a></td>
				<td><a class="dropdown-item" href="/home/main/list?type=10">예술/악기</a></td>
			</tr>
		</table>