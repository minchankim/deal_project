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
jQuery(document).ready(function($) {
	 
    $('#myCarousel').carousel({
            interval: 5000
    });

    $('#carousel-text').html($('#slide-content-0').html());

    //Handles the carousel thumbnails
   $('[id^=carousel-selector-]').click( function(){
        var id = this.id.substr(this.id.lastIndexOf("-") + 1);
        var id = parseInt(id);
        $('#myCarousel').carousel(id);
    });


    // When the carousel slides, auto update the text
    $('#myCarousel').on('slid.bs.carousel', function (e) {
             var id = $('.item.active').data('slide-number');
            $('#carousel-text').html($('#slide-content-'+id).html());
    });
});
</script>
<style>
.hide-bullets {
list-style:none;
margin-left: -40px;
margin-top:20px;
}
.tabbable-panel {
  border:1px solid #eee;
  padding: 10px;
}

/* Default mode */
.tabbable-line > .nav-tabs {
  border: none;
  margin: 0px;
}
.tabbable-line > .nav-tabs > li {
  margin-right: 2px;
}
.tabbable-line > .nav-tabs > li > a {
  border: 0;
  margin-right: 0;
  color: #737373;
}
.tabbable-line > .nav-tabs > li > a > i {
  color: #a6a6a6;
}
.tabbable-line > .nav-tabs > li.open, .tabbable-line > .nav-tabs > li:hover {
  border-bottom: 4px solid #fbcdcf;
}
.tabbable-line > .nav-tabs > li.open > a, .tabbable-line > .nav-tabs > li:hover > a {
  border: 0;
  background: none !important;
  color: #333333;
}
.tabbable-line > .nav-tabs > li.open > a > i, .tabbable-line > .nav-tabs > li:hover > a > i {
  color: #a6a6a6;
}
.tabbable-line > .nav-tabs > li.open .dropdown-menu, .tabbable-line > .nav-tabs > li:hover .dropdown-menu {
  margin-top: 0px;
}
.tabbable-line > .nav-tabs > li.active {
  border-bottom: 4px solid #f3565d;
  position: relative;
}
.tabbable-line > .nav-tabs > li.active > a {
  border: 0;
  color: #333333;
}
.tabbable-line > .nav-tabs > li.active > a > i {
  color: #404040;
}
.tabbable-line > .tab-content {
  margin-top: -3px;
  background-color: #fff;
  border: 0;
  border-top: 1px solid #eee;
  padding: 15px 0;
}
.portlet .tabbable-line > .tab-content {
  padding-bottom: 0;
}
.carousel-inner{
	width:150%;
}
</style>
<div class="right_col" role="main">
  <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                               
                                    <h2><i class="fa fa-child fa-2x"></i>슬라이드 관리</h2> <div class="x_title"></div>
                                    <div class="title_right">           
											
