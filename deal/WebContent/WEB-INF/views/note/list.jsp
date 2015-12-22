<!-- deal 원본 -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 
  					 <div class="right_col" role="main">
   							<div class="clearfix"></div>
   
                                      <!--
Bootstrap Line Tabs by @keenthemes
A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
Licensed under MIT
-->


  <!--받은 쪽지 확인창-->
 
            <div class="modal fade" id="ModalArticle"  role="dialog" aria-labelledby="receiveLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="panel panel-primary">
                     <div class="panel-heading">
                        <h4 class="panel-title" id="receiveLabel"><span class="glyphicon glyphicon-info-sign"></span> 쪽지확인창</h4>
                    </div>
                    <div class="modal-body" style="padding: 5px;">
                          <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="col-lg-5 col-md-5 col-sm-5" style="padding-bottom: 10px; margin-top: 10px">
                            	 <div> 보낸사람 </div> 
                                </div> 
                            
                                <div class="col-lg-5 col-md-5 col-sm-5" style="padding-bottom: 10px;">
                            	 <div style="margin-right: 10px;" class="form-control" id="idWrite2">  </div> 
                                </div>
                                	</div>
                                 <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="col-lg-4 col-md-4 col-sm-4" style="padding-bottom: 10px; margin-top: 10px">
                            	 <div> 받은날짜 </div> 
                                </div> 
                            
                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                            	 <div style="margin-right: 10px;" class="form-control" id="dateWrite">  </div> 
                                </div>
                                	</div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div style="resize:vertical; height: 200px" class="form-control" id="letterContent2"></div>
                                </div>
                            </div>
                        </div>  
                        <div class="panel-footer" style="margin-bottom:-14px;">
                            <input class="btn btn-success" value="답장" onclick="renoteForm(resendUserId);"/>
                            <button style="float: right;" type="button" class="btn btn-default btn-close" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
       
            <!--  받은 쪽지 확인 종료 -->








