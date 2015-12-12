<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>




 
  
    <!-- bootstrap progress js -->
    <script src="<%=cp%>/res/template/js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="<%=cp%>/res/template/js/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- icheck -->
    <script src="<%=cp%>/res/template/js/icheck/icheck.min.js"></script>

   <!--  <script src="js/custom.js"></script> -->

  <!-- ion_range -->
    <link rel="stylesheet" href="<%=cp%>/res/template/css/normalize.css" />
    <link rel="stylesheet" href="<%=cp%>/res/template/css/ion.rangeSlider.css" />
    <link rel="stylesheet" href="<%=cp%>/res/template/css/ion.rangeSlider.skinFlat.css" />

  <!-- colorpicker -->
    <link href="<%=cp%>/res/template/css/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet">
    
   
  
  
  <!-- daterangepicker -->
    <script type="text/javascript" src="<%=cp%>/res/template/js/moment.min2.js"></script>
    <script type="text/javascript" src="<%=cp%>/res/template/js/datepicker/daterangepicker.js"></script>

    <!-- range slider -->
    <script src="<%=cp%>/res/template/js/ion_range/ion.rangeSlider.min.js"></script>
  
 <!-- ion_range -->
<!--    <script>



    
    function changeimg(){
    	
    	
    	
    }
    </script> -->

   <div class="right_col" role="main">
   
   <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>DEAL 상세 :: DEAL Information Page</h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>page design</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a href="#"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="#"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                        <div class="product-image">
                                            ${dealPhoto[0]}
                                        </div>
                                        <div class="product_gallery">
                                            <a>
                                                 ${dealPhoto[1]}
                                            </a>
                                            <a>
                                               ${dealPhoto[2]}
                                            </a>
                                            <a>
                                             ${dealPhoto[3]}
                                            </a>
                                            <a>
                                                ${dealPhoto[4]}
                                            </a>
                                            <a>
                                               ${dealPhoto[5]}
                                            </a>
                                            <a>
                                               ${dealPhoto[6]}
                                            </a>
                                            <a>
                                               ${dealPhoto[7]}
                                            </a>
                                            <a>
                                               ${dealPhoto[8]}
                                            </a>
                                            <a>
                                               ${dealPhoto[9]}
                                            </a>
                                        </div>
                                    </div>	

                                    <div class="col-md-5 col-sm-5 col-xs-12 pull-right" style="border:0px solid #e5e5e5;">

                                        <h3 class="prod_title">${dealArticle.subject}</h3>

                                        <%-- <p>${dealArticle.content}</p> --%>
                                        <br />

                                        <div class="">
                                            <h2>딜 참여자 목록</h2>
                                            <ul class="list-inline prod_color">
                                             <c:forEach  var="dto" items="${dealInPeople}">   
                                                <li>
                                                    <p>${dto.userId}</p>
                                                    <a class="pull-left" href="#">
                                                     <img class="img-circle" src="<%=cp%>/uploads/photo/${dto.imageFilename}" style="width:60px;height:59px;" alt="avatar">
                        							</a>
                                                </li>
                                                </c:forEach>
                                                <!-- <li>
                                                    <p>Blue</p>
                                                    <a class="pull-left" href="#">
                             <img class="img-circle" src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46" alt="User Image" /> 
                        </a>
                        
                                                </li> -->

                                            </ul>
                                        </div>
                                        <br />

                                        <div class="">
                                            <h2>Size <small>Please select one</small></h2>
                                            <ul class="list-inline prod_size">
                                                <li>
                                                    <button type="button" class="btn btn-default btn-xs">Small</button>
                                                </li>
                                                <li>
                                                    <button type="button" class="btn btn-default btn-xs">Medium</button>
                                                </li>
                                                <li>
                                                    <button type="button" class="btn btn-default btn-xs">Large</button>
                                                </li>
                                                <li>
                                                    <button type="button" class="btn btn-default btn-xs">Xtra-Large</button>
                                                </li>
                                            </ul>
                                        </div>
                                        <br />

                                        <div class="">
                                            <div class="product_price">
                                               <div class="">
  <h1>딜 성공시 구매가능 가격:   ₩${dealArticle.price}</h1>
  40% Success  <span class="pull-right">${dealArticle.people}명중 40명 참여</span>
  <div class="progress">
  <div class="progress-bar progress-bar-striped active" role="progressbar"
  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
    40%
  </div>
