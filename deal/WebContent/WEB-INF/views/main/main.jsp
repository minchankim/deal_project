<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
   request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   -->

   <link href="<%=cp%>/res/template/css/main/minchanmain.css" rel="stylesheet">
   
<script type="text/javascript">
var pageN=1;
var dNum;



function pNum(pageNumber){


	pageN=pageNumber; 

	listPage(dNum); 
}

function pageSet(dNum){
	this.dNum=dNum;
	

	
}
 
$(document).ready(function() {
    $('[id^=detail-]').hide();
    $('.toggle').click(function() {
        $input = $( this );
        $target = $('#'+$input.attr('data-toggle'));
        $target.slideToggle();
    });
   	    setInterval(function() {
   	    	e1.outerHTML='<marquee scrollamount=3 behavior=slide direction=down id=e1 >'+$("#e1").html()+'</marquee>'
    		  }, 5000); setInterval(function() {
	    	e2.outerHTML='<marquee scrollamount=3 behavior=slide direction=down id=e2 >'+$("#e2").html()+'</marquee>'
 		  }, 7000); 	setInterval(function() {
 	   	    	e3.outerHTML='<marquee scrollamount=3 behavior=slide direction=down id=e3 >'+$("#e3").html()+'</marquee>'
		  }, 6000); 	setInterval(function() {
	   	    	e4.outerHTML='<marquee scrollamount=3 behavior=slide direction=down id=e4 >'+$("#e4").html()+'</marquee>'
		  }, 6200); 	setInterval(function() {
	   	    	e5.outerHTML='<marquee scrollamount=3 behavior=slide direction=down id=e5 >'+$("#e5").html()+'</marquee>'
		  }, 6500); 	setInterval(function() {
	   	    	d1.outerHTML='<marquee scrollamount=3 behavior=slide direction=down id=d1 >'+$("#d1").html()+'</marquee>'
		  }, 7200); 	setInterval(function() {
	   	    	d2.outerHTML='<marquee scrollamount=3 behavior=slide direction=down id=d2 >'+$("#d2").html()+'</marquee>'
		  }, 7100); 	setInterval(function() {
	   	    	d3.outerHTML='<marquee scrollamount=3 behavior=slide direction=down id=d3 >'+$("#d3").html()+'</marquee>'
		  }, 6700); 	setInterval(function() {
	   	    	d4.outerHTML='<marquee scrollamount=3 behavior=slide direction=down id=d4 >'+$("#d4").html()+'</marquee>'
		  }, 6900); 	
  	     
  	 

    	
    	
  
}); 
/* $.fn.ready(function (){
   $("p").fitText(2,{'minFontSize':1,'maxFontSize':50});
}); */
function gogo(){
   location.href="<%=cp%>/deal/article.do";
}
$(document).ready(function(){
    
	var clickEvent = false;
	$('#myCarousel').carousel({
		interval:   4000	
	}).on('click', '.list-group li', function() {
			clickEvent = true;
			$('.list-group li').removeClass('active');
			$(this).addClass('active');		
	}).on('slid.bs.carousel', function(e) {
		if(!clickEvent) {
			var count = $('.list-group').children().length -1;
			var current = $('.list-group li.active');
			current.removeClass('active').next().addClass('active');
			var id = parseInt(current.data('slide-to'));
			if(count == id) {
				$('.list-group li').first().addClass('active');	
			}
		}
		clickEvent = false;
	});
})
$(document).click(function(){
	 var boxheight = $('#myCarousel .carousel-inner').innerHeight();
	    var itemlength = $('#myCarousel .item').length;
	    var triggerheight = Math.round(boxheight/itemlength+1);
		$('#myCarousel .list-group-item').outerHeight(triggerheight);
});
$(window).on('resize', function(){
	 var boxheight = $('#myCarousel .carousel-inner').innerHeight();
	    var itemlength = $('#myCarousel .item').length;
	    var triggerheight = Math.round(boxheight/itemlength+1);
		$('#myCarousel .list-group-item').outerHeight(triggerheight);
});
$(window).load(function() {
    var boxheight = $('#myCarousel .carousel-inner').innerHeight();
    var itemlength = $('#myCarousel .item').length;
    var triggerheight = Math.round(boxheight/itemlength+1);
	$('#myCarousel .list-group-item').outerHeight(triggerheight);
});
$(function () {
	   $('.panel-google-plus > .panel-footer > .input-placeholder, .panel-google-plus > .panel-google-plus-comment > .panel-google-plus-textarea > button[type="reset"]').on('click', function(event) {
	        var $panel = $(this).closest('.panel-google-plus');
	            $comment = $panel.find('.panel-google-plus-comment');
	            
	        $comment.find('.btn:first-child').addClass('disabled');
	        $comment.find('textarea').val('');
	        
	        $panel.toggleClass('panel-google-plus-show-comment');
	        
	        if ($panel.hasClass('panel-google-plus-show-comment')) {
	            $comment.find('textarea').focus();
	        }
	   });
	   $('.panel-google-plus-comment > .panel-google-plus-textarea > textarea').on('keyup', function(event) {
	        var $comment = $(this).closest('.panel-google-plus-comment');
	        
	        $comment.find('button[type="submit"]').addClass('disabled');
	        if ($(this).val().length >= 1) {
	            $comment.find('button[type="submit"]').removeClass('disabled');
	        }
	   });
	});
	
	
	
