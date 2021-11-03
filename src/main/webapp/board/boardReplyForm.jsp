<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#boardReplyForm div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>

<h3>답글쓰기</h3> 
<form id="boardReplyForm"> 
	<input type="text" name="pg" id="pg" value="${pg }"/>
	<input type="text" name="pseq" id="pseq" value="${pseq }"/>
	<table cellspacing="0" border="1" cellpadding="5">
	<tr>
		<td width="50" align="center">제목</td>
		<td>
			<input type="text" name="subject" id="subject" style="width: 350px;">
			<div id="subjectDiv"></div>
		</td>
	</tr>
	<tr>
		<td width="50" align="center">내용</td>
		<td>
			<textarea name="content" id="content" cols="50" rows="15"></textarea>
			<div id="contentDiv"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" id="boardReplyBtn" value="답글쓰기">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#boardReplyBtn').click(function(){
		alert('버튼~~');
		
		//초기화 과정
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val() == '') {
			$('#subjectDiv').html('제목 입력'); 
			$('#subject').focus();
		}
		else if($('#content').val() == ''){
			$('#contentDiv').html('내용 입력');
			$('#content').focus();
		}
		else 
			$.ajax({
				url: '/MQBProject/board/boardReply.do',
				type: 'post',
				data: $('#boardReplyForm').serialize(),
				success: function(){
					alert("답글쓰기 성공");
					location.href="/MQBProject/board/boardList.do?pg=" + $('#pg').val();
				},
				error: function(err){
					alert("실패");
					console.log(err);
				}
			});
	});
});
</script>