</div>
<div class="">
                                            <button type="button" class="btn btn-default btn-lg">Deal In</button>
                                            <button type="button" class="btn btn-default btn-lg">Add to Wishlist</button>
                                        </div>
  <p>
     <br>   <br>
   <div id="like1" style="font-size: 45px;"class="glyphicon glyphicon-thumbs-up pull-left"></div> <div style="font-size: 45px;" id="like1-bs3" class="pull-left"></div>
   <div id="dislike1" style="font-size: 45px;" class="glyphicon glyphicon-thumbs-down pull-left"></div> <div style="font-size: 45px;" id="dislike1-bs3" class="pull-left"></div> 
  
  
     <br>   <br>
  <span class="price-tax">즉시 구매가: ₩${dealArticle.instantPrice}</span>
    <button class="btn btn-primary" type="button">바로구매하기</button>
    <div>${dealArticle.category1}</div>
    <div>${dealArticle.category2}</div>
    <div>${dealArticle.approveCheck}</div>
    <div>${dealArticle.start_date}</div>
    <div>${dealArticle.end_date}</div>
    <div>${dealArticle.saveFilename}</div>
    <div>${dealArticle.originalFilename}</div>
    <div>${dealArticle.region1}</div>
    <div>${dealArticle.region2}</div>
    <div>${dealArticle.tag1}</div>
    <div>${dealArticle.tag2}</div>
    <div>${dealPhoto[9]}</div>
 
   <!--  <button class="btn btn-mini" type="button">취소</button> -->

</div>
                                                
                                                <br>
                                            </div>
                                        </div>

                                        

                                        <div class="product_social">
                                            <ul class="list-inline">
                                                <li><a href="#"><i class="fa fa-facebook-square"></i></a>
                                                </li>
                                                <li><a href="#"><i class="fa fa-twitter-square"></i></a>
                                                </li>
                                                <li><a href="#"><i class="fa fa-envelope-square"></i></a>
                                                </li>
                                                <li><a href="#"><i class="fa fa-rss-square"></i></a>
                                                
                                                </li>
                                                
                                            </ul>
                                        </div>

                                    </div>
                                    
                                     <!--graph  -->
		<div class="col-md-7 col-sm-7 col-xs-12 pull-left">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Line graph<small>Sessions</small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content" style="display: block;">
                                    <canvas id="canvas000" height="310" width="676" style="width: 615px; height: 307px;"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- graph -->
                            
                                    
                                    <!--deal status  -->
                              <div class="x_panel" style="">
                                <div class="x_title">
                                    <h2>Grid Slider</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="x_content">
                                    <div class="row grid_slider">

                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <p>Default grid slider with min and max values</p>
                                            <input type="text" id="range" value="" name="range" />
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <p>Grid with slider labels are far away outside it's container</p>
                                            <input type="text" id="range_25" value="" name="range" />
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <p>Grid with labels inside container using force_edges attribute</p>
                                            <input type="text" id="range_27" value="" name="range" />
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <p>Create Grid with pre-defined steps</p>
                                            <input type="text" id="range_26" value="" name="range" />
                                        </div>
                                  
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <p>Grid with minimum and maximum values</p>
                                            <input type="text" class="range_min_max" value="" name="range" />
                                        </div>
                               
                                    </div>
                                </div>
                            </div>
                            
                            
                           
                                    <!--deal status  -->

                        
                                    <div class="col-md-12">

                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">설명</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">댓글</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab"  aria-expanded="false">딜러정보</a>
                                                </li>
                                            </ul>
                                            <div id="myTabContent" class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                    <p>설명</p>
                                                       <p>${dealArticle.content}</p>
                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                    <p>댓글</p>
                                                 
                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                                    <p>딜러정보</p>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
   
 
        </div>
 <script src="<%=cp%>/res/template/js/chartjs/chart.min.js"></script>