//댓글 추가
function sendReply(dealNum) {
	
	/*  var isLogin="${sessionScope.member.userId}";
	if(! isLogin) {
		login();
		return false;
	} */
	
 	var content=$.trim($("#replyContent-"+dealNum).val());
	var src=$("#imageFilename-"+dealNum).attr('src');

	
	
	
	var params="dealNum="+dealNum;
	params+="&content="+content;
	params+="&imageFilename="+src;
	$.ajax({
		type:"POST"
		,url:"<%=cp%>/deal/dealReplyCreated.do"
		,data:params
		,dataType:"json"
		,success:function(data) {
			$("#replyContent-"+dealNum).val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(dealNum);
			} else if(state=="false") {
				alert("댓글을 등록하지 못했습니다. !!!");
			} else if(state=="loginFail") {
				alert("로그인하세여");
			}
			
			$("#joinCount").text("");
			 var ncount=data.DealInNoticeCount;
			$("#joinCount").html(ncount); 
			$("#myDealTotal").text("");
			$("#myDealTotal").html(ncount); 
			
	
		
		}
		,error:function(e) {
			alert(e.responseText);
		}
	});  
}
function listPage(dealNum) {

	var url="<%=cp%>/deal/mainDealreplyList.do";
	$.post(url, {dealNum:dealNum,pageNum:pageN}, function(data){
	 $("#listReply-"+dealNum).html(data); 
	});
}
var dealNum,replyLike;
function Like(dealNum,replyLike) {
	
	/*  var isLogin="${sessionScope.member.userId}";
	if(! isLogin) {
		login();
		return false;
	} */
	this.dealNum=dealNum;
	this.replyLike=replyLike;
	<%-- var params="dealNum="+dealNum;
	params+="&replyLike="+replyLike;
	$.ajax({
		type:"POST"
		,url:"<%=cp%>/deal/dealLike"
		,data:params
		,dataType:"json"
		,success:function(data) {
			
			var state=data.state;
			if(state=="true") {
				countLike(replyNum);
			} else if(state=="false") {
				alert("좋아요/싫어요는 한번만 가능합니다. !!!");
			} else if(state=="loginFail") {
				login();
			}else{
				alert("로그인해");
			}
		}
		,error:function(e) {
			alert(e.responseText);
		}
	});
 --%>
}
$(document).ready(function() {              
    $('i.glyphicon-thumbs-up, i.glyphicon-thumbs-down').click(function(){    
        var $this = $(this),
        c = $this.data('count');
        var count = $('#'+this.id+'-bs3').html();
        var id = this.id;
     
        var params="dealNum="+dealNum;
    	params+="&replyLike="+replyLike;
    	$.ajax({
    		type:"POST"
    		,url:"<%=cp%>/deal/dealLike.do"
    		,data:params
    		,dataType:"json"
    		,success:function(data) {
    			
    			var state=data.state;
    			if(state=="true") {
    				 if (!count) count = 0;
    				 count++;
    				countLike(id,count); 
    			   
    			} else if(state=="false") {
    				alert("좋아요/싫어요는 한번만 가능합니다. !!!");
    				return false;
    			} else if(state=="loginFail") {
    				alert("로그인하세여");
    				return false;
    			}else{
    				alert("로그인해");
    			}
    		}
    		,error:function(e) {
    			alert(e.responseText);
    		}
    	});
 
    	/*   if (!id) id = 0;
	        id++; */
      /*   $this.data('count',id); */
     /*  alert(this.id);
        $('#'+this.id+'-bs3').html(id); */
    });      
    
    
    $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });                                        
}); 
function countLike(id,count){
	
	$('#'+id+'-bs3').html(count); 
}
function dealjoin(Num,mode){
	
	 var params="dealNum="+Num;
 	params+="&mode="+mode;
 	
 	$.ajax({
		type:"POST"
		,url:"<%=cp%>/deal/dealIn.do"
		,data:params
		,dataType:"json"
		,success:function(data) {
			
			var state=data.state;
			if(state=="true") {
				 if (!count) count = 0;
				 count++;
				countLike(id,count); 
			   
			} else if(state=="false") {
				alert("좋아요/싫어요는 한번만 가능합니다. !!!");
				return false;
			} else if(state=="loginFail") {
				alert("로그인하세여");
				return false;
			}else{
				alert("로그인해");
			}
		}
		,error:function(e) {
			alert(e.responseText);
		}
	});
}


function dealapprove(Num,mode){
	 var params="dealNum="+Num;
	 	params+="&mode="+mode;

	 	$.ajax({
			type:"POST"
			,url:"<%=cp%>/deal/dealSuccess.do"
			,data:params
			,dataType:"json"
			,success:function(data) {
				
				var state=data.state;
				if(state=="true") {
					 if (!count) count = 0;
					 count++;
					countLike(id,count); 
				   
				} else if(state=="false") {
					alert("딜 취소에대한 권한이 없습니다 !!!");
				
					 $('#success'+Num).addClass("active"); 
				
					return false;
				} else if(state=="loginFail") {
					alert("로그인하세여");
					return false;
				}else{
					alert("로그인해");
				}
			}
			,error:function(e) {
				alert(e.responseText);
			}
		});
	
	
}





 
</script>

<script src="//rawgithub.com/ashleydw/lightbox/master/dist/ekko-lightbox.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<style>
.stat-item:click{
background-color:black !important;
}
.btn.active {                
	display: none;		
}
.panel-default>.panel-heading{
background-image: block !important;
background-color:rgb(255,255,255);
}
.panel-google-plus > .panel-heading > h5{
color:rgb(0,0,0);
}

/*  countDown*/

.container {
  margin: 0px auto;
  padding: 0px;
}

#main { 
  background: #3B3B3B;
 /*  height: 430px; */
}

.content {
/*   padding: 10px 15px; */
}

.text {
  border-bottom: 0px solid #262626;
 /*  margin-top:10px;
  padding-bottom: 10px; */
  text-align: right;
}

.text h2 {
  color: #E5E5E5;
  /* font-size: 30px; */
  font-style: normal;
  font-variant: normal;
  font-weight: lighter;
  letter-spacing: 2px;
}

.counter {
  background: #2C2C2C;
  -moz-box-shadow:    inset 0 0 5px #000000;
  -webkit-box-shadow: inset 0 0 5px #000000;
  box-shadow:         inset 0 0 5px #000000;
 /*  min-height: 150px; */
  text-align: right;
}

.counter h3 {
  color: #E5E5E5;
  font-size: 10px;
  font-style: normal;
  font-variant: normal;
  font-weight: 900;
  letter-spacing: 1px;
 /*  padding-top:5px;
  margin-bottom: 5px; */
}

#countdown {
  color: #FFFFFF;
}

#countdown span {
  color: #E5E5E5;

  font-weight: 900;
/*   margin-left: 5px;
  margin-right: 5px; */
 /*  text-align: center; */
}




</style>
<div class="right_col" role="main" style="padding-left:7px;">


