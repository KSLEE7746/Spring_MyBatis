<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${ pageContext.request.contextPath }/resources/js/formFunction.js"></script>
<script>
	function doList() {
		location.href = "${pageContext.request.contextPath}/board/list.do";
	}
	function doWrite() {
		var w = document.writeForm;
		if (isNull(w.title, '제목을 입력하세요.')) {
			return false;
		}
		if (isNull(w.writer, '작성자를 입력하세요.')) {
			return false;
		}
		if (isNull(w.content, '내용을 입력하세요.')) {
			return false;
		}	
		
		//파일 확장자를 체크		
		if(checkExt(w.attachFile1)){
			return false;
		}		
		if(checkExt(w.attachFile2)){
			return false;
		}		
		
		return true;
	}
	
	function checkExt(obj){
		var forbidName=['exe', 'java', 'jsp', 'js', 'class', 'css'];
		var fileName = obj.value;		
		var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
		console.log(ext);
		
		for(var i = 0; i<forbidName.length; i++){
			if(forbidName[i] == ext){
				alert(ext + '확장자는 파일업로드 정책에 위배됩니다.');
				return true;
			}
		}
		
		return false;
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
			<h2>게시글 등록하기</h2>
			<hr width="100%" />
			<br />

			<form action="${ pageContext.request.contextPath }/board/write.do" method="post" name="writeForm"
				onsubmit="return doWrite()" enctype="multipart/form-data"><%-- 
				<input type="hidden" name="writer" value="${ user.id }" /> --%>
				<table width="100%" border="1">
					<tr>
						<th width="23%">제목</th>
						<td><input type="text" name="title" size="150" /></td>
					</tr>
					<tr>
						<th width="23%">작성자</th><%-- 
						<td>${ user.id }</td> --%>
						<td><input type="text" name="writer" size="50" /></td>
					</tr>
					<tr>
						<th width="23%">내용</th>
						<td><textarea rows="40%" cols="150" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="attachFile1" size="40"><br />
							<input type="file" name="attachFile2" size="40"><br /></td>
					</tr>
				</table>

				<br /> <br /> <input type="submit" value=" 등록 " />&nbsp;&nbsp; <input
					type="button" value=" 목록 " onclick="doList()" />&nbsp;&nbsp;
			</form>
		</div>
<%-- 	</section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp" />
	</footer> --%>
</body>
</html>