<div class="container">
    <div class="row">
		<div class="col-md-12">
			<h3>쪽지</h3>
				
			<div class="tabbable-panel">
				<div class="tabbable-line">
					<ul class="nav nav-tabs ">
						<li class="active">
							<a href="#tab_default_1" data-toggle="tab">
							받은 쪽지함 </a>
						</li>
						<li>
							<a href="#tab_default_2" data-toggle="tab">
							보낸 쪽지함 </a>
						</li>
					</ul>	
					
					<div class="tab-content">
						<div class="tab-pane active" id="tab_default_1"> <!-- 받은쪽지함 -->
						<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <!-- 검색바 설정(아이디로 검색, 되면 날짜가지) -->
                            
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                                </div>
                            </div>
                            <!-- 검색종료 -->
                            
                            <!-- 받은쪽지함  시작 첫번째 탭-->
							 <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                                <th style="text-align: center;">
                                                    <input type="checkbox" id="check-all" class="flat" >
                                                </th>
                                                <th class="column-title"  style="text-align: center;">보낸 사람</th>
                                                <th class="column-title"  style="text-align: center;">내 용</th>
                                                <th class="column-title"  style="text-align: center;">날짜</th>
                               			  		<th class="column-title"  style="text-align: center;">수신확인</th>
                               			  </tr>
                            			</thead>

                            <tbody>
                         <c:forEach var="dto" items="${list1}">
	                                 <tr style="text-align: center;">
	                                    <td class="a-center ">
	                                       
	                                    </td>
	                                    <td class=" ">
	                                    	<ul style="padding:0">
	                                    	<li class="dropdown">
									          <a href="#" class="dropdown-toggle" data-toggle="dropdown" >${dto.sendUserId}</a>
									          <ul class="dropdown-menu">
									            <li><a href="#"><span class="glyphicon glyphicon-plus"></span> 팔로우</a></li>
									            <li class="divider"></li>
									            <li ><a onclick="noteForm('${dto.sendUserId}');"><span  class="glyphicon glyphicon-envelope"></span> 쪽지보내기</a></li>
									            <li class="divider"></li>
									            <li><a href="#"><span class="glyphicon glyphicon-minus-sign"></span> 차단하기</a></li>
									             <li class="divider"></li>
									             <li><a href="#"><span class="glyphicon glyphicon-exclamation-sign"></span> 신고하기</a></li>
									            
									          </ul>
									        </li></ul></td>
	                                    <td class="even pointer"><a onclick="readForm('${dto.sendUserId}','${dto.sendDay}' ,'${dto.num}','${dto.content}')">${dto.content}</a>
	                                    
	                                    </td>
	                                    <td class=" ">${dto.sendDay}</td>
	                                    <c:if test="${dto.identifyDay==null}">
	                                    <td>읽지 않음</td>
	                                	</c:if>
	                                	 <c:if test="${dto.identifyDay!=null}">
	                                    <td>${dto.identifyDay}</td>
	                                	</c:if>
	                                  </tr>
                                  
                                  </c:forEach>
                             </tbody>
                          </table>
                          <!-- 받은쪽지함 종료 -->
                          <!--  나중에 페이징처리 -->
                       <div class="container" >
						<ul class="pagination">
						              <li class="disabled"><a href="#">≪</a></li>
						              <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
						              <li><a href="#">2</a></li>
						              <li><a href="#">3</a></li>
						              <li><a href="#">4</a></li>
						              <li><a href="#">5</a></li>
						              <li><a href="#">≫</a></li>
						            </ul>
						</div>
						
						<!-- 보낸쪽지함 시작 -->
                        </div>
						<div class="tab-pane" id="tab_default_2"> 
						<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                                </div>
                            </div>
							  <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                                <th style="text-align: center;">
                                                    <input type="checkbox" id="check-all" class="flat" >
                                                </th>
                                                <th class="column-title"  style="text-align: center;">받는 사람</th>
                                                <th class="column-title"  style="text-align: center;">내 용</th>
                                                <th class="column-title"  style="text-align: center;">날짜</th>
                                                <th class="column-title"  style="text-align: center;">수신확인(날짜)</th>
                                                
                               			  </tr>
                            			</thead>



                            <tbody>
                          
                          
                           <c:forEach var="dto" items="${list2}">
                                <tr style="text-align: center;">
                                    <td class="a-center "></td>
                                    <td class=" ">
                                    	<ul style="padding:0">
                                    	<li class="dropdown">
								          <a href="#" class="dropdown-toggle" data-toggle="dropdown">${dto.receiveUserId}</a>
								          <ul class="dropdown-menu">
								            <li><a href="#"><span class="glyphicon glyphicon-plus"></span> 팔로우</a></li>
								            <li class="divider"></li>
								            <li ><a onclick="noteForm('${dto.receiveUserId}');"><span  class="glyphicon glyphicon-envelope"></span> 쪽지보내기</a></li>
								            <li class="divider"></li>
								            <li><a href="#"><span class="glyphicon glyphicon-minus-sign"></span> 차단하기</a></li>
								             <li class="divider"></li>
								             <li><a href="#"><span class="glyphicon glyphicon-exclamation-sign"></span> 신고하기</a></li>
								            
								          </ul>
								        </li></ul></td>
                                    <td  class="even pointer"  data-toggle="modal" data-target="#myModal" >${dto.content}</td>
                                    <td class=" ">${dto.sendDay}</td>
                                  	<c:if test="${dto.identifyDay==null}">
                                    	<td>읽지 않음</td>
                                	</c:if>
                                	 <c:if test="${dto.identifyDay!=null}">
                                    	<td>${dto.identifyDay}</td>
                                	</c:if>
                                    
                                 </tr>
                                  </c:forEach>
                                 
                             </tbody>
                          </table>
                          <!-- 보낸 쪽지함 종료 -->
                           	<ul class="pagination">
						              <li class="disabled"><a href="#">≪</a></li>
						              <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
						              <li><a href="#">2</a></li>
						              <li><a href="#">3</a></li>
						              <li><a href="#">4</a></li>
						              <li><a href="#">5</a></li>
						              <li><a href="#">≫</a></li>
						            </ul>
                        </div>
					</div>
				</div>
			</div>
		</div>
	  </div>
   </div>
</div>                  
      
    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
        </ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>

   
<style type="text/css">
   	/***
Bootstrap Line Tabs by @keenthemes
A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
Licensed under MIT
***/

/* Tabs panel */
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

/* Below tabs mode */

.tabbable-line.tabs-below > .nav-tabs > li {
  border-top: 4px solid transparent;
}
.tabbable-line.tabs-below > .nav-tabs > li > a {
  margin-top: 0;
}
.tabbable-line.tabs-below > .nav-tabs > li:hover {
  border-bottom: 0;
  border-top: 4px solid #fbcdcf;
}
.tabbable-line.tabs-below > .nav-tabs > li.active {
  margin-bottom: -2px;
  border-bottom: 0;
  border-top: 4px solid #f3565d;
}
.tabbable-line.tabs-below > .tab-content {
  margin-top: -10px;
  border-top: 0;
  border-bottom: 1px solid #eee;
  padding-bottom: 15px;
}
.dropdown-menu:after{
	left:6%;
	right:90%;
}
ul{
	 list-style:none;
}

.dropdown-menu{
	min-width:100px;
    float: center;
    margin-left: 90px;
}

.pagination{
	padding-left:33%;
}
.pagination>li>a, .pagination>li>span {
	 border-radius: 50% !important;
	 margin: 0 5px;
	 background: white;
	 color:black;
	 border-color:#e51b13;
}
.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover {
	 background: #e51b13;
	 color:white;
}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover{
	background: #e51b13;
	 color:white;
	 z-index:2;
	 cursor: default;
	 border-color:#e51b13;
	 
}
   </style>
   