<!--대표이미지  -->
<div class="col-xs-12 col-sm-12 col-md-10" style="padding-bottom:0px;padding-left:0px;padding-right:0px; margin-bottom:5px;">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
      <!-- Wrapper for slides -->
      <div class="carousel-inner">
      
        <div class="item active">
          <img src="<%=cp%>/res/images/m1.jpg">

        </div><!-- End Item -->
 
         <div class="item">
          <img src="<%=cp%>/res/images/m2.jpg">
          
        </div><!-- End Item -->
        
        <div class="item">
          <img src="<%=cp%>/res/images/m3.jpg">
        </div><!-- End Item -->
        
        <div class="item">
          <img src="<%=cp%>/res/images/m4.jpg">
        </div><!-- End Item -->

        <div class="item">
          <img src="<%=cp%>/res/images/m5.jpg">
        </div><!-- End Item -->
                
      </div><!-- End Carousel Inner -->


      <ul class="list-group col-md-4 col-sm-4 col-xs-1" style="margin-bottom:0px;"> <!-- 이거 슬라이드 내용 바뀐거고  -->
      <li data-target="#myCarousel" data-slide-to="0" class="list-group-item active" style="font-size: 11pt;border-color:#454545;">뮤지컬 위대한 캣츠비
      <br><span style="font-size: 13pt;">55%</span>
      </li>
      <li data-target="#myCarousel" data-slide-to="1" class="list-group-item"  style="font-size: 11pt;border-color:#454545;">뚜레쥬르 케익교환권
       <br><span style="font-size: 13pt;">20%</span>
       </li>
      <li data-target="#myCarousel" data-slide-to="2" class="list-group-item"  style="font-size: 11pt;border-color:#454545;">마크막스 연말코디
       <br><span style="font-size: 13pt;">9,900원</span>
       </li>
      <li data-target="#myCarousel" data-slide-to="3" class="list-group-item"  style="font-size: 11pt;border-color:#454545;">맥심 커피믹스 320T 무배 특가
       <br><span style="font-size: 13pt;">30,900원</span>
       </li>
      <li data-target="#myCarousel" data-slide-to="4" class="list-group-item"  style="font-size: 11pt;border-color:#454545;">산들로 알루미늄 면 난방텐트
       <br><span style="font-size: 13pt;">20%</span>
       </li>
    </ul>

      <!-- Controls -->
      <div class="carousel-controls">
          <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
      </div>

    </div><!-- End Carousel -->
</div>

<!--대표이미지  -->

<div class="container">
<div class="col-xs-6 col-sm-6 col-md-2 pull-left">


	<div class="row">
		<div style="padding:0px;" class=" col-xs-12 col-sm-12 col-md-12 sidebar">
    <div class="mini-submenu">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>
    <div id="RollingTest" class="list-group">
        <span href="#" class="list-group-item active" style="background: #810000; color: #ffffff;">
            실시간 급상승 검색어
        </span>
       <a href="#" class="list-group-item">
          <marquee behavior=slide   direction=down  scrollamount="3" id="e1">    1.커텐 <span class="fa  fa-sort-desc pull-right"></span></marquee> 
        </a>
     
        
        <a href="#" class="list-group-item">
         <marquee behavior=slide   direction=down  scrollamount="3" id="e2">  2.의자 <span class="fa fa-sort-up   pull-right" style="color:#DB0000;"></span></marquee> 
        </a>
        <a href="#" class="list-group-item">
        <marquee behavior=slide   direction=down  scrollamount="3" id="e3">     3.크리스마스 <span class="fa  fa-sort-desc pull-right"></span></marquee> 
        </a>
    </div>        
</div>
	</div>
</div>



<div class="col-xs-6 col-sm-6 col-md-2 pull-right " >
<br>
	<div class="row">
		<div style="padding:0px;" class=" col-xs-12 col-sm-12 col-md-12 sidebar">
    <div class="mini-submenu">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>
    <div class="list-group" style="margin-bottom:0px;">
        <span href="#" class="list-group-item active" style="background: #810000; color: #ffffff;">
           딜러왕
           
        </span>
         <a href="#" class="list-group-item">
        <marquee behavior=slide   direction=down  scrollamount="3" id="d1">      1.김민찬 <span class="badge pull-right">68%</span></marquee>
        </a>
        <a href="#" class="list-group-item">
        <marquee behavior=slide   direction=down  scrollamount="3" id="d2">     2.비 <span class="badge pull-right">22%</span></marquee>
        </a>
        <a href="#" class="list-group-item">
        <marquee behavior=slide   direction=down  scrollamount="3" id="d3">      3.김태희 <span class="badge pull-right">19%</span></marquee>
         </a>
    </div>        
</div>
	</div>
</div>



<section class="section-white col-md-10 col-xs-12" style="padding-left:0px; padding-bottom:20px; paddign-right:5px;">
  <div class="container">

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
        <div class="item active">
          <img src="<%=cp%>/res/images/ttt.png">
        </div>
        <div class="item">
            <img src="<%=cp%>/res/images/ttt2.png">
        </div>
        <div class="item">
             <img src="<%=cp%>/res/images/ttt3.png">
        </div>
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>

  </div>
</section>




















