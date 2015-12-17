<!-- 복사본  deal2 테스터용-->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

   <script src="<%=cp%>/res/template/js/jquery.min.js"></script>

<link href="<%=cp%>/res/template/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=cp%>/res/defaultTemplate/css/custom.css" rel="stylesheet">
<link href="<%=cp%>/res/template/css/animate.min.css" rel="stylesheet">
<link href="<%=cp%>/res/template/css/icheck/flat/green.css" rel="stylesheet">
<link href="<%=cp%>/res/template/css/select/select2.min.css" rel="stylesheet">


<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  --> 

<link rel="stylesheet" href=" http://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" type="text/css"/>
<script type="text/javascript" src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
         

<script type="text/javascript">


/* $('#myModal').on('show.bs.modal', function (e) {
     if (!data) return e.preventDefault() // stops modal from being shown
   })
 */   

   // 쪽지보내기
<%-- function sendLetter() {
	var content=$.trim($("#letterContent").val());
	
	
	 if(! content){
		alert("내용을 입력하세요!!!!!!!!!!!");
		$("#letterContent").focus();
		return false;
	 }
	 
	 var url="<%=cp%>/letter/send.do";
	 var params="receiveUserId="+receiveUserId+"&content="+content;

		 $.ajax({
		    	type:"POST",
		    	url:url,
		    	data:params,
		    	dataType:"json",
		    	success:function(data){
		        	var isLogin=data.isLogin;
					if(isLogin=="false") {
						location.href="<%=cp%>/member/member.do";
						return false;
					}
					// var state=data.state;
		    		$("#letterContent").val("");
					// 여기에 받는 유저아이디를 받아야한다.?
		    		alert("메시지를 전송 했습니다.");
		    	},
		    	error:function(e) {
		    		alert(e.responseText);
		    	}
		    });
} --%>
   

</script>

<style type="text/css">

</style>

</head>
<body class="nav-md" style="padding:0px;">
         <div class="container body" style="padding:0px;">
         
         <div class="main_container">
            <div class="layoutSide">
            <tiles:insertAttribute name="sidebar"/>
         </div>
   
   <div class="layoutTop">
      <tiles:insertAttribute name="topbar"/>
   </div>
   
   <div class="layoutBody">
      <tiles:insertAttribute name="body"/>
   </div>
   
   
   <div class="layoutFooter">
      <tiles:insertAttribute name="footer"/>
   </div>

<!--  쪽지 보내기 -->
<!-- <div class="modal fade" id="contact" role="dialog" aria-labelledby="contactLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="panel panel-primary">
                     <div class="panel-heading">
                        <h4 class="panel-title" id="contactLabel"><span class="glyphicon glyphicon-info-sign"></span> 쪽지보내기</h4>
                    </div>
                    <div class="modal-body" style="padding: 5px;">
                          <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="col-lg-4 col-md-4 col-sm-4" style="padding-bottom: 10px; margin-top: 10px">
                            	 <div> 받는사람 </div> 
                                </div> 
                            
                                <div class="col-lg-3 col-md-3 col-sm-3" style="padding-bottom: 10px;">
                            	 <div style="margin-right: 20px;" class="form-control" id="idWrite">  </div> 
                                </div>
                                	</div>
                              
                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                    <div style="float: right" class="form-control" id="sendDay">보내는 날짜 : </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <textarea style="resize:vertical;" class="form-control" placeholder="메세지.." rows="6" id="letterContent"></textarea>
                                </div>
                            </div>
                        </div>  
                        <div class="panel-footer" style="margin-bottom:-14px;">
                            <input type="submit" class="btn btn-success" value="전송" onclick="sendLetter();"/>
                            <button style="float: right;" type="button" class="btn btn-default btn-close" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div> -->
            <!--  임시 쪽지 종료 -->
<!--  쪽지 보내기 제이쿼리 모달창 종료 -->

<!-- 쪽지 내용 모달창 -->
<!-- <div class="modal fade">
   <div id="ModalArticle" >
                             
                                 <div>
                                    
                                     <span class="pull-right note_fontsize" >2015-11-18[16:59]</span>보낸시간 뜨는거야
                                       
                                       <p class="quote-text">
                                     			쪽지내용
                                       </p>
                                    <hr>
                                       <div class="blog-post-actions">
                   
                                       <a class="blog-post-bottom pull-left" data-toggle="modal" data-target="#ModalCreated">
                                          	(보낸사람)-바로답장
                                        </a>
                                         
                                       </div>
                                 </div>
                               </div>
                               </div> -->
                              <!-- 쪽지 내용 확인창 --> 
                               
         
                               
                               
                               
                               
                             </div>
</div>
 

         <script src="<%=cp%>/res/template/js/custom.js"></script>  

</body>
</html>