<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function addFavorite(){
		try {
			window.external.AddFavorite('http://localhost:8000/Mission-Spring', '더페이스샵');
		} catch (e) {
			alert("현재 브라우저에서는 사용할 수 없습니다.\n크롬에서는 ctrl + d를 사용해주세요.");
		}
	}
</script>
<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2" style="width:120px; height:72px;"><a href="<%=request.getContextPath()%>"><img src="/Mission-MVC01/img/logologox125.png"></a></td>
		<td colspan="2" align="right">
		<a href="#" onclick="addFavorite()">즐겨찾기</a>||
		<c:if test="${ not empty user }">
			[${user.id}님 환영합니다.]		
		</c:if>		
		</td>
	</tr>
	<tr>		
		<td>
		<c:if test="${ user.type eq 'S' }">
		 <a href="<%=request.getContextPath()%>/memberList.do">회원관리</a> ||
		</c:if>
		 <a href="<%=request.getContextPath()%>/list.do">게시판</a> ||
		<c:choose>
		<c:when test="${ empty user }">
			 <a href="<%=request.getContextPath()%>/joinForm.do">회원가입</a> ||
			 <a href="<%=request.getContextPath()%>/login.do">로그인</a> ||
		</c:when>
		<c:otherwise>
			 <a href="<%=request.getContextPath()%>/myPage.do?id=${ user.id }">마이페이지</a> ||
			 <a href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
		</c:otherwise>		
		</c:choose>
		</td>
	</tr>
</table>