<!--콘텐츠  -->
<div class="container" >
    <div class=" col-md-4 pull-left"  style="padding-left:1px;padding-right:3px;">
        
        <c:forEach  var="dto" items="${MainDealList1}">

        <div class="col-xs-12 col-sm-12  col-md-12"   onmouseenter="pageSet('${dto.num}');"  style="padding-left:0px;padding-right:0px;">
            <div class="[ panel panel-default ] panel-google-plus" >
                  <!--CountDown  -->
				<div class="col-md-12 col-sm-12 " style="text-align:right; padding:0px; margin:0px; margin-bottom:2px;"  id="countdown${dto.num}">
  					</div><!-- /#Countdown Div -->
                <div class="dropdown">
              
  					
  					<script>
  					$(document).ready(function() {
  						 var target_date = new Date(' ${fn:substring(dto.end_date,5,7)}, ${fn:substring(dto.end_date,8,10)},  ${fn:substring(dto.end_date,0,4)}').getTime();
  						 
  						// variables for time units
  						var days, hours, minutes, seconds;
  						 
  						// get tag element
  						var countdown = document.getElementById('countdown'+${dto.num});
  						 
  						// update the tag with id "countdown" every 1 second
  						setInterval(function () {
  						 
  						    // find the amount of "seconds" between now and target
  						    var current_date = new Date().getTime();
  						    var seconds_left = (target_date - current_date) / 1000;
  						 
  						    // do some time calculations
  						    days = parseInt(seconds_left / 86400);
  						    seconds_left = seconds_left % 86400;
  						     
  						    hours = parseInt(seconds_left / 3600);
  						    seconds_left = seconds_left % 3600;
  						     
  						    minutes = parseInt(seconds_left / 60);
  						    seconds = parseInt(seconds_left % 60);
  						     
  						    // format countdown string + set tag value
  						    countdown.innerHTML = 
  						      '<span style="color:rgba(229, 19, 19, 0.72);font-size:5px; " class="days">' 
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+days+'</span>' 
  						    + ' <b>Days</b></span> <span style="font-size:5px;color:rgba(229, 19, 19, 0.72);" class="hours">' 
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+ hours +'</span>' 
  						    + ' <b>Hours</b></span> <span style="font-size:5p	x;color:rgba(229, 19, 19, 0.72);" class="minutes">'
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:5px;">'
  						 	+ '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+minutes+'</span>'  
  						    + ' <b>Minutes</b></span> <span style="font-size:5px;color:rgba(229, 19, 19, 0.72);" class="seconds">' 
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+ seconds +'</span>'  
  						    + ' <b>Seconds</b></span>';  
  						 
  						}, 1000); 
  				
  					});
  					</script>
                   <!--  <span class="dropdown-toggle" type="button" data-toggle="dropdown">
                        <span class="[ glyphicon glyphicon-chevron-down ]"></span>
                    </span>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                    </ul> -->
                </div>
                <div class="panel-google-plus-tags">
                    <ul>
                        <li>#${dto.tag1}</li>
                    </ul>
                </div>
                <c:set var="success" value="0" />
                      <c:forEach var="successdto" items="${DealSuccessList}">
         		<c:if test="${dto.num==successdto.dealNum}"> 
         			<c:set var="success" value="1" />
                    </c:if>
                    </c:forEach>
                    
                    
                    <c:choose>
    <c:when test="${success==1}">
      <div class="panel-heading" style="padding-bottom: 15px; background-color:rgb(239, 107, 57);">
    </c:when>    
    <c:otherwise>
        <div class="panel-heading" style="padding-bottom: 15px;">
    </c:otherwise>
</c:choose>
                    
               
                    <img class="[ img-circle pull-left ]" src="<%=cp%>/uploads/photo/${dto.imageFilename}" style="width:60px;height:70px;" alt="Mouse0270" />
                    <h3 style="font-size:20px;">${dto.userId}</h3>
                    <h5><span>Shared publicly</span> - <span>Jun 25, 2014</span> </h5>
                </div>
                <div class="panel-body">
                    <a href="<%=cp%>/deal/article.do?num=${dto.num}"><p style="color:black;font-size:20px;">${dto.subject}<!--  <a href="http://bootsnipp.com/snippets/MaWrA">http://bootsnipp.com/snippets/MaWrA</a> --></p></a>
           
                  
               
  					
                    <%--  <c:forEach var="dealdto" items="${DealInList}">
                    <c:if test="${dto.num==dealdto.dealNum}">
                    <div>11111111</div>
                    </c:if>
                    </c:forEach>  --%>
                    <a class="panel-google-plus-image" href="<%=cp%>/deal/article.do?num=${dto.num}">
                        ${dto.image1}
                    </a>
                </div>
                <div class="panel-footer col-md-12 col-sm-12 col-xs-12" style="padding-left:0px;padding-right:0px;">
             <!--        <button type="button" class="[ btn btn-default ]">+1</button>
                    <button type="button" class="[ btn btn-default ]">
                        <span class="[ glyphicon glyphicon-share-alt ]"></span>
                    </button> -->
  

    <div class="text-center">      
         <div class="" data-toggle="buttons">  
         <c:set var="badId" value="0" />
        <c:forEach var="dealdto" items="${DealInList}">
         
                    <c:if test="${dto.num==dealdto.dealNum}"> 
                    
                  <c:set var="badId" value="1" />
                        <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success pull-left">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 참여
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger active pull-left">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 미참여
            </label>     
               </c:if>
                    </c:forEach>  
                
                    
                    <c:if test="${badId==0}">
                                <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success active pull-left">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 참여
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger pull-left">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 미참여
            </label>   
            </c:if>
           
        </div>
    
    </div>
    
    
    
    
      <span class="pull-right">
                      <a class="btn btn-default stat-item  btn-xs pull-right" style="font-size:25px; padding-bottom: 0px;padding-right:5px; ">
                        <i id="like${dto.num}" style="font-size: 30px; backgoround-color:red;" onclick="Like(${dto.num},1);" class="glyphicon glyphicon-thumbs-up"><div style="font-size: 25px;padding-left: 5px;" id="like${dto.num}-bs3" >${dto.countLike}</div></i></a> 
                       <%--  <i id="dislike${dto.num}"  style="font-size: 30px;" onclick="disLike(${dto.num});" class="glyphicon glyphicon-thumbs-down"><div style="font-size: 25px;" id="dislike${dto.num}-bs3">4</div></i> --%> 
           
                    </span>
    

    <c:if test="${sessionScope.member.businessNum>0}">
    <div class="text-center">      
         <div class="" data-toggle="buttons">  
         <c:set var="badId" value="0" />
        <c:forEach var="successdto" items="${DealSuccessList}">
         
                    <c:if test="${dto.num==successdto.dealNum}"> 
                  <c:set var="badId" value="1" />
                        <label id="success${dto.num}" onclick=" dealapprove('${dto.num}',0)" class="btn btn-md btn-success pull-right"  style="color:black;background-color:rgba(255, 220, 104, 0.84);border-color:rgba(255, 255, 255, 0);">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 승인완료
            </label>
              <label id="success${dto.num}" onclick="dealapprove('${dto.num}',1)" class="btn btn-md btn-danger active pull-right" style="background-color:rgba(85, 85, 85, 0.84);border-color:rgba(255, 255, 255, 0);" >
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 승인대기
            </label>     
               </c:if>
                    </c:forEach>  
                
                    
                    <c:if test="${badId==0}">
                                <label onclick="dealapprove('${dto.num}',0)" class="btn btn-md btn-success active pull-right" style="color:black;background-color:rgba(255, 220, 104, 0.84);border-color:rgba(255, 255, 255, 0);">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 승인완료
            </label>
              <label onclick="dealapprove('${dto.num}',1)" class="btn btn-md btn-danger  pull-right" style="background-color:rgba(85, 85, 85, 0.84);border-color:rgba(255, 255, 255, 0);">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 승인대기
            </label>   
            </c:if>
           
        </div>
    
    </div>
    </c:if>

                    
                   
                    <div class="input-placeholder col-md-12 col-sm-12 col-xs-12" style="font-size:15px;margin:0px;" onclick="listPage('${dto.num}')">Add a comment...</div>