<br>
<div class="tabbable-panel">
				<div class="tabbable-line">
					<ul class="nav nav-tabs ">
						<li class="active">
							<a href="#tab_default_1" data-toggle="tab">
							의류/잡화 </a>
						</li>
						<li>
							<a href="#tab_default_2" data-toggle="tab">
							뷰티</a>
						</li>
						<li>
							<a href="#tab_default_3" data-toggle="tab">
							  식품 </a>
						</li>
						<li>
							<a href="#tab_default_3" data-toggle="tab">
							가구/생활  </a>
						</li>
						<li>
							<a href="#tab_default_3" data-toggle="tab">
							 레저/자동차</a>
						</li>
						<li>
							<a href="#tab_default_3" data-toggle="tab">
							  디지털/가전</a>
						</li>
						<li>
							<a href="#tab_default_3" data-toggle="tab">
							    도서/취미 </a>
						</li>
						<li>
							<a href="#tab_default_3" data-toggle="tab">
							      지역 </a>
						</li>
					</ul>
					
					<div class="tab-content">
		
						<div class="tab-pane active" id="tab_default_1">
							<div class="container">
				       		 <div id="main_area">
				                <!-- Slider -->
				                <div class="row col-xs-12 col-md-12 col-sm-12">
				                    <div class="col-xs-12 col-md-12 col-sm-12" id="slider">
				                        <!-- Top part of the slider -->
				                        <div class="row">
				                            <div class="col-sm-12" id="carousel-bounding-box">
				                                <div class="carousel slide" id="myCarousel">
				                                    <!-- Carousel items -->
				                                    <div class="carousel-inner">
				                                        <div class="active item" data-slide-number="0">
				                                        <img src="<%=cp%>/res/images/b1.jpg"></div>
				
				                                        <div class="item" data-slide-number="1">
				                                        <img src="<%=cp%>/res/images/b2.jpg"></div>
				
				                                        <div class="item" data-slide-number="2">
				                                        <img src="<%=cp%>/res/images/b3.jpg"></div>
				
				                                        <div class="item" data-slide-number="3">
				                                        <img src="<%=cp%>/res/images/b4.jpg"></div>
				
				                                        <div class="item" data-slide-number="4">
				                                        <img src="<%=cp%>/res/images/b5.jpg"></div>
				                                    </div><!-- Carousel nav -->
				                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				                                        <span class="glyphicon glyphicon-chevron-left"></span>                                       
				                                    </a>
				                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
				                                    </a>                                
				                                    </div>
				                            </div>
				                 </div><br>
				                            <div class="col-md-12" id="carousel-text"></div>
				
				                            <div id="slide-content" style="display: none;">
				                                <div id="slide-content-0">
				                                    <span>Slider One 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				
				                                <div id="slide-content-1">
				                                    <span>Slider Two 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				
				                                <div id="slide-content-2">
				                                    <span>Slider Three 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				
				                                <div id="slide-content-3">
				                                    <span>Slider Four 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				
				                                <div id="slide-content-4">
				                                   <span>Slider Five 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				                            </div>
				       
				                    </div>
				                </div><!--/Slider-->
		
				                <div class="row hidden-xs" id="slider-thumbs">
				                        <!-- Bottom switcher of slider -->		<br>
				                        <ul class="hide-bullets">
				                            <li class="col-sm-4">
				                                <a class="thumbnail" id="carousel-selector-0"><img src="<%=cp%>/res/images/b1.jpg"></a>
				                            </li>
				
				                            <li class="col-sm-4">
				                                <a class="thumbnail" id="carousel-selector-1"><img src="<%=cp%>/res/images/b2.jpg"></a>
				                            </li>
				
				                            <li class="col-sm-4">
				                                <a class="thumbnail" id="carousel-selector-2"><img src="<%=cp%>/res/images/b3.jpg"></a>
				                            </li>
				
				                            <li class="col-sm-6">
				                                <a class="thumbnail" id="carousel-selector-3"><img src="<%=cp%>/res/images/b4.jpg"></a>
				                            </li>
				
				                            <li class="col-sm-6">
				                                <a class="thumbnail" id="carousel-selector-4"><img src="<%=cp%>/res/images/b5.jpg"></a>
				                            </li>
				
				                        </ul>                 
				                </div>
				        </div>
