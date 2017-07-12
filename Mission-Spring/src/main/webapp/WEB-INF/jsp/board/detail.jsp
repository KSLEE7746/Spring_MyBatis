<%@page import="java.util.List"%>
<%@page import="kr.co.bit.board.vo.BoardVO"%>
<%@page import="kr.co.bit.board.dao.BoardDAO"%>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function doAction(type) {
		switch (type) {
		case 'U':
			location.href="${ pageContext.request.contextPath }/board/${board.no}/update.do";
			break;
		case 'D':
			if(confirm("${board.no}번 게시물을 삭제하시겠습니까?"))
				location.href = "${ pageContext.request.contextPath }/board/${board.no}/delete.do";
			break;
		case 'L':
			location.href = "${ pageContext.request.contextPath }/board/list.do";
			break;
		}

	}	
	
</script>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css" />
</head>
<body>
	<%-- <header>
		<jsp:include page="/jsp/include/topMenu.jsp" /></header>
	<section> --%>

		<div align="center">
			<br />
			<hr width="100%" />
			<h2>상세 페이지</h2>
			<hr width="100%" />
			<br /> <input type="hidden" name="no" value="${ board.no }" />
			<table width="100%" border="1">
				<tr>
					<th width="25%">번호</th>
					<td>${ board.no }</td>
				</tr>
				<tr>
					<th width="25%">제목</th>
					<td>${ board.title }</td>
				</tr>

				<tr>
					<th width="25%">작성자</th>
					<td>${ board.writer }</td>
				</tr>
				<tr>
					<th width="25%">조회수</th>
					<td>${ board.viewCnt }</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>${ board.content }</td>
				</tr>
				<tr>
					<th width="25%">등록일</th>
					<td>${ board.regDate }</td>
				</tr>
				 <tr><th>첨부파일</th>
					<td>
					<c:forEach items="${ fileList }" var="file">
					<a href = "<%=request.getContextPath()%>/fileDown.do?fileName=${ file.file_save_name }&fileOriName=${file.file_ori_name}&no=${ param.no}">
					${ file.file_ori_name }</a>&nbsp;(${file.file_size} bytes)<br/>
					</c:forEach>
					</td>
				</tr> 
			</table>
			<br /> <br /> <br /> 			<%-- 
			<c:if test="${user.id eq board.writer }"> --%>
				<input type="button" value="수정" onclick="doAction('U')" />&nbsp;&nbsp; 
			<%-- </c:if>			
			<c:if test="${ user.id eq 'admin' or user.id eq board.writer }">
				 --%><input type="button" value="삭제" onclick="doAction('D')" />&nbsp;&nbsp; 
			
			<%-- </c:if> --%>
			<input type="button" value="목록" onclick="doAction('L')" />
		</div>
<%-- 	</section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp" />
	</footer> --%>
</body>
</html>