</div>
                
                
                <div class="panel-google-plus-comment" style="padding:10px;">
                    <c:if test="${pdto.imageFilename==null}">
                   <img class="img-circle" src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46" alt="User Image" /> 
                    </c:if>
                    <c:if test="${pdto.imageFilename!=null}">
                    <img id="imageFilename-${dto.num}" class="img-circle" src="<%=cp%>/uploads/photo/${pdto.imageFilename}" style="width:55px;height:55px;padding-right:2px;" alt="User Image" />
                    </c:if>
                    <div class="panel-google-plus-textarea">
                    
                        <textarea id="replyContent-${dto.num}" style="padding:0px;" rows="5"></textarea>
                        <button type="submit" class="[ btn btn-success disabled ]" onclick="sendReply('${dto.num}')">Post comment</button>
                        <button type="reset" class="[ btn btn-default ]">Cancel</button>
                    </div>
                    <div class="clearfix"></div>
               <ul id="listReply-${dto.num}" style="padding:0px;">
                  <!--   <li class="comment">
                        <a class="pull-left" href="#">
                            <img class="avatar" src="http://bootdey.com/img/Content/user_1.jpg" alt="avatar">
                        </a>
                        <div class="comment-body">
                            <div class="comment-heading">
                               <h5 class="time pull-right">5 minutes ago</h5><h4 class="user">Gavino Free</h4>
                               
                            </div>
                            <p style="word-break:break-all;margin-left:40px;">Sure, oooooooooooooooohhhhhhhhhhhhhhhhddddddddddddddddddddddddddddddddddddddddddddddd</p>
                        </div>
                        <ul class="comments-list">
                            <li class="comment">
                                <a class="pull-left" href="#">
                                    <img class="avatar" src="http://bootdey.com/img/Content/user_3.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Ryan Haywood</h4>
                                        <h5 class="time">3 minutes ago</h5>
                                    </div>
                                    <p>Relax my friend</p>
                                </div>
                            </li> 
                            <li class="comment">
                                <a class="pull-left" href="#">
                                    <img class="avatar" src="http://bootdey.com/img/Content/user_2.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Gavino Free</h4>
                                        <h5 class="time">3 minutes ago</h5>
                                    </div>
                                    <p>Ok, cool.</p>
                                </div>
                            </li> 
                        </ul>
                    </li> -->
                       </ul>
                </div>
                
            </div>
        </div>
        </c:forEach>   
        
        
    </div><!-- row -->
    
     <div class=" col-md-4 pull-left"  style="padding-left:1px;padding-right:3px;">
        
        <c:forEach  var="dto" items="${MainDealList2}">

        <div class="col-xs-12 col-sm-12  col-md-12"  style="padding-left:0px;padding-right:0px;">
            <div class="[ panel panel-default ] panel-google-plus" >
                  <!--CountDown  -->
				<div class="col-md-12 col-sm-12 " style="text-align:right; padding:0px; margin:0px; margin-bottom:2px;"  id="countdown${dto.num}">
  					</div><!-- /#Countdown Div -->
                <div class="dropdown">
              
  					
  					<script>
  					$(document).ready(function() {
  						 var target_date = new Date(' ${fn:substring(dto.end_date,5,7)}, ${fn:substring(dto.end_date,8,10)},  ${fn:substring(dto.end_date,0,4)}').getTime();
  						 
  						// variables for time units
  						var days, hours, minutes, seconds;
  						 
  						// get tag element
  						var countdown = document.getElementById('countdown'+${dto.num});
  						 
  						// update the tag with id "countdown" every 1 second
  						setInterval(function () {
  						 
  						    // find the amount of "seconds" between now and target
  						    var current_date = new Date().getTime();
  						    var seconds_left = (target_date - current_date) / 1000;
  						 
  						    // do some time calculations
  						    days = parseInt(seconds_left / 86400);
  						    seconds_left = seconds_left % 86400;
  						     
  						    hours = parseInt(seconds_left / 3600);
  						    seconds_left = seconds_left % 3600;
  						     
  						    minutes = parseInt(seconds_left / 60);
  						    seconds = parseInt(seconds_left % 60);
  						     
  						    // format countdown string + set tag value
  						    countdown.innerHTML = 
  						      '<span style="color:rgba(229, 19, 19, 0.72);font-size:5px; " class="days">' 
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+days+'</span>' 
  						    + ' <b>Days</b></span> <span style="font-size:5px;color:rgba(229, 19, 19, 0.72);" class="hours">' 
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+ hours +'</span>' 
  						    + ' <b>Hours</b></span> <span style="font-size:5p	x;color:rgba(229, 19, 19, 0.72);" class="minutes">'
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:5px;">'
  						 	+ '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+minutes+'</span>'  
  						    + ' <b>Minutes</b></span> <span style="font-size:5px;color:rgba(229, 19, 19, 0.72);" class="seconds">' 
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+ seconds +'</span>'  
  						    + ' <b>Seconds</b></span>';  
  						 
  						}, 1000); 
  				
  					});
  					</script>
                   <!--  <span class="dropdown-toggle" type="button" data-toggle="dropdown">
                        <span class="[ glyphicon glyphicon-chevron-down ]"></span>
                    </span>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                    </ul> -->
                </div>
                <div class="panel-google-plus-tags">
                    <ul>
                        <li>#${dto.tag1}</li>
                    </ul>
                </div>
                <c:set var="success" value="0" />
                      <c:forEach var="successdto" items="${DealSuccessList}">
         		<c:if test="${dto.num==successdto.dealNum}"> 
         			<c:set var="success" value="1" />
                    </c:if>
                    </c:forEach>
                    
                    
                    <c:choose>
    <c:when test="${success==1}">
      <div class="panel-heading" style="padding-bottom: 15px; background-color:rgb(239, 107, 57);">
    </c:when>    
    <c:otherwise>
        <div class="panel-heading" style="padding-bottom: 15px;">
    </c:otherwise>
