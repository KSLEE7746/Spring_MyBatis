<%@page import="java.util.List"%>
<%@page import="kr.co.bit.board.vo.BoardVO"%>
<%@page import="kr.co.bit.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정 페이지</title>

<link rel="stylesheet" href="/Mission-Web/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/css/board.css" />
<script>
	function doList() {
		location.href = "${ pageContext.request.contextPath }/board/list.do";
	}
</script>
</head>
<body>
	<%-- <header>
		<jsp:include page="/jsp/include/topMenu.jsp" /></header>
	<section> --%>
		<div align="center">
			<br />
			<hr width="100%" />
			<h2>게시판 수정</h2>
			<hr width="100%" />
			<br />
			<form action="${ pageContext.request.contextPath }/board/${board.no}/update.do" method="post">
				<%-- <input type="hidden" name="pageNo" value="${ param.pageNo }" /> <input
					type="hidden" name="check" value="false" /> --%> <input type="hidden"
					name="no" value="${ board.no }" />
				<table width="100%">
					<tr>
						<th width="23%">번호</th>
						<td>${ board.no }</td>
					</tr>
					<tr>
						<th width="23%">제목</th>
						<td><input type="text" name="title" size="50"
							value="<c:out value='${ board.title }'/>" /></td>
					</tr>
					<tr>
						<th width="23%">작성자</th>
						<td>${ board.writer }</td>
					</tr>
					<tr>
						<th width="23%">내용</th>
						<td><textarea rows="7" cols="50" name="content">${ board.content }</textarea></td>
					</tr>				

				</table>

				<br />
				<br /> <input type="submit" value=" 수정 " />&nbsp;&nbsp; <input
					type="button" value=" 목록 " onclick="doList()" />&nbsp;&nbsp;
			</form>
		</div>
<%-- 	</section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp" />
	</footer> --%>
</body>
</html>
