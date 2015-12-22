<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function deleteFriend(num) {
	if(!confirm("팔로우를 취소하시겠습니까? ")){
		location.href="<%=cp%>/friend/list.do";
		return false;
	}
	
	   var params="num="+num;
	    $.ajax({
	        type: "POST",
	        url: "<%=cp%>/friend/deleteFriend.do",
	        data: params,
	        success: function(data){
	        	var s=$.trim(data);
				if(s=="loginFail") {
					location.href="<%=cp%>/member/login";
					return false;	
				}
	        	
	        },
	        error: function(e){
	            alert(e.responseText);
	        }
	    });
}
function insertFriend(friendUserId) {
		if(!confirm("팔로우 하시겠습니까? ")){
			location.href="<%=cp%>/friend/list.do";
			return false;
		}
		

	    var params="friendUserId="+friendUserId;
	    
	    $.ajax({
	        type: "POST",
	        url: "<%=cp%>/friend/followFriend.do",
	        data: params,
	        success: function(data){
	        	var s=$.trim(data);
				if(s=="loginFail") {
					location.href="<%=cp%>/member/login.do";
					return false;	
				}
				
				location.href="<%=cp%>/friend/list.do";
	        	
	        },
	        error: function(e){
	            alert(e.responseText);
	        }
	    });
}
function myFriend()
{
 var mode="${mode}";
 if(mode=="allList") {  //내친구 리스트를 눌렀으면 
	 location.href = "<%=cp%>/friend/myFriendList.do";  
    	return false;
    } else     { //아니면 
    	location.href = "<%=cp%>/friend/list.do";
    	return false;
    } 
}

$(function() {    
    $('#input-search').on('keyup', function() {
      var rex = new RegExp($(this).val(), 'i');
        $('.searchable-container .items').hide();
        $('.searchable-container .items').filter(function() {
            return rex.test($(this).text());
        }).show();
    });
});



</script>

   							<div class="clearfix"></div>
   
                                      <!--