</c:choose>
                    
               
                    <img class="[ img-circle pull-left ]" src="<%=cp%>/uploads/photo/${dto.imageFilename}" style="width:60px;height:70px;" alt="Mouse0270" />
                    <h3 style="font-size:20px;">${dto.userId}</h3>
                    <h5><span>Shared publicly</span> - <span>Jun 25, 2014</span> </h5>
                </div>
                <div class="panel-body">
                    <a href="<%=cp%>/deal/article.do?num=${dto.num}"><p style="color:black;font-size:20px;">${dto.subject}<!--  <a href="http://bootsnipp.com/snippets/MaWrA">http://bootsnipp.com/snippets/MaWrA</a> --></p></a>
           
                  
               
  					
                    <%--  <c:forEach var="dealdto" items="${DealInList}">
                    <c:if test="${dto.num==dealdto.dealNum}">
                    <div>11111111</div>
                    </c:if>
                    </c:forEach>  --%>
                    <a class="panel-google-plus-image" href="<%=cp%>/deal/article.do?num=${dto.num}">
                        ${dto.image1}
                    </a>
                </div>
                <div class="panel-footer col-md-12 col-sm-12 col-xs-12" style="padding-left:0px;padding-right:0px;">
             <!--        <button type="button" class="[ btn btn-default ]">+1</button>
                    <button type="button" class="[ btn btn-default ]">
                        <span class="[ glyphicon glyphicon-share-alt ]"></span>
                    </button> -->
  

    <div class="text-center">      
         <div class="" data-toggle="buttons">  
         <c:set var="badId" value="0" />
        <c:forEach var="dealdto" items="${DealInList}">
         
                    <c:if test="${dto.num==dealdto.dealNum}"> 
                    
                  <c:set var="badId" value="1" />
                        <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success pull-left">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 참여
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger active pull-left">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 미참여
            </label>     
               </c:if>
                    </c:forEach>  
                
                    
                    <c:if test="${badId==0}">
                                <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success active pull-left">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 참여
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger pull-left">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 미참여
            </label>   
            </c:if>
           
        </div>
    
    </div>
    
    
    
    
      <span class="pull-right">
                      <a class="btn btn-default stat-item  btn-xs pull-right" style="font-size:25px; padding-bottom: 0px;padding-right:5px; ">
                        <i id="like${dto.num}" style="font-size: 30px; backgoround-color:red;" onclick="Like(${dto.num},1);" class="glyphicon glyphicon-thumbs-up"><div style="font-size: 25px;padding-left: 5px;" id="like${dto.num}-bs3" >${dto.countLike}</div></i></a> 
                       <%--  <i id="dislike${dto.num}"  style="font-size: 30px;" onclick="disLike(${dto.num});" class="glyphicon glyphicon-thumbs-down"><div style="font-size: 25px;" id="dislike${dto.num}-bs3">4</div></i> --%> 
           
                    </span>
    

    <c:if test="${sessionScope.member.businessNum>0}">
    <div class="text-center">      
         <div class="" data-toggle="buttons">  
         <c:set var="badId" value="0" />
        <c:forEach var="successdto" items="${DealSuccessList}">
         
                    <c:if test="${dto.num==successdto.dealNum}"> 
                  <c:set var="badId" value="1" />
                        <label id="success${dto.num}" onclick=" dealapprove('${dto.num}',0)" class="btn btn-md btn-success pull-right"  style="color:black;background-color:rgba(255, 220, 104, 0.84);border-color:rgba(255, 255, 255, 0);">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 승인완료
            </label>
              <label id="success${dto.num}" onclick="dealapprove('${dto.num}',1)" class="btn btn-md btn-danger active pull-right" style="background-color:rgba(85, 85, 85, 0.84);border-color:rgba(255, 255, 255, 0);" >
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 승인대기
            </label>     
               </c:if>
                    </c:forEach>  
                
                    
                    <c:if test="${badId==0}">
                                <label onclick="dealapprove('${dto.num}',0)" class="btn btn-md btn-success active pull-right" style="color:black;background-color:rgba(255, 220, 104, 0.84);border-color:rgba(255, 255, 255, 0);">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 승인완료
            </label>
              <label onclick="dealapprove('${dto.num}',1)" class="btn btn-md btn-danger  pull-right" style="background-color:rgba(85, 85, 85, 0.84);border-color:rgba(255, 255, 255, 0);">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 승인대기
            </label>   
            </c:if>
           
        </div>
    
    </div>
    </c:if>

                    
                   
                    <div class="input-placeholder col-md-12 col-sm-12 col-xs-12" style="font-size:15px;margin:0px;" onclick="listPage('${dto.num}')">Add a comment...</div>
