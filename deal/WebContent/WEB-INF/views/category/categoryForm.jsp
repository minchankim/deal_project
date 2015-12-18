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
	
	
	var params="dealNum="+dealNum;
	params+="&content="+content;

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

</script>

<script src="//rawgithub.com/ashleydw/lightbox/master/dist/ekko-lightbox.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<div class="right_col" role="main">


<!--대표이미지  -->
<div class="col-xs-12 col-sm-12 col-md-12" style="padding-bottom:120px;padding-left:0px;padding-right:0px;">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
      <!-- Wrapper for slides -->
      <div class="carousel-inner">
      
        <div class="item active">
          <img src="<%=cp%>/res/images/b1.jpg">

        </div><!-- End Item -->
 
         <div class="item">
          <img src="<%=cp%>/res/images/b2.jpg">
          
        </div><!-- End Item -->
        
        <div class="item">
          <img src="<%=cp%>/res/images/b3.jpg">
        </div><!-- End Item -->
        
        <div class="item">
          <img src="<%=cp%>/res/images/b4.jpg">
        </div><!-- End Item -->

        <div class="item">
          <img src="<%=cp%>/res/images/b5.jpg">
        </div><!-- End Item -->
                
      </div><!-- End Carousel Inner -->


    <ul class="list-group col-md-4 col-sm-4 col-xs-1" style="margin-bottom:0px;"> <!-- 이거 슬라이드 내용 바뀐거고  -->
      <li data-target="#myCarousel" data-slide-to="0" class="list-group-item active" style="font-size: 11pt;border-color:rgba(169, 66, 155, 0.35);">신도림 쉐라톤 피스트뷔페 연말 특가
      <br><span style="font-size: 13pt;">15%</span>
      </li>
      <li data-target="#myCarousel" data-slide-to="1" class="list-group-item"  style="font-size: 11pt;border-color:rgba(169, 66, 155, 0.35);">더센터오브 필라테스 운동시작 [전국]
       <br><span style="font-size: 13pt;">20%</span>
       </li>
      <li data-target="#myCarousel" data-slide-to="2" class="list-group-item"  style="font-size: 11pt;border-color:rgba(169, 66, 155, 0.35);">커피베이 아메리카노 [전국]
       <br><span style="font-size: 13pt;">40%</span>
       </li>
      <li data-target="#myCarousel" data-slide-to="3" class="list-group-item"  style="font-size: 11pt;border-color:rgba(169, 66, 155, 0.35);">그랜드호텔 그리츠 뷔페 [여의도]
       <br><span style="font-size: 13pt;">38,330원</span>
       </li>
      <li data-target="#myCarousel" data-slide-to="4" class="list-group-item"  style="font-size: 11pt;border-color:rgba(169, 66, 155, 0.35);">전국 오빠닭 BEST 메뉴
       <br><span style="font-size: 13pt;">33%</span>
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


<div class="col-xs-6 col-sm-6 col-md-2 pull-left " >


	<div class="row">
		<div style="padding:0px;" class=" col-xs-12 col-sm-12 col-md-12 sidebar">
    <div class="mini-submenu">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
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
   
</div>
	</div>
</div>

<!--콘텐츠  -->
<div class="container" >
    <div class="row">
        
        <c:forEach  var="dto" items="${CategoryDealList}">
        <div class="[ col-xs-12 col-sm-4 col-md-4] pull-left" >
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
                <div class="panel-heading">
                    <img class="[ img-circle pull-left ]" src="https://lh3.googleusercontent.com/-CxXg7_7ylq4/AAAAAAAAAAI/AAAAAAAAAQ8/LhCIKQC5Aq4/s46-c-k-no/photo.jpg" alt="Mouse0270" />
                    <h3 style="font-size:20px;">${dto.userId}</h3>
                    <h5><span>Shared publicly</span> - <span>Jun 25, 2014</span> </h5>
                </div>
                <div class="panel-body">
                    <a href="<%=cp%>/deal/article.do?num=${dto.num}"><p style="font-size:20px;">${dto.subject}<!--  <a href="http://bootsnipp.com/snippets/MaWrA">http://bootsnipp.com/snippets/MaWrA</a> --></p></a>
                    <a class="panel-google-plus-image" href="<%=cp%>/deal/article.do?num=${dto.num}">
                        ${dto.image1}
                    </a>
                </div>
                <div class="panel-footer">
                    <button type="button" class="[ btn btn-default ]">+1</button>
                    <button type="button" class="[ btn btn-default ]">
                        <span class="[ glyphicon glyphicon-share-alt ]"></span>
                    </button>
                     <span class="pull-right">
                        <i id="like${dto.num}" style="font-size: 30px; backgoround-color:red;" onclick="Like(${dto.num},1);" class="glyphicon glyphicon-thumbs-up"><div style="font-size: 25px;" id="like${dto.num}-bs3" >${dto.countLike}</div></i> 
                       <%--  <i id="dislike${dto.num}"  style="font-size: 30px;" onclick="disLike(${dto.num});" class="glyphicon glyphicon-thumbs-down"><div style="font-size: 25px;" id="dislike${dto.num}-bs3">4</div></i> --%> 
                    </span>
                    <div class="input-placeholder" style="font-size:15px;" onclick="listPage('${dto.num}')">Add a comment...</div>
                </div>
                <div class="panel-google-plus-comment" style="padding:10px;">
                    <c:if test="${pdto.imageFilename==null}">
                   <img class="img-circle" src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46" alt="User Image" /> 
                    </c:if>
                    <c:if test="${pdto.imageFilename!=null}">
                    <img class="img-circle" src="<%=cp%>/uploads/photo/${pdto.imageFilename}" style="width:55px;height:55px;padding-right:2px;" alt="User Image" />
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
        
        
        
        
        
         
        
         
        
        
        
    </div>
</div>
<!--콘텐츠  -->

 								
      
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
        </div>
