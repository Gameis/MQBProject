<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="imageboardWriteForm" enctype="multipart/form-data" method="post" action="/MQBProject/imageboard/imageboardWrite.do">
		<h3>이미지 등록</h3>
		<table border="1" cellpadding="5" cellspacing="0">
			<tr>
				<td align="center" width="100">상품코드</td>
				<td><input type="text" name="imageId" id="imageId" size="35" value="img_"></td>
			</tr>
			<tr>
				<td align="center" width="100">상품명</td>
				<td><input type="text" name="imageName" id="imageName" size="35"></td>
			</tr>
			<tr>
				<td align="center" width="100">단가</td>
				<td><input type="text" name="imagePrice" id="imagePrice" size="35"></td>
			</tr>
			<tr>
				<td align="center" width="100">개수</td>
				<td><input type="text" name="imageQty" id="imageQty" size="35"></td>
			</tr>
			<tr>
				<td align="center" width="100">내용</td>
				<td><textarea cols="35" rows="15" name="imageContent" id="imageContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name="image1" id="image1"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name="image2" id="image2"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="imageboardWriteBtn"value="이미지등록"/>
					<input type="reset" value="다시작성"/>
				</td>
			</tr>
		</table>
	</form>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#imageboardWriteBtn').click(function() {
			$('#imageboardWriteForm').submit();
		});
	});
</script>
</body>
</html>