<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   -->

   <link href="<%=cp%>/res/template/css/main/minchanmain.css" rel="stylesheet">
   
<script type="text/javascript">
 
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
	$.post(url, {dealNum:dealNum}, function(data){
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
</style>
<div class="right_col" role="main">


<!--대표이미지  -->
<div class="col-xs-12 col-sm-12 col-md-10" style="padding-bottom:0px;padding-left:0px;padding-right:0px;">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
      <!-- Wrapper for slides -->
      <div class="carousel-inner">
      
        <div class="item active">
          <img src="<%=cp%>/res/images/main1.jpg">

        </div><!-- End Item -->
 
         <div class="item">
          <img src="<%=cp%>/res/images/main2.jpg">
          
        </div><!-- End Item -->
        
        <div class="item">
          <img src="<%=cp%>/res/images/fifa2.png">
    <!--        <div class="carousel-caption col-xs-12 col-sm-12 col-md-12">
            <h4><a href="#">cccccccccccccccccccccccccccccccccc</a></h4>
            <p>cccccccccccccccccccccccccccccccccccccccccccccc <a class="label label-primary" href="http://sevenx.de/demo/bootstrap-carousel/" target="_blank">Free Bootstrap Carousel Collection</a></p>
          </div> -->
        </div><!-- End Item -->
        
        <div class="item">
          <img src="<%=cp%>/res/images/wmp2.png">
        <!--    <div class="carousel-caption col-xs-12 col-sm-12 col-md-12">
            <h4><a href="#">ddddddddddddddddddddddddddddddddd</a></h4>
            <p>ddddddddddddddddddddddddddddddddddddddddddddddd<a class="label label-primary" href="http://sevenx.de/demo/bootstrap-carousel/" target="_blank">Free Bootstrap Carousel Collection</a></p>
          </div> -->
        </div><!-- End Item -->

        <div class="item">
          <img src="<%=cp%>/res/images/wmp3.png">
          <!--  <div class="carousel-caption col-xs-12 col-sm-12 col-md-12">
            <h4><a href="#">tempor invidunt ut labore et dolore magna aliquyam erat</a></h4>
            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. <a class="label label-primary" href="http://sevenx.de/demo/bootstrap-carousel/" target="_blank">Free Bootstrap Carousel Collection</a></p>
          </div> -->
        </div><!-- End Item -->
                
      </div><!-- End Carousel Inner -->


    <ul class="list-group col-sm-4">
      <li data-target="#myCarousel" data-slide-to="0" class="list-group-item active"><h4>1111</h4></li>
      <li data-target="#myCarousel" data-slide-to="1" class="list-group-item"><h4>2122</h4></li>
      <li data-target="#myCarousel" data-slide-to="2" class="list-group-item"><h4>3333</h4></li>
      <li data-target="#myCarousel" data-slide-to="3" class="list-group-item"><h4>4444</h4></li>
      <li data-target="#myCarousel" data-slide-to="4" class="list-group-item"><h4>55555</h4></li>
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


<div class="col-xs-6 col-sm-6 col-md-2 pull-left " >


	<div class="row">
		<div style="padding:0px;" class=" col-xs-12 col-sm-12 col-md-12 sidebar">
    <div class="mini-submenu">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>
    <div id="RollingTest" class="list-group">
        <span href="#" class="list-group-item active" style="background: rgb(239, 57, 57); color: #ffffff;">
            실시간 급상승 검색어
            <span class="pull-right" id="slide-submenu">
                <i class="fa fa-times"></i>
            </span>
        </span>
       <a href="#" class="list-group-item">
          <marquee behavior=slide   direction=down  scrollamount="3" id="e1">    1.김태희 <span class="fa  fa-sort-desc pull-right"></span></marquee> 
        </a>
     
        
        <a href="#" class="list-group-item">
         <marquee behavior=slide   direction=down  scrollamount="3" id="e2">  2.비 <span class="fa fa-sort-up   pull-right" style="color:#DB0000;"></span></marquee> 
        </a>
        <a href="#" class="list-group-item">
        <marquee behavior=slide   direction=down  scrollamount="3" id="e3">     3.디스패치 <span class="fa  fa-sort-desc pull-right"></span></marquee> 
        </a>
        <a href="#" class="list-group-item">
       <marquee behavior=slide   direction=down  scrollamount="3" id="e4">       4.수능  </marquee> 
        </a>
        <a href="#" class="list-group-item">
         <marquee behavior=slide   direction=down  scrollamount="3" id="e5">    5.2호선  <span class="fa fa-sort-up   pull-right"  style="color:#DB0000;"></span></marquee> 
        </a>
    </div>        
</div>
	</div>
</div>


<div class="col-xs-6 col-sm-6 col-md-2 pull-left " >


	<div class="row">
		<div style="padding:0px;" class=" col-xs-12 col-sm-12 col-md-12 sidebar">
    <div class="mini-submenu">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>
    <div class="list-group">
        <span href="#" class="list-group-item active" style="background: rgb(239, 57, 57); color: #ffffff;">
           딜러왕
            <span class="pull-right" id="slide-submenu">
                <i class="fa fa-times"></i>
            </span>
        </span>
         <a href="#" class="list-group-item">
        <marquee behavior=slide   direction=down  scrollamount="3" id="d1">      1.김민찬 <span class="badge">68%</span></marquee>
        </a>
        <a href="#" class="list-group-item">
        <marquee behavior=slide   direction=down  scrollamount="3" id="d2">     2.비 <span class="badge">22%</span></marquee>
        </a>
        <a href="#" class="list-group-item">
        <marquee behavior=slide   direction=down  scrollamount="3" id="d3">      3.김태희 <span class="badge">19%</span></marquee>
         </a>
        <a href="#" class="list-group-item">
       <marquee behavior=slide   direction=down  scrollamount="3" id="d4">      4. 제지선 <span class="badge">13%</span></marquee>
        </a>

    </div>        
</div>
	</div>
</div>


<div class="col-xs-6 col-sm-6 col-md-4 pull-rigt ">


	<div class="row">
		<div style="padding:0px;" class=" col-xs-12 col-sm-12 col-md-12 sidebar">
    <div class="mini-submenu">
        <span class="icon-bar"></span>	
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>
    <div class="list-group">
        <span href="#" class="list-group-item active" style="color:black;background-color:rgba(26, 130, 195, 0);">
           월간베스트
            <span class="pull-right" id="slide-submenu">
                <i class="fa fa-times"></i>
            </span>
        </span>
        <a href="#" class="list-group-item">
            <i class="fa fa-comment-o"></i> 1.김민찬 68%
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-search"></i> 2.비 22%
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-user"></i> 3.김태희 1%
         </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-folder-open-o"></i> 김태희 1% <span class="badge">14</span>
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-bar-chart-o"></i> 김태희 1% <span class="badge">14</span>
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-envelope"></i> 김태희 1%
        </a>
    </div>        
</div>
	</div>
</div>

<div class="col-xs-6 col-sm-6 col-md-4 pull-rigt ">


	<div class="row">
		<div style="padding:0px;" class=" col-xs-12 col-sm-12 col-md-12 sidebar">
    <div class="mini-submenu">
        <span class="icon-bar"></span>	
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>
    <div class="list-group">
        <span href="#" class="list-group-item active" style="color:black;background-color:rgba(26, 130, 195, 0);">
           	주간베스트
            <span class="pull-right" id="slide-submenu">
                <i class="fa fa-times"></i>
            </span>
        </span>
        <a href="#" class="list-group-item">
            <i class="fa fa-comment-o"></i> 1.김민찬 68%
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-search"></i> 2.비 22%
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-user"></i> 3.김태희 1%
         </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-folder-open-o"></i> 김태희 1% <span class="badge">14</span>
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-bar-chart-o"></i> 김태희 1% <span class="badge">14</span>
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-envelope"></i> 김태희 1%
        </a>
    </div>        
</div>
	</div>
</div>

<div class="col-xs-6 col-sm-6 col-md-4 pull-rigt ">


	<div class="row">
		<div style="padding:0px;" class=" col-xs-12 col-sm-12 col-md-12 sidebar">
    <div class="mini-submenu">
        <span class="icon-bar"></span>	
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>
    <div class="list-group">
        <span href="#" class="list-group-item active" style="color:black;background-color:rgba(26, 130, 195, 0);">
           	최다클릭수
            <span class="pull-right" id="slide-submenu">
                <i class="fa fa-times"></i>
            </span>
        </span>
        <a href="#" class="list-group-item">
            <i class="fa fa-comment-o"></i> 1.김민찬 68%
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-search"></i> 2.비 22%
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-user"></i> 3.김태희 1%
         </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-folder-open-o"></i> 김태희 1% <span class="badge">14</span>
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-bar-chart-o"></i> 김태희 1% <span class="badge">14</span>
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-envelope"></i> 김태희 1%
        </a>
    </div>        
</div>
	</div>
</div>


<!--콘텐츠  -->
<div class="container"  >
    <div class="row col-md-4" >
        
        <c:forEach  var="dto" items="${MainDealList1}">
        <div class="[ col-xs-12 col-sm-12 <!-- col-md-12 -->]" >
            <div class="[ panel panel-default ] panel-google-plus" >
                <div class="dropdown">
                    <span class="dropdown-toggle" type="button" data-toggle="dropdown">
                        <span class="[ glyphicon glyphicon-chevron-down ]"></span>
                    </span>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                    </ul>
                </div>
                <div class="panel-google-plus-tags">
                    <ul>
                        <li>#${dto.tag1}</li>
                    </ul>
                </div>
                <div class="panel-heading" style=" padding-bottom: 15px;" >
                    <img class="[ img-circle pull-left ]" src="<%=cp%>/uploads/photo/${dto.imageFilename}" style="width:60px;height:70px;" alt="Mouse0270" />
                    <h3 style="font-size:20px;">${dto.userId}</h3>
                    <h5><span>Shared publicly</span> - <span>Jun 25, 2014</span> </h5>
                </div>
                <div class="panel-body">
                    <a href="<%=cp%>/deal/article.do?num=${dto.num}"><p style="font-size:20px;">${dto.subject}<!--  <a href="http://bootsnipp.com/snippets/MaWrA">http://bootsnipp.com/snippets/MaWrA</a> --></p></a>
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
                        <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success ">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> Deal에 참여하였습니다.
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger active">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> Deal에 참여하지 않았습니다.
            </label>     
               </c:if>
                    </c:forEach>  
                
                    
                    <c:if test="${badId==0}">
                                <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success active">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> Deal에 참여하였습니다.
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger ">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> Deal에 참여하지 않았습니다.
            </label>   
            </c:if>
                    

        
        
           
           
        </div>
   
    
    
    </div>
                    
                    
                     <span class="pull-right">
                      <a class="btn btn-default stat-item " style="font-size:25px; padding-bottom: 5px;padding-right:5px; ">
                        <i id="like${dto.num}" style="font-size: 30px; backgoround-color:red;" onclick="Like(${dto.num},1);" class="glyphicon glyphicon-thumbs-up"><div style="font-size: 25px;padding-left: 5px;" id="like${dto.num}-bs3" >${dto.countLike}</div></i></a> 
                       <%--  <i id="dislike${dto.num}"  style="font-size: 30px;" onclick="disLike(${dto.num});" class="glyphicon glyphicon-thumbs-down"><div style="font-size: 25px;" id="dislike${dto.num}-bs3">4</div></i> --%> 
           
                    </span>
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
    
     <div class="row col-md-4" >
        
        <c:forEach  var="dto" items="${MainDealList2}">
        <div class="[ col-xs-12 col-sm-12 <!-- col-md-12 -->]" >
            <div class="[ panel panel-default ] panel-google-plus" >
                <div class="dropdown">
                    <span class="dropdown-toggle" type="button" data-toggle="dropdown">
                        <span class="[ glyphicon glyphicon-chevron-down ]"></span>
                    </span>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                    </ul>
                </div>
                <div class="panel-google-plus-tags">
                    <ul>
                        <li>#${dto.tag1}</li>
                    </ul>
                </div>
                <div class="panel-heading" style=" padding-bottom: 15px;" >
                    <img class="[ img-circle pull-left ]" src="<%=cp%>/uploads/photo/${dto.imageFilename}"  style="width:60px;height:70px;" />
                    <h3 style="font-size:20px;">${dto.userId}</h3>
                    <h5><span>Shared publicly</span> - <span>Jun 25, 2014</span> </h5>
                </div>
                <div class="panel-body">
                    <a href="<%=cp%>/deal/article.do?num=${dto.num}"><p style="font-size:20px;">${dto.subject}<!--  <a href="http://bootsnipp.com/snippets/MaWrA">http://bootsnipp.com/snippets/MaWrA</a> --></p></a>
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
                        <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success ">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> Deal에 참여하였습니다.
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger active">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> Deal에 참여하지 않았습니다.
            </label>     
               </c:if>
                    </c:forEach>  
                
                    
                    <c:if test="${badId==0}">
                                <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success active">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> Deal에 참여하였습니다.
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger ">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> Deal에 참여하지 않았습니다.
            </label>   
            </c:if>
                    

        
        
           
           
        </div>
   
    
    
    </div>
                    
                    
                     <span class="pull-right">
                        <i id="like${dto.num}" style="font-size: 30px; backgoround-color:red;" onclick="Like(${dto.num},1);" class="glyphicon glyphicon-thumbs-up"><div style="font-size: 25px;" id="like${dto.num}-bs3" >${dto.countLike}</div></i> 
                       <%--  <i id="dislike${dto.num}"  style="font-size: 30px;" onclick="disLike(${dto.num});" class="glyphicon glyphicon-thumbs-down"><div style="font-size: 25px;" id="dislike${dto.num}-bs3">4</div></i> --%> 
                    </span>
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
    
    
    
    
    
    
       <div class="row col-md-4" >
        
        <c:forEach  var="dto" items="${MainDealList3}">
        <div class="[ col-xs-12 col-sm-12 <!-- col-md-12 -->]" >
            <div class="[ panel panel-default ] panel-google-plus" >
                <div class="dropdown">
                    <span class="dropdown-toggle" type="button" data-toggle="dropdown">
                        <span class="[ glyphicon glyphicon-chevron-down ]"></span>
                    </span>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                    </ul>
                </div>
                <div class="panel-google-plus-tags">
                    <ul>
                        <li>#${dto.tag1}</li>
                    </ul>
                </div>
                <div class="panel-heading" style=" padding-bottom: 15px;" >
                    <img class="[ img-circle pull-left ]" src="<%=cp%>/uploads/photo/${dto.imageFilename}" alt="Mouse0270"  style="width:60px;height:70px;" />
                    <h3 style="font-size:20px;">${dto.userId}</h3>
                    <h5><span>Shared publicly</span> - <span>Jun 25, 2014</span> </h5>
                </div>
                <div class="panel-body">
                    <a href="<%=cp%>/deal/article.do?num=${dto.num}"><p style="font-size:20px;">${dto.subject}<!--  <a href="http://bootsnipp.com/snippets/MaWrA">http://bootsnipp.com/snippets/MaWrA</a> --></p></a>
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
                        <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success ">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> Deal에 참여하였습니다.
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger active">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> Deal에 참여하지 않았습니다.
            </label>     
               </c:if>
                    </c:forEach>  
                
                    
                    <c:if test="${badId==0}">
                                <label onclick="dealjoin('${dto.num}',0)" class="btn btn-md btn-success active">
                <input type="radio" name="options"  id="dealin${dto.num}" autocomplete="off" checked>
                <i class="fa fa-check"></i> Deal에 참여하였습니다.
            </label>
              <label onclick="dealjoin('${dto.num}',1)" class="btn btn-md btn-danger ">
                <input type="radio" name="options"  id="dealout${dto.num}" autocomplete="off">
                <i class="fa fa-check"></i> Deal에 참여하지 않았습니다.
            </label>   
            </c:if>
                    

        
        
           
           
        </div>
   
    
    
    </div>
                    
                    
                     <span class="pull-right">
                        <i id="like${dto.num}" style="font-size: 30px; backgoround-color:red;" onclick="Like(${dto.num},1);" class="glyphicon glyphicon-thumbs-up"><div style="font-size: 25px;" id="like${dto.num}-bs3" >${dto.countLike}</div></i> 
                       <%--  <i id="dislike${dto.num}"  style="font-size: 30px;" onclick="disLike(${dto.num});" class="glyphicon glyphicon-thumbs-down"><div style="font-size: 25px;" id="dislike${dto.num}-bs3">4</div></i> --%> 
                       
                    </span>
                    
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
     
