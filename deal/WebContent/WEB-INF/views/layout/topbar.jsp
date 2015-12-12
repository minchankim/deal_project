
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 -->
<style>
.modal-header-success {
    color:#fff;
    padding:9px 15px;
    border-bottom:1px solid #eee;
    background-color: #5cb85c;
    -webkit-border-top-left-radius: 5px;
    -webkit-border-top-right-radius: 5px;
    -moz-border-radius-topleft: 5px;
    -moz-border-radius-topright: 5px;
     border-top-left-radius: 5px;
     border-top-right-radius: 5px;
}

.search-form .form-group {
  float: right !important;
  transition: all 0.35s, border-radius 0s;
  width: 32px;
  height: 32px;
  background-color: #fff;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
  border-radius: 25px;
  border: 1px solid #ccc;
}
.search-form .form-group input.form-control {
  padding-right: 20px;
  border: 0 none;
  background: transparent;
  box-shadow: none;
  display:block;
}
.search-form .form-group input.form-control::-webkit-input-placeholder {
  display: none;
}
.search-form .form-group input.form-control:-moz-placeholder {
  /* Firefox 18- */
  display: none;
}
.search-form .form-group input.form-control::-moz-placeholder {
  /* Firefox 19+ */
  display: none;
}
.search-form .form-group input.form-control:-ms-input-placeholder {
  display: none;
}
.search-form .form-group:hover,
.search-form .form-group.hover {
  width: 100%;
  border-radius: 4px 25px 25px 4px;
}
.search-form .form-group span.form-control-feedback {
  position: absolute;
  top: -1px;
  right: -2px;
  z-index: 2;
  display: block;
  width: 34px;
  height: 34px;
  line-height: 34px;
  text-align: center;
  color: #3596e0;
  left: initial;
  font-size: 14px;
}
body{
  /*   padding: 50px; */
}
.modal-dialog {
   /*  width: 20%;  */
}
.modal-footer {
    height: 70px;
    margin: 0;
}
.modal-footer .btn {
    font-weight: bold;
}
.modal-footer .progress {
    display: none;
    height: 32px;
    margin: 0;
}
.input-group-addon {
    color: #fff;
    background: #3276B1;
}

</style>
<script>
$(document).ready(function(){
    $('.modal-footer button').click(function(){
		var button = $(this);

		if ( button.attr("data-dismiss") != "modal" ){
			var inputs = $('form input');
			var title = $('.modal-title');
			var progress = $('.progress');
			var progressBar = $('.progress-bar');

		/* 	inputs.attr("disabled", "disabled"); */

			button.hide();

			progress.show();

			progressBar.animate({width : "100%"}, 100);

			progress.delay(1000)
					.fadeOut(600);

			button.text("Close")
					.removeClass("btn-primary")
					.addClass("btn-success")
    				.blur()
					.delay(1600)
					.fadeIn(function(){
						title.text("Log in is successful");
						button.attr("data-dismiss", "modal");
					});
		}
	});

	$('#myModal1').on('hidden.bs.modal', function (e) {
		var inputs = $('form input');
		var title = $('.modal-title');
		var progressBar = $('.progress-bar');
		var button = $('.modal-footer button');

		inputs.removeAttr("disabled");

		title.text("Log in");

		progressBar.css({ "width" : "0%" });

		button.removeClass("btn-success")
				.addClass("btn-primary")
				.text("Ok")
				.removeAttr("data-dismiss");
                
	});
});
    
