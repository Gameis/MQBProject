<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<table id="productListTable" border="1" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th width="100">번호</th>
		<th width="100">이미지</th>
		<th width="100">상품명</th>
		<th width="100">단가</th>
		<th width="100">개수</th>
		<th width="100">합계</th>
		<th width="100">할인율</th>
		<th width="100">할인액</th>
		<th width="100">가격</th>
	</tr>
</table>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: '/MQBProject/product/getProductList.do',
			type: 'post',
			data: 'pg=' + $('#pg').val(),
			dataType: 'json',
			success: function(data) {
				alert(JSON.stringify(data));
				$.each(data.list, function(index, items){
					$('<tr>').append($('<td>', {
						text: items.seq,
						align: 'center'
					})).append($('<td>', {
						
					}).append($('<img>', {
						src: '../storage/' + items.img,
						alt: items.img
					}))).append($('<td>', {
						text: items.name,
						align: 'center'
					})).append($('<td>', {
						text: items.unit,
						align: 'center'
					})).append($('<td>', {
						text: items.qty,
						align: 'center'
					})).append($('<td>', {
						text: items.total,
						align: 'center'
					})).append($('<td>', {
						text: items.rate + '%',
						align: 'center'
					})).append($('<td>', {
						text: items.discount,
						align: 'center'
					})).append($('<td>', {
						text: items.price,
						align: 'center'
					})).appendTo($('#productListTable'))
				});
				
			},
			error: function(error) {
				alert("실패");
				console.log(error);
			}
		});
		
	
		
	});
</script>
</html>