$(function(){
	$.ajax({
		url: '/MQBProject/board/getBoardList.do',
		type: 'post',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				$('<tr/>')
					.append($('<td/>',{
						align: 'center',
						text: items.seq
						
					})).append($('<td/>',{
						
						}).append($('<a/>',{
							href: '#',
							class: 'subjectA',
							id: 'subject_'+items.seq
						}))
					).append($('<td/>',{
						align: 'center',
						text: items.id
						
					})).append($('<td/>',{
						align: 'center',
						text: items.hit
						
					})).append($('<td/>',{
						align: 'center',
						text: items.logtime
						
					})).appendTo($('#boardListTable'));
					
				if(items.pseq == '0')
					$('#subject_' + items.seq).text(items.subject);
				else
					$('#subject_' + items.seq).append($('<img/>', {
						src: '/MQBProject/image/reply.gif',
						alt: 'reply.gif',
						width: '10',
						height: '10'
					})).append($('<span/>', {
						text: items.subject
					}));
				
				for(var i = 0; i < items.lev; i++) {
					$('#subject_' + items.seq + ' img').before('&emsp;');
				}
				
				//로그인 여부
				$('#subject_'+items.seq).click(function(){
					if(data.memId == null){
						alert('먼저 로그인하세요');
					}else{
						location.href='/MQBProject/board/boardView.do?seq='+items.seq+'&pg='+$('#pg').val();      
					}
				});
			});//each
			
			//페이징 처리
			$('#boardPagingDiv').html(data.boardPaging);
		},
		error: function(err){
			console.log(err);
		}
	});
});