function sendLogin() {
    var f = document.loginForm;

	var str = f.userId.value;

	
	
	str = f.userPwd.value;
    if(!str) {
        alert("\n패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }
	
	if(!str) {
        alert("\n아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }

    

    f.action = "<%=cp%>/member/login.do";
    f.submit();
}
    

    

</script>

<script src="//rawgithub.com/ashleydw/lightbox/master/dist/ekko-lightbox.js"></script>

<!-- top navigation -->
            <div class="top_nav">

                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle" style="margin-bottom: 0px;">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>

	<!-- 검색바 -->
<!--         <div class="col-md-4 col-sm-4 col-xs-10">
            <form action="" style="padding-top:13px;" class="search-form">
                <div class="form-group has-feedback">
            		<label for="search" class="sr-only">Search</label>
            		<input type="text" class="form-control" name="search" id="search" placeholder="검색">
              		<span style="margin-top: 0px" class="glyphicon glyphicon-search form-control-feedback"></span>
              		
            	</div>
            </form>
        </div>
         -->
        <!--login modal  -->


<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" >
		<div class="modal-content col-md-8" style="margin-left: 5%; margin-right: 5%;">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Log in</h4>
			</div> <!-- /.modal-header -->

			<div class="modal-body">
				<form name="loginForm" method="post" action="" role="form">
					<div class="form-group">
						<div class="input-group">
							<input name="userId" type="text" class="form-control" id="uLogin" placeholder="Login">
							<label for="uLogin" class="input-group-addon glyphicon glyphicon-user"></label>
						</div>
					</div> <!-- /.form-group -->

					<div class="form-group">
						<div class="input-group">
							<input name="userPwd" type="password" class="form-control" id="uPassword" placeholder="Password">
							<label for="uPassword" class="input-group-addon glyphicon glyphicon-lock"></label>
						</div> <!-- /.input-group -->
					</div> <!-- /.form-group -->

					<div class="checkbox pull-left">
						<label>
							<input type="checkbox"> Remember me
						</label>
					</div> <!-- /.checkbox -->
					<label style="padding-top:5px;" class="pull-right">
							 <a  href="<%=cp%>/member/member.do">회원가입</a>
						</label>
				</form>
				
				

			</div> <!-- /.modal-body -->

			<div class="modal-footer">
				<button class="form-control btn btn-primary" onclick="sendLogin();">Login</button>

				<div class="progress">
					<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="100" style="width: 0%;">
						<span class="sr-only">progress</span>
					</div>
				</div>
			</div> <!-- /.modal-footer -->

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--login modal end  -->

                        <ul class="nav navbar-nav navbar-right col-md-4 col-sm-4 col-xs-2" style="width:initial;padding-right:0px;padding-top: 0px;">
                             <li style="padding-top: 14px;padding-right: 10px;padding-left: 10px;">
                             <c:if test="${sessionScope.member.userId==null&&mode==null}">
                             <button style="margin:0px;" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal1">
 						   Log in
							</button>
							</c:if>
                             </li>
                           
                            <li style="padding-top: 0px; padding-right: 5px;padding-left:5px;" class="">
                             <c:if test="${sessionScope.member.userId!=null}">
                                <a href="javascript:;" style="padding:0px;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <img style="width:55px;height:55px;" src="<%=cp%>/uploads/photo/${pdto.imageFilename}" alt="">${sessionScope.member.userId}
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                </c:if>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                    <li><a href="<%=cp%>/member/mypage.do">정보수정</a>
                                    </li>
                               
                                    <li>
                                        <a href="<%=cp%>/friend/list.do">
                                            <span>팔로우</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Help</a>
                                    </li>
                                   
                                    <li><a href="<%=cp%>/member/logout.do"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                    </li>
                                </ul>
                            </li><!-- end 내정보 -->
                             <c:if test="${sessionScope.member.userId!=null}">
							<li style="padding-top:7px;padding-right: 5px; padding-left: 5px;">
                                <a style="padding: 0px;margin-top:4px;" href="<%=cp%>/cash/myCash.do;"><span id="myscash">${cdto}</span></a>
                                
                             </li><!-- end 캐쉬 -->
                           </c:if>
                          <!-- 쪽지 -->
                            <li style="padding:7px;" role="presentation" class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-envelope fa-5x"></i>
                                    <span class="badge bg-green">2</span>
                                </a>
                                
                                <ul id="menu1" class="dropdown-menu list-unstyled msg_list animated fadeInDown" role="menu">
                             
                                	<!-- 첫번째 쪽지 -->
                                     <li data-toggle="modal" data-target="#myModal">
                                        <a>
                                            <span class="image">
                                       <img class="media-object img-circle" src="<%=cp %>/res/images/park.jpg" alt="profile">
                                    		</span>
                                            <span>
                                        <span>박서준</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                       			안녕
                                    </span>
                                        </a>
                                    </li>
                                    
                                    <!-- 두번째 쪽지 -->
                                     <li data-toggle="modal" data-target="#myModal">
                                        <a>
                                            <span class="image">
                                          <img class="media-object img-circle" src="<%=cp%>/res/images/ch.jpg" alt="profile">
                                    </span>
                                            <span>
                                        <span>최시원</span>
                                            <span class="time">6 mins ago</span>
                                            </span>
                                            <span class="message">
                                       			나야
                                    </span>
                                        </a>
                                    </li>
                                    
                                   <!-- 세번째 쪽지 -->
                                     <li data-toggle="modal" data-target="#myModal">
                                        <a>
                                            <span class="image">
                                          <img class="media-object img-circle" src="<%=cp %>/res/images/she.jpg" alt="profile">
                                    </span>
                                            <span>
                                        <span>황정음</span>
                                            <span class="time">15 mins ago</span>
                                            </span>
                                            <span class="message">
                                       			신촌역
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="text-center">
                                            <a>
                                                <strong><a href="<%=cp%>/letter/list.do">모든 리스트보기 </a></strong>
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
							<!-- 대화 -->
							<li style="padding:7px;" role="presentation" class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-comments fa-5x"></i>
                                    <span class="badge bg-green">2</span>
                                </a>
                                
                                <ul id="menu1" class="dropdown-menu list-unstyled msg_list animated fadeInDown" role="menu">
                                    <li>
                                        <a>
                                            <span class="image">
                                        <img src="<%=cp%>/res/images/img.jpg" alt="Profile Image" />
                                    </span>
                                            <span>
                                        <span>John Smith</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                      	 		1
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <span class="image">
                                        <img src="<%=cp%>/res/images/img.jpg" alt="Profile Image" />
                                    </span>
                                            <span>
                                        <span>John Smith</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                       			2
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <span class="image">
                                        <img src="<%=cp%>/res/images/img.jpg" alt="Profile Image" />
                                    </span>
                                            <span>
                                        <span>John Smith</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                       			3
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <span class="image">
                                        <img src="<%=cp%>/res/images/img.jpg" alt="Profile Image" />
                                    </span>
                                            <span>
                                        <span>John Smith</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                               4
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="text-center">
                                            <a>
                                                <strong><a href="inbox.html">See All Alerts</strong>
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
							
							<!-- 알림 -->
                            <li style="padding:7px;"role="presentation" class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-paper-plane fa-5x"></i>
                                    <span class="badge bg-green">2</span>
                                </a>
                                
                                <ul id="menu1" class="dropdown-menu list-unstyled msg_list animated fadeInDown" role="menu">
                                   <li data-toggle="modal">
                                        <a href="#success" data-toggle="modal">
                                            <span class="image">
                                       <img class="media-object img-circle" src="<%=cp%>/res/images/mac1.jpg">
                                    		</span>
                                            <span>
                                        <span>딜에 성공하셨습니다!</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                       			확인하기
                                    </span>
                                        </a>
                                    </li>
                                    <li data-toggle="modal" >
                                        <a href="#success" data-toggle="modal">
                                            <span class="image">
                                       <img class="media-object img-circle" src="<%=cp%>/res/images/prod1.jpg">
                                    		</span>
                                            <span>
                                        <span>딜에 성공하셨습니다.</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                       			확인하기
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="text-center">
                                            <a>
                                                <strong><a href="inbox.html">ALL</strong>
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </li><!-- end 알림 -->
                      
                           
                            
                            
                             <li style="padding-top: 10px;" class="">
                                <a href="javascript:;" style="padding:0px;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									마이딜<span class="badge bg-red">6</span>
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                    <li><a href="<%=cp%>/myDeal/myDeal.do">
                                    <span class="badge bg-red pull-right">2</span>
                                            <span>참여 딜 목록</span>
                                    </a>
                                    </li>
                                    <li>
                                        <a href="<%=cp%>/myDeal/myDeal.do">
                                            <span class="badge bg-red pull-right">2</span>
                                            <span>찜한 딜 목록</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<%=cp%>/myDeal/myDeal.do">
                                         <span class="badge bg-red pull-right">2</span>
                                            <span>올린 딜 목록</span>
                                        </a>
                                    </li>
                                   
                                </ul>
                            </li><!-- end 마이딜 -->

                        </ul>
                    </nav>
                </div>
	
            </div>
            <!-- /top navigation -->
            
   <!-- 알림 modal -->         
      <div class="modal fade" id="success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-header-success">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h1><i class="glyphicon glyphicon-thumbs-up"></i> 축하합니다!</h1>
                </div>
                <div class="modal-body">
             
    <img src="<%=cp %>/res/images/mac1.jpg" class="img-responsive">
    <div style="height: 30px"></div>
    
    <p><a title="Facebook" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-facebook fa-stack-1x"></i></span></a> <a title="Twitter" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-twitter fa-stack-1x"></i></span></a> <a title="Google+" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-google-plus fa-stack-1x"></i></span></a> <a title="Linkedin" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-linkedin fa-stack-1x"></i></span></a> <a title="Reddit" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-reddit fa-stack-1x"></i></span></a> <a title="WordPress" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-wordpress fa-stack-1x"></i></span></a> <a title="Digg" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-digg fa-stack-1x"></i></span></a>  <a title="Stumbleupon" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-stumbleupon fa-stack-1x"></i></span></a><a title="E-mail" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-envelope fa-stack-1x"></i></span></a>  <a title="Print" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-print fa-stack-1x"></i></span></a></p>
     <img align="center" src="<%=cp %>/res/images/bar.jpg" class="img-responsive" style="width: 180px" height="50px">
    <div class="producttitle">참여하신 딜이 성공적으로 마무리 되었습니다.</div>
    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>