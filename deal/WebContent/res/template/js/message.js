
 // ������ֱ�
		 
  	var receiveUserId;  // ������ ���� ���̵�
	var sendUserId;
	var sendDay;
	var readNum;
	var content;
 // ���â����(���� ������â)

 function noteForm(id) {
 	
	
	 receiveUserId=id;
	 $('#contact').modal('show');
	
			var s = receiveUserId;
			$("#idWrite").change();
			$("#idWrite").text(s); 
	
			// ������ ��¥ ���
			var newDate = new Date();
			var yy = newDate.getFullYear();
			var mm = newDate.getMonth()+1;
			var dd = newDate.getDate();
			var toDay = yy + "-" + mm + "-" + dd;
			
			$("#sendDay").change();
			$("#sendDay").text(toDay); 
		
 }
 
function renoteForm(id) {
 	
	 receiveUserId=id;
	

	 $('#ModalArticle').modal('hide');
		 
	 $('#contact').modal('show');
	// ������ ��¥ ���
		var newDate = new Date();
		var yy = newDate.getFullYear();
		var mm = newDate.getMonth()+1;
		var dd = newDate.getDate();
		var toDay = yy + "-" + mm + "-" + dd;
		
		$("#sendDay").change();
		$("#sendDay").text(toDay); 
		
 }
 
 function sendLetter() {
		var content=$.trim($("#letterContent").val());
		
		
		
		 if(! content){
			alert("!!!!!!!!!!!");
			$("#letterContent").focus();
			return false;
		 }
		alert(content);
	
		 var url="/deal/letter/send.do";
		 var params="receiveUserId="+receiveUserId+"&content="+content;

			 $.ajax({
			    	type:"POST",
			    	url:url,
			    	data:params,
			    	dataType:"json",
			    	success:function(data){
			        	var isLogin=data.isLogin;
						if(isLogin=="false") {
							location.href="/deal/member/member.do";
							return false;
						}
						
						
						// var state=data.state;
			    		$("#letterContent").val("");
						$("#idWrite").text("");
						$("#sendDay").text(""); 
						// ���⿡ �޴� �������̵� �޾ƾ��Ѵ�.?
			    		alert("메세지 전송이 완료되었습니다.");
						 $('#contact').modal('hide');
						
						$("#letterCount").text(""); 
						 var noticeletter=data.noticeletter;
					
						$("#letterCount").html(noticeletter); 
			    	},
			    	error:function(e) {
			    		alert(e.responseText);
			    	}
			    });
			 $('#contact').modal('hide');
	}
 

	var resendUserId;	//����ޱ� ���̵�
 	function readForm(sendUserId ,sendDay, readNum, content){

	 
	 $("#ModalArticle").modal('show');
	 	this.resendUserId=sendUserId;
	
		this.sendUserId=sendUserId;				
	 	this.sendDay=sendDay;
	 	this.readNum=readNum;
	 	this.content=content;

	 	// ���� ���·� ����� Ajax ó��
	 	var url="<%=cp%>/letter/updateIdentify.do";
		var num=readNum;
	 	
		
		$.post(url, {num:num}, function(data){
			$("#idWrite2").text(sendUserId); 
			$("#idWrite2").change();
			
			$("#idWrite").text(sendUserId); 
			$("#idWrite").change();
			
			 $("#dateWrite").text(sendDay);
			$("#dateWrite").change(); 

			 $("#letterContent2").text(content);
			 $("#letterContent2").change();
			 
		}, "json");
		

			
			$("#letterClose").click(function(){
				 
				 $('#ModalArticle').modal('hide');
			 });
		
	
 }