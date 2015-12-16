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
   
<script src="//rawgithub.com/ashleydw/lightbox/master/dist/ekko-lightbox.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});
</script>

<div class="right_col" role="main">
  <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                               
                                    <h2><i class="fa fa-child fa-2x"></i>슬라이드 관리</h2> <div class="x_title"></div>
                                    <div class="title_right">           
											
<br>
			        <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11 bhoechie-tab-container">
			            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 bhoechie-tab-menu">
			              <div class="list-group">
			                <a href="#" class="list-group-item active text-center">
			                 의류/잡화
			                </a>
			                <a href="#" class="list-group-item text-center">
			                뷰티
			                </a>
			                <a href="#" class="list-group-item text-center">
			                   식품 
			                </a>
			                <a href="#" class="list-group-item text-center">
			                  가구/생활 
			                </a>
			                <a href="#" class="list-group-item text-center">
			                  레저/자동차
			                </a>
			                   <a href="#" class="list-group-item text-center">
			                디지털/가전
			                </a>
			                   <a href="#" class="list-group-item text-center">
			                 도서/취미
			                </a>
			                   <a href="#" class="list-group-item text-center">
			                지역 
			                </a>
			              </div>
			            </div>
			            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 bhoechie-tab">
			                <!-- flight section -->
			                <div class="bhoechie-tab-content active">
			                <a href="<%=cp%>"><button type="button" class="btn btn-dark" style="pull-right">올리기</button></a>
			                   의류 슬라이드
			                </div>
			                <!-- train section -->
			                <div class="bhoechie-tab-content">
			                <a href="<%=cp%>"><button type="button" class="btn btn-dark"  style="pull-right">올리기</button></a>
			                      뷰티  슬라이드
			                </div>
			    
			                <!-- hotel search -->
			                <div class="bhoechie-tab-content">
			                <a href="<%=cp%>"><button type="button" class="btn btn-dark" style="pull-right">올리기</button></a>
			                    식품 슬라이드
			                </div>
			                <div class="bhoechie-tab-content">
			                <a href="<%=cp%>"><button type="button" class="btn btn-dark" style="pull-right">올리기</button></a>
			                   가구/생활 슬라이드
			                </div>
			                <div class="bhoechie-tab-content">
			                <a href="<%=cp%>"><button type="button" class="btn btn-dark" style="pull-right">올리기</button></a>
			                     레저/자동차 슬라이드
			                </div>
			                <div class="bhoechie-tab-content">
			                <a href="<%=cp%>"><button type="button" class="btn btn-dark" style="pull-right">올리기</button></a>
			                     디지털/가전 슬라이드
			                </div>
			                <div class="bhoechie-tab-content">
			                <a href="<%=cp%>"><button type="button" class="btn btn-dark" style="pull-right">올리기</button></a>
			                     도서/취미 슬라이드
			                </div>
			                <div class="bhoechie-tab-content">
			                <a href="<%=cp%>"><button type="button" class="btn btn-dark" style="pull-right">올리기</button></a>
			                    지역 슬라이드
			                </div>
			            </div>
			        </div><!-- tab끝 -->
  </div>
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div><!-- panel 끝 -->

</div>

 
</div>


  
  
 <style>
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,900|Oswald);
body{
    padding: 50px 0;
    margin: 0px 0px;
}
.status {
    font-family: 'Source Sans Pro', sans-serif;
}
.status .panel-title {
    font-family: 'Oswald', sans-serif;
    font-size: 72px;
    font-weight: bold;
    color: #fff;
    line-height: 45px;
    padding-top: 20px;
    letter-spacing: -0.8px;
}
.progress {
    position: relative;
	height: 25px;
}
.progress > .progress-type {
	position: absolute;
	left: 0px;
	font-weight: 800;
	padding: 3px 30px 2px 10px;
	color: rgb(255, 255, 255);
	background-color: rgba(25, 25, 25, 0.2);
}
.progress > .progress-completed {
	position: absolute;
	right: 0px;
	font-weight: 800;
	padding: 3px 10px 2px;
}

/*  bhoechie tab */
div.bhoechie-tab-container{
  z-index: 10;
  background-color: #ffffff;
  padding: 0 !important;
  border-radius: 4px;
  -moz-border-radius: 4px;
  border:1px solid #ddd;
  margin-top: 20px;
  margin-left: 50px;
  -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  box-shadow: 0 6px 12px rgba(0,0,0,.175);
  -moz-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  background-clip: padding-box;
  opacity: 0.97;
  filter: alpha(opacity=97);
  height:1000px;
}
div.bhoechie-tab-menu{
  padding-right: 0;
  padding-left: 0;
  padding-bottom: 0;
}
div.bhoechie-tab-menu div.list-group{
  margin-bottom: 0;
}
div.bhoechie-tab-menu div.list-group>a{
  margin-bottom: 0;
}
div.bhoechie-tab-menu div.list-group>a .glyphicon,
div.bhoechie-tab-menu div.list-group>a .fa {
  color: #5A55A3;
}
div.bhoechie-tab-menu div.list-group>a:first-child{
  border-top-right-radius: 0;
  -moz-border-top-right-radius: 0;
}
div.bhoechie-tab-menu div.list-group>a:last-child{
  border-bottom-right-radius: 0;
  -moz-border-bottom-right-radius: 0;
}
div.bhoechie-tab-menu div.list-group>a.active,
div.bhoechie-tab-menu div.list-group>a.active .glyphicon,
div.bhoechie-tab-menu div.list-group>a.active .fa{
  background-color: #5A55A3;
  background-image: #5A55A3;
  color: #ffffff;
}
div.bhoechie-tab-menu div.list-group>a.active:after{
  content: '';
  position: absolute;
  left: 100%;
  top: 50%;
  margin-top: -13px;
  border-left: 0;
  border-bottom: 13px solid transparent;
  border-top: 13px solid transparent;
  border-left: 10px solid #5A55A3;
}

div.bhoechie-tab-content{
  background-color: #ffffff;
  /* border: 1px solid #eeeeee; */
  padding-left: 20px;
  padding-top: 10px;
}

div.bhoechie-tab div.bhoechie-tab-content:not(.active){
  display: none;
}
</style>