Bootstrap Line Tabs by @keenthemes
A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
Licensed under MIT
-->

 <div class="right_col" role="main" style="background:#2A3F54;">
                   <div class="x_title">
                                    <h2><a class="follow" href="<%=cp %>/friend/list.do"><i class="fa fa-child fa-2x"></i>팔로우</a></h2>
                                    <c:if test="${mode=='allList'}">
                                     <button style="float:right; background: #ffffff; border-width: 0px;" onclick="myFriend();"><i class="fa fa-users"></i> 내친구</button>
                                    <div class="clearfix"></div>     
                                    </c:if>
                                    <c:if test="${mode=='myFriendList'}">
                                      <button class="friendClick" style="float:right;" onclick="myFriend();"><i class="fa fa-users"></i> 내친구</button>
                                    <div class="clearfix"></div>
                                    </c:if>    
                   </div>
                   
                   <div class="x_content">
                   							<div class="col-lg-12 col-md-12 col-xs-12">
									            <input type="search" class="form-control" id="input-search" placeholder="Seach" >
									        </div>
							                  <br><br><br>
							                  
							                  <div class="searchable-container">
							                <c:if test="${mode=='allList'}">
							              		<c:forEach var="dto"  items="${allList}">
							              		
							               <div class="items col-md-6 col-sm-6 col-xs-12 animated fadeInDown"> <!-- 한줄에 몇개인지 -->
                                              <!-- c:forEach -->
                                            <div class="well profile_view"> <!-- 테두리 -->
                                                <div class="col-xs-12"> <!-- 전체 크기 -->
                                                 <c:if test="${dto.imageFilename!=null }">
                                                   <div class="col-xs-5"> <!-- 그림 -->
                                                         <a><img src="<%=cp%>/uploads/photo/${dto.imageFilename}" alt="" class="img-circle1 img-responsive"  style="padding:0px; margin: 0;"></a> <!-- 사진 -->
                                                   </div> <!-- 그림끝 -->
                                                   </c:if>
                                                      <c:if test="${dto.imageFilename==null }">
                                                   <div class="col-xs-5"> <!-- 그림 -->
                                                         <a><img src="<%=cp %>/res/images/admin.PNG" alt="" class="img-circle1 img-responsive"  style="padding:0px; margin: 0;"></a> <!-- 사진 -->
                                                   </div> <!-- 그림끝 -->
                                                   </c:if>
                                                    <div class="col-xs-4" style="vertical-align: middle;"> <!-- 이름과 팔로우수 -->
						                                      <ul style="padding:0; margin-top: 20%;">
						                                       <li class="dropdown" >
						                                      	 <a class="dropdown-toggle f-namefont " data-toggle="dropdown">${dto.userId}</a>  
						                               			   <ul class="dropdown-menu" style="margin-left: 5%;" >
								                                    <li><a data-toggle="modal" data-target="#ModalCreated"  onclick="noteForm('${dto.userId}');"><span class="glyphicon glyphicon-envelope"></span> 쪽지보내기</a></li>
								                                    <li class="divider"></li>
								                                    <li><a href="#"><span class="glyphicon glyphicon-minus-sign"></span> 차단하기</a></li>
								                                     <li class="divider"></li><!-- 
								                                            <li><a href="#"><span class="glyphicon glyphicon-exclamation-sign"></span> 신고하기</a></li> -->
								                                    </ul>
						                            	      </li></ul>
						                                	<span>팔로우 ${dto.cnt }명</span>
						                            </div>   <!-- 이름과 팔로우수 끝 -->   
						                         
                                                    	<div class="" data-toggle="buttons" style="margin-top:35px; ">
                                                    	
                                                    	<c:set var="active" value=""/>
                                                    	   <c:forEach var="mdto" items="${myFriendList }">
                                                    	   
                                                    	   <c:if test="${dto.userId==mdto.friendUserId}">
                                                    	   <c:set var="active" value="active"/>
												         <label class="btn btn-lg btn-default" onclick="deleteFriend('${dto.num}')" style="font-size: 9pt; border-color: #791212; border-width: 3px;">
												            <input  type="radio" name="options" id="option1" autocomplete="off" checked>
												            <span class="glyphicon glyphicon-ok"></span>팔로우
												        </label>
												              </c:if>
												         </c:forEach>
												   
												        <label class="btn btn-lg btn-default ${active}"  style="font-size: 9pt; " onclick="insertFriend('${dto.userId}');" >
												            <input  type="radio" name="options" id="option2" autocomplete="off"  >
												             <span class="glyphicon glyphicon-plus " ></span>팔로우
												        </label>   
														</div>
												     
												   
                                               </div> <!-- 전체크기 끝 -->
                                            </div> <!-- 테두리 끝 -->
                                       <br><br>
                                        </div> <!-- 한줄에 몇개인지 끝 -->
                                        </c:forEach>
                                        
                                            </c:if>
                                            </div>
                                            
                                             <div class="searchable-container">
									              	<c:if test="${mode=='myFriendList'}">
									               	<c:forEach var="dto"  items="${myFriendList}">  
							                   <div class="items col-md-6 col-sm-6 col-xs-12 animated fadeInDown"> <!-- 한줄에 몇개인지 -->
                                              <!-- c:forEach -->
                                            <div class="well profile_view"> <!-- 테두리 -->
                                                <div class="col-xs-12"> <!-- 전체 크기 -->
                                                   <div class="col-xs-5"> <!-- 그림 -->
                                                         <a><img src="<%=cp%>/uploads/photo/${dto.imageFilename}" alt="" class="img-circle1 img-responsive"  style="padding:0px; margin: 0;"></a> <!-- 사진 -->
                                                   </div> <!-- 그림끝 -->
                                                    <div class="col-xs-4" style="vertical-align: middle;"> <!-- 이름과 팔로우수 -->
						                                      <ul style="padding:0; margin-top: 20%;">
						                                       <li class="dropdown" >
						                                      	 <a class="dropdown-toggle f-namefont " data-toggle="dropdown">${dto.friendUserId}</a>  
						                               			   <ul class="dropdown-menu" style="margin-left: 5%;" >
								                                    <li><a data-toggle="modal" data-target="#ModalCreated"><span class="glyphicon glyphicon-envelope"></span> 쪽지보내기</a></li>
								                                    <li class="divider"></li>
								                                    <li><a href="#"><span class="glyphicon glyphicon-minus-sign"></span> 차단하기</a></li>
								                                     <li class="divider"></li>
								                                     <li><a href="#"><span class="glyphicon glyphicon-exclamation-sign"></span> 신고하기</a></li>
								                                    </ul>
						                            	      </li></ul>
						                                	<span>팔로우 ${dto.cnt }명</span>
						                            </div>   <!-- 이름과 팔로우수 끝 -->   
						                            
                                                    <div class="" data-toggle="buttons" style="margin-top:35px; ">
                                                    <c:if test="${mode=='myFriendList'}">
												         <label class="btn btn-lg btn-default" onclick="deleteFriend('${dto.num}')" style="font-size: 9pt; border-color: #791212; border-width: 3px;">
												            <input  type="radio" name="options" id="option1" autocomplete="off" checked>
												            <span class="glyphicon glyphicon-ok"></span>팔로우
												        </label>
												        </c:if>
												        
												       
												        <label class="btn btn-lg btn-default  active"  style="font-size: 9pt; " onclick="insertFriend('${dto.userId}')">
												            <input  type="radio" name="options" id="option2" autocomplete="off">
												             <span class="glyphicon glyphicon-plus "></span>팔로우
												        </label>   
														
														</div>
												   
												   
                                               </div> <!-- 전체크기 끝 -->
                                            </div> <!-- 테두리 끝 -->
                                       <br><br>
                                        </div> <!-- 한줄에 몇개인지 끝 -->
                                           </c:forEach> <!-- c:forEach 끝 -->
  										</c:if>
                                         </div>
                                </div>        
       
              
                    
                                     
</div>

<style type="text/css">

.dropdown-menu:after{
	left:6%;
	right:90%;
	margin-left: 0;
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
.img-circle1{
	width:130px;
	height:130px;
	border-radius:50%;
	margin-left: 0px;
}
.f-namefont{
	font-size: 16pt;
	font: #00001E;
	font-weight: bold;
}

.well.profile_view .divider{
	padding-top:0px;
}
.btn.active {                
	display: none;		
}
.btn span:nth-of-type(1)  {            	
	display: none;
}
.btn span:last-child  {            	
	display: block;		
}

.btn.active  span:nth-of-type(1)  {            	
	display: block;		
}
.btn.active span:last-child  {            	
	display: none;			
}
.follow.active{
	font-weight: bold;
	text-decoration: none;
}
.friendClick{
	background: #ffffff;
	border-bottom-color: #791212;
	border-top-width: 0px;
	border-left-width: 0px;
	border-right-width: 0px;
}

   </style>
   
