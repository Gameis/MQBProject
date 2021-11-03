$(function(){
	//회원가입
	$('#writeBtn').click(function(){
		alert('버튼');
		
		$('#nameDiv').empty();
		$('#writeForm  #idDiv').empty();
	  	$('#writeForm  #pwdDiv').empty();
	  	$('#repwdDiv').empty();
	
		//name 속성
		if($('input[name="name"]').val() == '') {
			$('#nameDiv').html('이름 입력');
			$('#name').focus();
			
		}else if($('#writeForm #id').val()=='')
			$('#writeForm #idDiv').html('아이디 입력');
			
		else if($('#writeForm #pwd').val()=='')
			$('#writeForm #pwdDiv').html('비밀번호 입력');
			
		else if($('#writeForm #pwd').val() != $('#repwd').val())
			$('#repwdDiv').html('비밀번호 틀림');
			
		else if($('#writeForm #id').val() != $('#check').val())
			$('#writeForm #idDiv').html('중복체크 하세요');
		
		else 
			//$('form[name="writeForm"]').submit();
			
			$.ajax({
				url: '/MQBProject/member/write.do',
				type: 'post',
				data: $('#writeForm').serialize(),
				success: function(){
					alert("회원가입을 축하합니다");
				},
				error: function(err){
	               console.log(err);
	            }
			});
	});
	
	//로그인
	$('#loginBtn').click(function(){
		alert('버튼~');
		
		$('#idDiv').empty();
	  	$('#pwdDiv').empty();
	
		if($('input[name="id"]').val()=='')
			$('#idDiv').html('아이디 입력');
		else if($('input[name="pwd"]').val()=='')
			$('#pwdDiv').html('비밀번호 입력');
		else{
			//$('form[name="loginForm"]').submit(); - 페이지 이동
			
			$.ajax({
				url: '/MQBProject/member/login.do',
				type: 'post',
				data: 'id='+$('#id').val()+'&pwd='+$('#pwd').val(),
				dataType: 'text',
				success: function(data){
					//alert(data);
					data = data.trim();
					
					if(data == 'ok'){
						location.href='/MQBProject/index.jsp';
						
					}else if(data == 'fail'){
						$('#loginResult').text('로그인 실패');
						$('#loginResult').css('color', 'red');
						$('#loginResult').css('font-size', '15pt');
						$('#loginResult').css('font-weight', 'bold');
					}
				},
				error: function(err){
					console.log(err);
				}
			});
		} 		
	});
});

//아이디 중복 체크
$('#writeForm #id').focusout(function(){
	$('#writeForm #idDiv').empty();
	
	if($('#writeForm #id').val() == ''){
		$('#writeForm #idDiv').html('먼저 아이디를 입력하세요');
		$('#writeForm #idDiv').css('color', 'magenta');
	
	}else{
		$.ajax({
			url: '/MQBProject/member/checkId.do',
			type: 'post',
			data: 'id='+$('#writeForm #id').val(),
			dataType: 'text',
			success: function(data){
				//alert(data);
				data = data.trim();				
				
				if(data == 'exist'){
					$('#writeForm #idDiv').html('사용 불가능');
					$('#writeForm #idDiv').css('color', 'magenta');
					
				}else if(data == 'non_exist'){
					$('#writeForm #idDiv').html('사용 가능');
					$('#writeForm #idDiv').css('color', 'blue');
					
					$('#check').val($('#writeForm #id').val());
				}
			},
			error: function(err){
				console.log(err);
			}			
		});
	}
});

//우편번호 체크
$('#zipcodeBtn').click(function(){
	window.open("/MQBProject/member/checkPost.do", "checkPost", "width=600 height=500 top=200 left=700");
});

$('#checkPostSearchBtn').click(function(){
	$.ajax({
		url: '/MQBProject/member/checkPostSearch.do',
		type: 'post',
		data: $('#checkPostForm').serialize(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#zipcodeTable tr:gt(2)').remove();
			
			$.each(data.list, function(index, items){
				var address = items.sido + ' '
							+ items.sigungu + ' '
							+ items.yubmyundong+' '
							+ items.ri+' '
							+ items.roadname+' '
							+ items.buildingname;
							
				address = address.replace(/undefined/g, '');						
							
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.zipcode
				})).append($('<td/>',{
					colspan: 3,
				}).append($('<a/>',{
					href: '#',
					text: address,
					class: 'addressA'
					
				}))).appendTo($('#zipcodeTable'));
									
			});//each
			
			//주소를 클릭하면 회원가입폼으로 보낸다
			$('.addressA').click(function(){
				//alert($(this).text()); - 주소
				//alert($(this).parent().prev().text()); - 우편번호
				
				$('#zipcode', opener.document).val($(this).parent().prev().text());
				$('#addr1', opener.document).val($(this).text());
				window.close();
				$('#addr2', opener.document).focus();
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});













































