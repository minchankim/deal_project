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


<script src="//rawgithub.com/ashleydw/lightbox/master/dist/ekko-lightbox.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<div class="right_col" role="main">

<div class="container" >
            
    <div class="row">
        <div class="col-xs-6 col-md-3" >
            
            <div class="panel status panel-danger">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">25</h1>
                </div>
                <div class="panel-body text-center">                        
                    <strong>Late</strong>
                </div>
            </div>

        </div>          
        <div class="col-xs-6 col-md-3">
          
            <div class="panel status panel-warning">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">17</h1>
                </div>
                <div class="panel-body text-center">                        
                    <strong>Today</strong>
                </div>
            </div>

        </div>
        <div class="col-xs-6 col-md-3">
           
            <div class="panel status panel-success">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">20</h1>
                </div>
                <div class="panel-body text-center">                        
                    <strong>Member</strong>
                </div>
            </div>

         
        </div>
        <div class="col-xs-6 col-md-3">
          
            <div class="panel status panel-info">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">18</h1>
                </div>
                <div class="panel-body text-center">                        
                    <strong>Deal</strong>
                </div>
            </div>

         
        </div>
    </div>

</div>
<br><br>
<h3>카테고리 통계</h3>
	<div class="container" >
	<div style="border: 2px solid #e4e4e4; border-top-width: 4px #000000;">
		<div class="row">                   
       	 <div class="progress col-md-10" style="margin-left: 8%; margin-top: 2%;">
            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                <span class="sr-only">60% Complete</span>
            </div>
            <span class="progress-type">의류/잡화</span>
            <span class="progress-completed">60%</span>
        </div>
        <div class="progress col-md-10"  style="margin-left: 8%">
            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                <span class="sr-only">40% Complete (success)</span>
            </div>
            <span class="progress-type"> 뷰티</span>
            <span class="progress-completed">40%</span>
        </div>
        <div class="progress col-md-10" style="margin-left: 8%">
            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                <span class="sr-only">20% Complete (info)</span>
            </div>
            <span class="progress-type"> 식품</span>
            <span class="progress-completed">20%</span>
        </div>
        <div class="progress col-md-10" style="margin-left: 8%">
            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                <span class="sr-only">60% Complete (warning)</span>
            </div>
            <span class="progress-type"> 가구/생활</span>
            <span class="progress-completed">60%</span>
        </div>
        <div class="progress col-md-10" style="margin-left: 8%">
            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                <span class="sr-only">80% Complete (danger)</span>
            </div>
            <span class="progress-type"> 레저/자동차</span> 디지털/가전 도서/취미 지역
            <span class="progress-completed">80%</span>
        </div>
        <div class="progress col-md-10" style="margin-left: 8%">
            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                <span class="sr-only">80% Complete (danger)</span>
            </div>
            <span class="progress-type"> 레저/자동차</span> 
            <span class="progress-completed">80%</span>
        </div>
        <div class="progress col-md-10" style="margin-left: 8%">
            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                <span class="sr-only">80% Complete (danger)</span>
            </div>
            <span class="progress-type"> 디지털/가전</span> 
            <span class="progress-completed">80%</span>
        </div>
        <div class="progress col-md-10" style="margin-left: 8%">
            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                <span class="sr-only">80% Complete (danger)</span>
            </div>
            <span class="progress-type">  도서/취미</span>
            <span class="progress-completed">80%</span>
        </div>
         <div class="progress col-md-10" style="margin-left: 8%">
            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                <span class="sr-only">80% Complete (danger)</span>
            </div>
            <span class="progress-type">지역</span>
            <span class="progress-completed">80%</span>
        </div>
		</div>
	  </div><!-- 카테고리 div -->
	</div><!-- 카테고리 container -->
		
		
		
</div> <!-- body -->




	

 								
      
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
 <style>
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,900|Oswald);
body{
    padding: 50px 0;
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
body {
    margin: 0px 0px;
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
</style>