</div>
                
                
                <div class="panel-google-plus-comment" style="padding:10px;">
                    <c:if test="${pdto.imageFilename==null}">
                   <img class="img-circle" src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46" alt="User Image" /> 
                    </c:if>
                    <c:if test="${pdto.imageFilename!=null}">
                    <img id="imageFilename-${dto.num}" class="img-circle" src="<%=cp%>/uploads/photo/${pdto.imageFilename}" style="width:55px;height:55px;padding-right:2px;" alt="User Image" />
                    </c:if>
                    <div class="panel-google-plus-textarea">
                    
                        <textarea id="replyContent-${dto.num}" style="padding:0px;" rows="5"></textarea>
                        <button type="submit" class="[ btn btn-success disabled ]" onclick="sendReply('${dto.num}')">Post comment</button>
                        <button type="reset" class="[ btn btn-default ]">Cancel</button>
                    </div>
                    <div class="clearfix"></div>
               <ul id="listReply-${dto.num}" style="padding:0px;">
                  <!--   <li class="comment">
                        <a class="pull-left" href="#">
                            <img class="avatar" src="http://bootdey.com/img/Content/user_1.jpg" alt="avatar">
                        </a>
                        <div class="comment-body">
                            <div class="comment-heading">
                               <h5 class="time pull-right">5 minutes ago</h5><h4 class="user">Gavino Free</h4>
                               
                            </div>
                            <p style="word-break:break-all;margin-left:40px;">Sure, oooooooooooooooohhhhhhhhhhhhhhhhddddddddddddddddddddddddddddddddddddddddddddddd</p>
                        </div>
                        <ul class="comments-list">
                            <li class="comment">
                                <a class="pull-left" href="#">
                                    <img class="avatar" src="http://bootdey.com/img/Content/user_3.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Ryan Haywood</h4>
                                        <h5 class="time">3 minutes ago</h5>
                                    </div>
                                    <p>Relax my friend</p>
                                </div>
                            </li> 
                            <li class="comment">
                                <a class="pull-left" href="#">
                                    <img class="avatar" src="http://bootdey.com/img/Content/user_2.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Gavino Free</h4>
                                        <h5 class="time">3 minutes ago</h5>
                                    </div>
                                    <p>Ok, cool.</p>
                                </div>
                            </li> 
                        </ul>
                    </li> -->
                       </ul>
                </div>
                
            </div>
        </div>
        </c:forEach>
        
        
    </div><!-- row -->
    
    
    
    
    
    
       <div class=" col-md-4 pull-left"  style="padding-left:1px;padding-right:3px;">
        
        <c:forEach  var="dto" items="${MainDealList3}">

        <div class="col-xs-12 col-sm-12  col-md-12"  style="padding-left:0px;padding-right:0px;">
            <div class="[ panel panel-default ] panel-google-plus" >
                  <!--CountDown  -->
				<div class="col-md-12 col-sm-12 " style="text-align:right; padding:0px; margin:0px; margin-bottom:2px;"  id="countdown${dto.num}">
  					</div><!-- /#Countdown Div -->
                <div class="dropdown">
              
  					
  					<script>
  					$(document).ready(function() {
  						 var target_date = new Date(' ${fn:substring(dto.end_date,5,7)}, ${fn:substring(dto.end_date,8,10)},  ${fn:substring(dto.end_date,0,4)}').getTime();
  						 
  						// variables for time units
  						var days, hours, minutes, seconds;
  						 
  						// get tag element
  						var countdown = document.getElementById('countdown'+${dto.num});
  						 
  						// update the tag with id "countdown" every 1 second
  						setInterval(function () {
  						 
  						    // find the amount of "seconds" between now and target
  						    var current_date = new Date().getTime();
  						    var seconds_left = (target_date - current_date) / 1000;
  						 
  						    // do some time calculations
  						    days = parseInt(seconds_left / 86400);
  						    seconds_left = seconds_left % 86400;
  						     
  						    hours = parseInt(seconds_left / 3600);
  						    seconds_left = seconds_left % 3600;
  						     
  						    minutes = parseInt(seconds_left / 60);
  						    seconds = parseInt(seconds_left % 60);
  						     
  						    // format countdown string + set tag value
  						    countdown.innerHTML = 
  						      '<span style="color:rgba(229, 19, 19, 0.72);font-size:5px; " class="days">' 
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+days+'</span>' 
  						    + ' <b>Days</b></span> <span style="font-size:5px;color:rgba(229, 19, 19, 0.72);" class="hours">' 
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+ hours +'</span>' 
  						    + ' <b>Hours</b></span> <span style="font-size:5p	x;color:rgba(229, 19, 19, 0.72);" class="minutes">'
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:5px;">'
  						 	+ '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+minutes+'</span>'  
  						    + ' <b>Minutes</b></span> <span style="font-size:5px;color:rgba(229, 19, 19, 0.72);" class="seconds">' 
  						    + '<span style="color:rgba(229, 19, 19, 0.72);font-size:20px;">'+ seconds +'</span>'  
  						    + ' <b>Seconds</b></span>';  
  						 
  						}, 1000); 
  				
  					});
  					</script>
                   <!--  <span class="dropdown-toggle" type="button" data-toggle="dropdown">
                        <span class="[ glyphicon glyphicon-chevron-down ]"></span>
                    </span>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                    </ul> -->
                </div>
                <div class="panel-google-plus-tags">
                    <ul>
                        <li>#${dto.tag1}</li>
                    </ul>
                </div>
                <c:set var="success" value="0" />
                      <c:forEach var="successdto" items="${DealSuccessList}">
         		<c:if test="${dto.num==successdto.dealNum}"> 
         			<c:set var="success" value="1" />
                    </c:if>
                    </c:forEach>
                    
                    
                    <c:choose>
    <c:when test="${success==1}">
      <div class="panel-heading" style="padding-bottom: 15px; background-color:rgb(239, 107, 57);">
    </c:when>    
    <c:otherwise>
        <div class="panel-heading" style="padding-bottom: 15px;">
    </c:otherwise>
