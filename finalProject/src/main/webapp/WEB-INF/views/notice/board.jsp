<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/temp/script.jspf" %>
<%@ include file="/WEB-INF/views/temp/header.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".noticeviewtitle4").click(function() {
		 	$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/notice/boardView",
				data : {
					notice_no: $(this).val(),
				},
				success : function(result) {
					$("#test").html(result);
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		});
		
		$("#savebutton").click(function() {
			var t=$("#p_notice_mdtitle").val();
			var c=$("#p_notice_contents").val();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/notice/boardWrite",
				data:{
					title:t,
					contents:c
				},
				success:function(){
					alert("공지사항 작성");
					window.location.href="${pageContext.request.contextPath}/notice/board";
				},
				error:function(){
					alert("에러데스");
				}
			});
		});
		
	});
</script>
</head>
<body>

<%-- 	<table border="1" width="800px" height="600px">
		<tr>
			<td>No</td><td>Title</td><td>Date</td><td>Writer</td>
		</tr>
		<c:forEach items="${notice_list}" var="i">
			<tr>
				<td>${i.num }</td>
				<td>
				<c:forEach begin="1" end="${i.depth }" step="1">
					&nbsp;&nbsp;&nbsp;
				</c:forEach>
				<a href="boardView?num=${i.num}">${i.title }</a></td>
				<td>${i.reg_date }</td>
				<td>${i.writer}</td>
			</tr>
		
		</c:forEach>
	</table> --%>
	<div class="container">
	<table class="table table-hover" id="MozipTablelist">
						<thead>
							<tr>
								<th class="mozipListTh">작성자</th>
								<th class="mozipListTh">제목</th>
								<th class="mozipListTh">날짜</th>
							</tr>
						</thead>
						<!--     [D] 게시물 뿌려주는 for문    -->

						<c:forEach var="i" items="${notice_list}">
							<tbody id="MozipViewtitle">
							</tbody>
							<tr>
								<td>${i.writer}</td>
								<td><button type="button" 
										class="btn btn-link btn-lg noticeviewtitle4" data-toggle="modal"
										data-target="#noticeview" value="${i.notice_no}">${i.title}</button></td>
								<td>${i.reg_date}</td>
							</tr>
						</c:forEach>

					</table>
					<c:if test="${not empty admin }">
						<input class="btn btn-warning" data-toggle="modal" data-target="#p_noticeWritemodal" type="button" value="글쓰기" id="write" style="float: right;">
					</c:if>
	</div>
	
	
	<div id="p_page_center">
	<c:if test="${page.curBlock>1 }">
		<a href="boardList?curPage=${page.startNum-1 }">[prev]</a>
	</c:if>
	<c:forEach begin="${page.startNum }" end="${page.lastNum }" step="1" var="i">
		<a href="boardList?curPage=${i}">${i }</a>
	</c:forEach>
	
	<c:if test="${page.curBlock < page.totalBlock }">
		<a href="boardList?curPage=${page.lastNum+1 }">[next]</a>
	</c:if>
	</div>
</body>
</html>



<!--notice write Modal -->
<div class="modal fade" id="p_noticeWritemodal" style="margin-top: 340px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" id="p_qna_md_2">
      <form method="post">
    <div class="modal-content" id="p_qna_md_3">
		     	<div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">공지 사항</h4>
     			</div>
     				<input type="hidden" id="p_notice_m_img" name="m_img" value="${member.m_img}">
					<input type="text" id="p_notice_mdtitle" name="title" style="margin-left: 15px;width: 567px;margin-top: 10px;" placeholder="제목을 입력하세요.">
							<div class="modal-body">
					<textarea name="contents" id="p_notice_contents" rows="10" cols="100" style="width: 568px; height: 200px;"></textarea>
							</div>
		      <div class="modal-footer" id="p_qna_footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" id="savebutton" class="btn btn-primary">Save</button>
		      </div>
		      </div>
		</form>
    
    </div>
  </div>


<!-- mozip view&수정 modal  -->
					<div class="modal fade" id="noticeview" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content" id=momomo1>
										<div id="test"></div>
							</div>
						</div>
					</div>



















