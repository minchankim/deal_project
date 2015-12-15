<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("UTF-8");
%>
<style>
.img-circle1{
	border-radius:50%;
	margin-left:40%;
}
.well.profile_view .bottom{
	margin-top: 0px;
	background: #F2F5F7;
	padding: 9px 0;
	border-top: 1px solid #E6E9ED;
}
.btn-success:hover, .btn-success:focus, .btn-success.focus, .btn-success:active, .btn-success.active, .open>.dropdown-toggle.btn-success{
	background: #980000;
	color:#ffffff;
	border-width: 1px;
	border-color: #980000;
	font-weight: bold;
}
.btn-success{
	background: #ffffff;
	color:#000000;
	border-color: #C90000;
	font-weight: bold;
}
.btn-primary:hover, .btn-primary:focus,.btn-primary.focus, .btn-primary:active, .btn-primary.active, .open> .dropdown-toggle.btn-primary{
	background: #980000;
	color:#ffffff;
	border-width: 1px;
	border-color: #980000;
	font-weight: bold;
}
.btn-primary{
	background: #ffffff;
	color:#000000;
	border-color: #C90000;
	font-weight: bold;
}

</style>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
var userName;
var businessNum;
var tel;
var email;
var addr;

function readProfile(userName ,businessNum, tel, email, addr, src){

    this.userName=userName;
    this.businessNum=businessNum;
    this.tel=tel;
    this.email=email;
    this.addr=addr;
    
    $("#mprofileImg").attr("src", src);
    
  	$("#myModal2").modal('show');
  	
    $("#myModalName").text(userName);
    
    $("#myModalBnum").text(businessNum);
    
    $("#myModalTel").text(tel);
    
    $("#myModalEmail").text(email);

    $("#myModalAddr").text(addr);

  
}

</script>  


 
<div class="right_col" role="main">
   
  <div class="col-md-12 col-sm-12 col-xs-12">
  	<div class="x_panel">
    	<div class="x_title">
        	<h2><i class="fa fa-child fa-2x"></i>가격 흥정<small>원하는 회사를 찾아보세요.</small></h2>
	        <div class="clearfix"></div>
        </div>
		<div class="x_content">
			<div class="row">
				<div class="clearfix"></div>
                	<c:forEach var="dto" items="${list}">
				<div class="col-md-6 col-sm-6 col-xs-12 animated fadeInDown">
                	<div class="well profile_view">
                	
                    	<div class="col-md-12 col-sm-12 col-xs-12">
                        	<h4 class="brief"><i>${dto.userName}</i></h4>
	                    	<div class="col-md-7 col-sm-7 col-xs-7"><br>
	                        	<h2>${dto.userName}</h2>
	                        	<p><strong>사업자 번호: </strong>${dto.businessNum}</p>
	                        	<ul class="list-unstyled">
	                            	<li><i class="fa fa-phone"></i> Tel: ${dto.tel}</li>
	                           		<li><i class="fa fa-phone"></i> E-mail: ${dto.email}</li>
	                           		<li><i class="fa fa-phone"></i> Address: ${dto.addr}</li>
	                           	</ul>
	                       </div>
	                       <div class="col-md-5 col-sm-5 col-xs-5">
	                            <a href="#aboutModal" data-toggle="modal" data-target="#myModal"><img src="<%=cp%>/uploads/photo/${dto.imageFilename}" alt="" class="img-circle img-responsive" id="profileImg${dto.businessNum}"></a>
	                       </div>
                     	</div>
                        <div class="col-xs-12 bottom text-center">
                        	<div class="col-xs-12 col-sm-6 emphasis">
                            	<p class="ratings">
                                	<a>4.0</a>
                                	<a href="#"><span class="fa fa-star"></span></a>
                                	<a href="#"><span class="fa fa-star"></span></a>
                                	<a href="#"><span class="fa fa-star"></span></a>
                                	<a href="#"><span class="fa fa-star"></span></a>
                                	<a href="#"><span class="fa fa-star-o"></span></a>
                                </p>
                            </div>
                                                            
	                        <div class="col-xs-12 col-sm-6 emphasis">
	                        	<button type="button" class="btn btn-success btn-xs" data-original-title> 
	                        	<i class="fa fa-envelope-o"></i> 쪽지 보내기 </button>
	                        	<button type="button" class="btn btn-primary btn-xs" data-whatever="<%=cp%>/uploads/photo/${dto.imageFilename}" onclick="readProfile('${dto.userName}' ,'${dto.businessNum}', '${dto.tel}', '${dto.email}', '${dto.addr}', '<%=cp%>/uploads/photo/${dto.imageFilename}')">
	                        	<i class="fa fa-user" ></i>프로필 보기</button> 
	                        </div>
                     	</div>
                     	</div>
                    </div>
                    </c:forEach>
                 </div>
               
              
            </div>
   
   
   
   <div class="col-md-12 col-sm-12 col-xs-12" style="text-align:center;">
                                            <ul class="pagination pagination-split">
                                                <li><a href="#">A</a>
                                                </li>
                                                <li><a href="#">B</a>
                                                </li>
                                                <li><a href="#">C</a>
                                                </li>
                                                <li><a href="#">D</a>
                                                </li>
                                                <li><a href="#">E</a>
                                                </li>
                                                <li>...</li>
                                                <li><a href="#">W</a>
                                                </li>
                                                <li><a href="#">X</a>
                                                </li>
                                                <li><a href="#">Y</a>
                                                </li>
                                                <li><a href="#">Z</a>
                                                </li>
                                            </ul>
                                        </div>
                               
                               
                               
                                </div>
       </div>

</div>



<!-- Modal -->

    <div class="modal fade" id="myModal2" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h3 class="modal-title" id="myModalLabel">More about Company</h3>
                    </div>
                <div class="modal-body">
                    
                    <img src="<%=cp%>/uploads/photo/" name="aboutme" width="140" height="140" border="0" class="img-circle1" id="mprofileImg"><br><br>
                    <h4 class="media-heading" style="text-align: center" id="myModalName"></h4>
                    <div style="text-align: center"><span>사업자 번호:</span><span class="media-heading center" style="text-align: center" id="myModalBnum"></span></div>
                    <span><strong># 태그: </strong></span>
                        <span class="label label-warning">태그이름</span>
                        <span class="label label-info">식품/음식</span>
                        <span class="label label-success">딜러와 협상</span>
                        <span class="label label-info">가격흥정</span>
                    <hr>
                    
                    <p class="text-left"><strong>Tel: </strong><br>
                        <div id="myModalTel"></div>
                    <br>
                    <p class="text-left"><strong>Email: </strong>
                        <div id="myModalEmail"></div>
                    <br>
                    <p class="text-left"><strong>Addr: </strong>
                        <div id="myModalAddr"></div>
                    <br>
                    
                </div>
                
                
                <div class="modal-footer">
                   
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                    
                </div>
            </div>
        </div>
    </div>
    