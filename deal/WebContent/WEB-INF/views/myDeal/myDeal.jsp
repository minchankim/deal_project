<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 
<style>
img{
width:200px;
height:200px;
float:left;
}
</style>

  					 <div class="right_col" role="main">
   							<div class="clearfix"></div>
   
                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">참여 딜 목록</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">찜한 딜 목록</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">올린 딜 목록</a>
                                                </li>
                                            </ul>
                                            <div id="myTabContent" class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                    <!-- start 참여 딜 -->
                                                     <table class="data table table-striped no-margin">
                                                        <thead>
                                                            <tr>
                                                                 <th>
                                                    				참여 일자
                                              					 </th>
                                                                <th>참여 상품 정보</th>
                                                                <th>총 결제 금액</th>
                                                                <th class="hidden-phone">상태</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                           <c:forEach  var="dto" items="${dealInList}">
                                                            <tr valign="middle">
                                                                <td class="a-center " ><br>
                                                 				  2015-11-12<br>
                                                 				  (2015111201)<br>
                                                 				  <a href="#" class="btn btn-primary btn-xs">&nbsp; 딜 상세보기&nbsp; </a><br>
                                                                	 <a href="#" class="btn btn-default btn-xs">&nbsp;&nbsp;영수증발급&nbsp;&nbsp;</a>
                                              				  </td>
                                                                <td>
                                                              	
                                                           			 <div class="message_wrapper">
                                                           			  ${dto.image1}
                                                               		 <h4  class="heading">${dto.subject}</h4>
                                                               		 
                                                                	<div class="cam col-sm-12 col-md-12 col-xs-12" >참여 기간 : 2015. 11. 03 ~ 2015. 11.30</div>
                                                                
                                                            </div></td>
                                                                <td><br><br><b>15,000원</b></td>
                                                                <td class="hidden-phone"><br><br>
                                                                	딜 성공<br>
                                                                	 <a href="#" class="btn btn-danger btn-xs">딜 조회</a>
                                                                </td>
                                                            </tr>
                                                            </c:forEach>
                                                            
                                                            
                                                            
                                                        </tbody>
                                                    </table>
                                                    <!-- end 참여 딜 -->

                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                                                    <!-- start 찜한 딜 -->
                                                    <table class="data table table-striped no-margin">
                                                        <thead>
                                                            <tr>
                                                                 <th>
                                                    				<input type="checkbox" class="tableflat">
                                              					 </th>
                                                                <th>상품 정보</th>
                                                                <th>남은 시간</th>
                                                                <th class="hidden-phone">참여</th>
                                                                <th>인원수</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="a-center ">
                                                 				   <input type="checkbox" class="tableflat">
                                              				  </td>
                                                                <td>
                                                              	  <img src="<%=cp%>/res/images/food1.jpg" class="mydealavatar2" alt="Avatar">
                                                           			 <div class="message_wrapper">
                                                               		 <h4 class="heading">VIPS 피자 베이컨포테이토,마르게리타 4개×2세트</h4>
                                                                	<b>15,000원</b><br><span class="zzim"> 무료배송 </span>
                                                                
                                                            </div></td>
                                                                <td><br>D-18<br>2015. 11. 30</td>
                                                                <td class="hidden-phone"><br><br>
                                                                	<a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Join </a>
                                                                	 <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                                                </td>
                                                                
                                                          		<td class="project_progress"><br><br>
                                                    				<div class="progress progress_sm">
                                                      				  <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                                                  					  </div>
                                                  					  <small>57% Complete</small>
                                                				</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <!-- end 찜한 딜-->

                                                </div>
                                                <!-- start 올린 딜 -->
                                                <div role="tabpanel" style="margin-left:10px;" class="tab-pane fade col-md-12 col-sm-12 col-xs-12 " id="tab_content3" aria-labelledby="profile-tab">                                
                                                 <c:forEach  var="dto" items="${dealUploadList}">
                                                  <table  style="margin:15px;" class="col-md-3 col-sm-12 col-xs-12">
                                                  	<tr >
                                                  		<td colspan="3">
                                                  			${dto.image1}
                                                  	</tr>
                                                  	<tr>
                                                  		<td  colspan="2">
                                                  			<a class="uptitle">${dto.subject}</a> 
                                                  		</td>
                                                  		<td align="right" width="60px">
                                                  			<br><br>
                                                  			<b class="zzim" style="margin-right:10px;">무료배송</b>
                                                  		</td>
                                                  	</tr>
                                                  	<tr>
                                                  		<td colspan="2" width="100px">
                                                  			<b class="dealchicga">딜러시크가</b>	<b >15,000원</b>	
                                                  		</td>
                                                  		<td align="right" width="150px" style="padding-right:10px;"><font color="#DB0000">200</font>명 참여</td>
                                                  	</tr>
                                                  	<tr>
                                                  		<td colspan="3" bgcolor="#D5D5D5" height="1px"></td>
                                                  	</tr>
                                                  	
                                                  </table>
                                                  </c:forEach>
                                                </div>
                   
                                                
                                                
                                                
                                                <!-- end 올린 딜 -->
                                            </div>
                                        </div>
                                    </div>
                           
      
    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
        </ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>


    <!-- /datepicker -->
   
   