<script>

/* 
 for (var num : ${graphdto}) { // 배열의 내용을 출력할 때 향상된 for문으로 간단하게 출력
   if(num3.dealmonth==11)
	   {alert("된당 ㅛ ㅛ");}
}  */
    var january= ${graphdto1};
    var february=${graphdto2};
    var march=${graphdto3};
    var april=${graphdto4};
    var may=${graphdto5};
    var june=${graphdto6};
    var july=${graphdto7};
    var agust=${graphdto8};
    var september=${graphdto9};
    var october=${graphdto10};
    var november=${graphdto11};
    var december=${graphdto12}; 
  
    

        var lineChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(38, 185, 154, 0.21)", //rgba(220,220,220,0.2)
                    strokeColor: "rgba(38, 185, 154, 0.7)", //rgba(220,220,220,1)
                    pointColor: "rgba(38, 185, 154, 0.7)", //rgba(220,220,220,1)
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [january, february, march, april, may, june, july,agust,september,october,november,december]
            },
                {
                    label: "My Second dataset",
                    fillColor: "rgba(3, 88, 106, 0.2)", //rgba(151,187,205,0.2)
                    strokeColor: "rgba(3, 88, 106, 0.70)", //rgba(151,187,205,1)
                    pointColor: "rgba(3, 88, 106, 0.70)", //rgba(151,187,205,1)
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: [0, 0, 0, 0, 0, 0, 0]
            }
        ]

        }

        $(document).ready(function () {
            new Chart(document.getElementById("canvas000").getContext("2d")).Line(lineChartData, {
                responsive: true,
                tooltipFillColor: "rgba(51, 51, 51, 0.55)"
            });
        });

        var sharePiePolorDoughnutData = [
            {
                value: 120,
                color: "#455C73",
                highlight: "#34495E",
                label: "Dark Grey"
        },
            {
                value: 50,
                color: "#9B59B6",
                highlight: "#B370CF",
                label: "Purple Color"
        },
            {
                value: 150,
                color: "#BDC3C7",
                highlight: "#CFD4D8",
                label: "Gray Color"
        },
            {
                value: 180,
                color: "#26B99A",
                highlight: "#36CAAB",
                label: "Green Color"
        },
            {
                value: 100,
                color: "#3498DB",
                highlight: "#49A9EA",
                label: "Blue Color"
        }

    ];

        
    


     
   
        $(function () {
            $("#range_27").ionRangeSlider({
                type: "double",
                min: 1000000,
                max: 2000000,
                grid: true,
                force_edges: true
            });
            $("#range").ionRangeSlider({
                hide_min_max: true,
                keyboard: true,
                min: 0,
                max: 5000,
                from: 1000,
                to: 4000,
                type: 'double',
                step: 1,
                prefix: "$",
                grid: true
            });
            $("#range_25").ionRangeSlider({
                type: "double",
                min: 1000000,
                max: 2000000,
                grid: true
            });
            $("#range_26").ionRangeSlider({
                type: "double",
                min: 0,
                max: 10000,
                step: 500,
                grid: true,
                grid_snap: true
            });
  
            $(".range_min_max").ionRangeSlider({
                type: "double",
                min: 0,
                max: 100,
                from: 30,
                to: 70,
                max_interval: 50
            });

        });
   </script>
    <!-- /ion_range -->
 <!-- <script>
    $(document).ready(function() {              
        $('div.glyphicon-thumbs-up, div.glyphicon-thumbs-down').click(function(){    
            var $this = $(this),
            c = $this.data('count');    
            if (!c) c = 0;
            c++;
            $this.data('count',c);
            $('#'+this.id+'-bs3').html(c);
        });      
        $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
            event.preventDefault();
            $(this).ekkoLightbox();
        });                                        
    }); 

    $(document).ready(function() {
        $('[id^=detail-]').hide();
        $('.toggle').click(function() {
            $input = $( this );
            $target = $('#'+$input.attr('data-toggle'));
            $target.slideToggle();
        });
    });
    
    </script> -->