</div>
						</div>
						<div class="tab-pane" id="tab_default_2">
							<div class="container">
        <div id="main_area">
                <!-- Slider -->
                <div class="row col-xs-12 col-md-12 col-sm-12">
                    <div class="col-xs-12 col-md-12 col-sm-12" id="slider">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-sm-8" id="carousel-bounding-box">
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <div class="active item" data-slide-number="0">
                                         <img src="<%=cp%>/res/images/b1.jpg"></div>
				
				                                        <div class="item" data-slide-number="1">
				                                        <img src="<%=cp%>/res/images/b2.jpg"></div>
				
				                                        <div class="item" data-slide-number="2">
				                                        <img src="<%=cp%>/res/images/b3.jpg"></div>
				
				                                        <div class="item" data-slide-number="3">
				                                        <img src="<%=cp%>/res/images/b4.jpg"></div>
				
				                                        <div class="item" data-slide-number="4">
				                                        <img src="<%=cp%>/res/images/b5.jpg"></div>
                                    </div><!-- Carousel nav -->
                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>                                       
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                    </a>                                
                                    </div>
                            </div>
                 </div>
                            <div class="col-sm-4" id="carousel-text"></div>

                          <div id="slide-content" style="display: none;">
				                                <div id="slide-content-0">
				                                    <span>Slider One 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				
				                                <div id="slide-content-1">
				                                    <span>Slider Two 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				
				                                <div id="slide-content-2">
				                                    <span>Slider Three 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				
				                                <div id="slide-content-3">
				                                    <span>Slider Four 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				
				                                <div id="slide-content-4">
				                                   <span>Slider Five 등록일 : 2015-12-06
				                                    <button type="button" class="btn btn-dark" style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">UPLOADS</button>
				                                   </span>
				                                </div>
				                            </div>
       
                    </div>
                </div><!--/Slider-->

                <div class="row hidden-xs" id="slider-thumbs">
                        <!-- Bottom switcher of slider -->
                        <ul class="hide-bullets">
                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-0"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-1"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-2"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-3"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-4"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                        </ul>                 
                </div>
        </div>
</div>
						</div>
						<div class="tab-pane" id="tab_default_3">
							<div class="container">
        <div id="main_area">
                <!-- Slider -->
                <div class="row col-xs-12 col-md-12 col-sm-12">
                    <div class="col-xs-12 col-md-12 col-sm-12" id="slider">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-sm-8" id="carousel-bounding-box">
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <div class="active item" data-slide-number="0">
                                        <img src="<%=cp%>/res/images/b5.jpg"></div>

                                        <div class="item" data-slide-number="1">
                                        <img src="<%=cp%>/res/images/b5.jpg"></div>

                                        <div class="item" data-slide-number="2">
                                        <img src="<%=cp%>/res/images/b5.jpg"></div>

                                        <div class="item" data-slide-number="3">
                                        <img src="<%=cp%>/res/images/b5.jpg"></div>

                                        <div class="item" data-slide-number="4">
                                        <img src="<%=cp%>/res/images/b5.jpg"></div>
                                    </div><!-- Carousel nav -->
                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>                                       
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                    </a>                                
                                    </div>
                            </div>
                 </div>
                            <div class="col-sm-4" id="carousel-text"></div>

                            <div id="slide-content" style="display: none;">
                                <div id="slide-content-0">
                                    <h2>Slider One</h2>
                                    <p>Lorem Ipsum Dolor</p>
                                    <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                </div>

                                <div id="slide-content-1">
                                    <h2>Slider Two</h2>
                                    <p>Lorem Ipsum Dolor</p>
                                    <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                </div>

                                <div id="slide-content-2">
                                    <h2>Slider Three</h2>
                                    <p>Lorem Ipsum Dolor</p>
                                    <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                </div>

                                <div id="slide-content-3">
                                    <h2>Slider Four</h2>
                                    <p>Lorem Ipsum Dolor</p>
                                    <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                </div>

                                <div id="slide-content-4">
                                    <h2>Slider Five</h2>
                                    <p>Lorem Ipsum Dolor</p>
                                    <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                </div>

                                <div id="slide-content-5">
                                    <h2>Slider Six</h2>
                                    <p>Lorem Ipsum Dolor</p>
                                    <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
                                </div>
                            </div>
       
                    </div>
                </div><!--/Slider-->

                <div class="row hidden-xs" id="slider-thumbs">
                        <!-- Bottom switcher of slider -->
                        <ul class="hide-bullets">
                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-0"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-1"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-2"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-3"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                            <li class="col-sm-2">
                                <a class="thumbnail" id="carousel-selector-4"><img src="<%=cp%>/res/images/b5.jpg"></a>
                            </li>

                        </ul>                 
                </div>
        </div>
</div>
						</div>
					</div>
				</div>
			</div>
		
  </div>
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div><!-- panel 끝 -->

</div>

 
</div>


 



