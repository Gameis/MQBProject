<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
	font-size: 16px;
}

td {
	font-size: 13px;
}

.subjectA:link { color: black; text-decoration: none; }
.subjectA:visited { color: black; text-decoration: none; }
.subjectA:hover { color: darkgreen; text-decoration: underline; }
.subjectA:active { color: black; text-decoration: none; }

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>
</head>
<body>

<input type="hidden" id="pg" value="${ requestScope.pg }">
<table id="imageboardListTable" border="1" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th width="100"><input type="checkBox" id="all"/>글번호</th>
		<th width="300">이미지</th>
		<th width="100">상품명</th>
		<th width="100">단가</th>
		<th width="100">개수</th>
		<th width="100">합계</th>
	</tr>
</table>
<input type="button" id="choiceDeleteBtn" value="선택삭제"/>
<div style="width: 750px; text-align: center;" id="imageboardPagingDiv">???</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: '/MQBProject/imageboard/getImageboardList.do',
			type: 'post',
			data: 'pg=' + $('#pg').val(),
			dataType: 'json',
			success: function(data) {
				alert(JSON.stringify(data));
				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>', {
						align: 'center',
					})).append($('<td/>', {
						align: 'center'
					}).append($('<img/>', {
						src: '../storage/' + items.image1,
						alt: items.image1,
						width: '40',
						height: '40'
					}))).append($('<td/>', {
						align: 'center',
						text: items.imageName
					})).append($('<td/>', {
						align: 'center',
						text: items.imagePrice
					})).append($('<td/>', {
						align: 'center',
						text: items.imageQty
					})).append($('<td/>', {
						align: 'center',
						text: items.imagePrice * items.imageQty
					})).appendTo('#imageboardListTable');
					
					$('#imageboardListTable tr:eq('+(index+1)+') > td:eq(0)').append($('<span/>', {
						text: items.seq,
					}));
					
					$('#imageboardListTable tr:eq('+(index+1)+') > td:eq(0) > span').before($('<input>', {
						type: 'checkBox',
						class: 'check'
					}));
					
				});
				
				//페이징 처리
				$('#imageboardPagingDiv').html(data.imageboardPaging);
				
				
			},
			error: function(error) {
				alert("실패");
				console.log(error);
			}
		});
		
		$(document).on('change', '#all', function(){
			if($('#all').is(':checked')) {
				$('.check').prop('checked', true);
			}else {
				$('.check').prop('checked', '');
			}
		});
		
		$('#choiceDeleteBtn').click(function() {
			var seq ='';
			
			for(var i = 0; i < $('.check').length; i++) {
				if($('.check:eq('+ i +')').is(':checked')) {
					$.ajax({
						url: '/MQBProject/imageboard/imageboardDelete.do',
						type: 'post',
						data: 'seq=' + $('.check:eq('+i+')').next().text(),
						success : function() {
							alert("성공");
						},
						error: function() {
							alert("실패");
						}
					});
				}
			}
		});
	});
</script>
<script type="text/javascript">
	function boardPaging(param_pg) {
		location.href = '/MQBProject/board/boardList.do?pg='+param_pg;
	}
</script>
</html>