</c:choose>
                    
               
                    <img class="[ img-circle pull-left ]" src="<%=cp%>/uploads/photo/${dto.imageFilename}" style="width:60px;height:70px;" alt="Mouse0270" />
                    <h3 style="font-size:20px;">${dto.userId}</h3>
                    <h5><span>Shared publicly</span> - <span>Jun 25, 2014</span> </h5>
                </div>
                <div class="panel-body">
                    <a href="<%=cp%>/deal/article.do?num=${dto.num}"><p style="color:black;font-size:20px;">${dto.subject}<!--  <a href="http://bootsnipp.com/snippets/MaWrA">http://bootsnipp.com/snippets/MaWrA</a> --></p></a>
           
                  
               
  					
                    <%--  <c:forEach var="dealdto" items="${DealInList}">
                    <c:if test="${dto.num==dealdto.dealNum}">
                    <div>11111111</div>
                    </c:if>
                    </c:forEach>  --%>
                    <a class="panel-google-plus-image" href="<%=cp%>/deal/article.do?num=${dto.num}">
                        ${dto.image1}
                    </a>
                </div>
                <div class="panel-footer col-md-12 col-sm-12 col-xs-12" style="padding-left:0px;padding-right:0px;">
             <!--        <button type="button" class="[ btn btn-default ]">+1</button>
                    <button type="button" class="[ btn btn-default ]">
                        <span class="[ glyphicon glyphicon-share-alt ]"></span>
                    </button> -->
  

    <div class="text-center">      
         <div class="" data-toggle="buttons">  
         <c:set var="badId" value="0" />
        <c:forEach var="dealdto" items="${DealInList}">
         
                    <c:if test="${dto.num==dealdto.dealNum}"> 
                    
                  <c:set var="badId" value="1" />
                        <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success pull-left">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 참여
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger active pull-left">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 미참여
            </label>     
               </c:if>
                    </c:forEach>  
                
                    
                    <c:if test="${badId==0}">
                                <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success active pull-left">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 참여
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger pull-left">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 미참여
            </label>   
            </c:if>
           
        </div>
    
    </div>
    
    
    
    
      <span class="pull-right">
                      <a class="btn btn-default stat-item  btn-xs pull-right" style="font-size:25px; padding-bottom: 0px;padding-right:5px; ">
                        <i id="like${dto.num}" style="font-size: 30px; backgoround-color:red;" onclick="Like(${dto.num},1);" class="glyphicon glyphicon-thumbs-up"><div style="font-size: 25px;padding-left: 5px;" id="like${dto.num}-bs3" >${dto.countLike}</div></i></a> 
                       <%--  <i id="dislike${dto.num}"  style="font-size: 30px;" onclick="disLike(${dto.num});" class="glyphicon glyphicon-thumbs-down"><div style="font-size: 25px;" id="dislike${dto.num}-bs3">4</div></i> --%> 
           
                    </span>
    

    <c:if test="${sessionScope.member.businessNum>0}">
    <div class="text-center">      
         <div class="" data-toggle="buttons">  
         <c:set var="badId" value="0" />
        <c:forEach var="successdto" items="${DealSuccessList}">
         
                    <c:if test="${dto.num==successdto.dealNum}"> 
                  <c:set var="badId" value="1" />
                        <label id="success${dto.num}" onclick=" dealapprove('${dto.num}',0)" class="btn btn-md btn-success pull-right"  style="color:black;background-color:rgba(255, 220, 104, 0.84);border-color:rgba(255, 255, 255, 0);">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 승인완료
            </label>
              <label id="success${dto.num}" onclick="dealapprove('${dto.num}',1)" class="btn btn-md btn-danger active pull-right" style="background-color:rgba(85, 85, 85, 0.84);border-color:rgba(255, 255, 255, 0);" >
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 승인대기
            </label>     
               </c:if>
                    </c:forEach>  
                
                    
                    <c:if test="${badId==0}">
                                <label onclick="dealapprove('${dto.num}',0)" class="btn btn-md btn-success active pull-right" style="color:black;background-color:rgba(255, 220, 104, 0.84);border-color:rgba(255, 255, 255, 0);">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> 승인완료
            </label>
              <label onclick="dealapprove('${dto.num}',1)" class="btn btn-md btn-danger  pull-right" style="background-color:rgba(85, 85, 85, 0.84);border-color:rgba(255, 255, 255, 0);">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> 승인대기
            </label>   
            </c:if>
           
        </div>
    
    </div>
    </c:if>

                    
                   
                    <div class="input-placeholder col-md-12 col-sm-12 col-xs-12" style="font-size:15px;margin:0px;" onclick="listPage('${dto.num}')">Add a comment...</div>
</div>
                
                
                <div class="panel-google-plus-comment" style="padding:10px;">
                    <c:if test="${pdto.imageFilename==null}">
                   <img class="img-circle" src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46" alt="User Image" /> 
                    </c:if>
                    <c:if test="${pdto.imageFilename!=null}">
                    <img id="imageFilename-${dto.num}" class="img-circle" src="<%=cp%>/uploads/photo/${pdto.imageFilename}" style="width:55px;height:55px;padding-right:2px;" alt="User Image" />
                    </c:if>
                    <div class="panel-google-plus-textarea">
                    
                        <textarea id="replyContent-${dto.num}" style="padding:0px;" rows="5"></textarea>
                        <button type="submit" class="[ btn btn-success disabled ]" onclick="sendReply('${dto.num}')">Post comment</button>
                        <button type="reset" class="[ btn btn-default ]">Cancel</button>
                    </div>
                    <div class="clearfix"></div>
               <ul id="listReply-${dto.num}" style="padding:0px;">
                  <!--   <li class="comment">
                        <a class="pull-left" href="#">
                            <img class="avatar" src="http://bootdey.com/img/Content/user_1.jpg" alt="avatar">
                        </a>
                        <div class="comment-body">
                            <div class="comment-heading">
                               <h5 class="time pull-right">5 minutes ago</h5><h4 class="user">Gavino Free</h4>
                               
                            </div>
                            <p style="word-break:break-all;margin-left:40px;">Sure, oooooooooooooooohhhhhhhhhhhhhhhhddddddddddddddddddddddddddddddddddddddddddddddd</p>
                        </div>
                        <ul class="comments-list">
                            <li class="comment">
                                <a class="pull-left" href="#">
                                    <img class="avatar" src="http://bootdey.com/img/Content/user_3.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Ryan Haywood</h4>
                                        <h5 class="time">3 minutes ago</h5>
                                    </div>
                                    <p>Relax my friend</p>
                                </div>
                            </li> 
                            <li class="comment">
                                <a class="pull-left" href="#">
                                    <img class="avatar" src="http://bootdey.com/img/Content/user_2.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Gavino Free</h4>
                                        <h5 class="time">3 minutes ago</h5>
                                    </div>
                                    <p>Ok, cool.</p>
                                </div>
                            </li> 
                        </ul>
                    </li> -->
                       </ul>
                </div>
                
            </div>
        </div>
        </c:forEach>   
        
        
    </div><!-- row -->
    
    
    
    
    
</div>
<!--콘텐츠  -->

 								
      
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
        </div>
     
