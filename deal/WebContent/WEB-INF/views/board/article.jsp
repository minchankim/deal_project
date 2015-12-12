<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>

	<script type="text/javascript">
	<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
	function deleteBoard(num) {
		var url="<%=cp%>/board/delete.do?num="+num+"&pageNum=${pageNum}";
		if(confirm("게시물을 삭제 하시겠습니까 ?"))
			location.href=url;
	}
	</c:if>
	//--------------
	
	$(function(){
		listPage(1);
	});
	function listPage(page){
		var url="<%=cp%>/board/listReply.do";
		var num="${dto.num}";
		$.post(url,{num:num, pageNo:page},function(data){
			$("#listReply").html(data);
			});
	}
	function sendReply(){
		var num="${dto.num}";
		var content=$.trim($("#content").val());
		if(! content){
			alert("내용을 입력하세용!");
			$("#content").focus();
			return false;
		}
		
		var params="num="+num;
		params+="&content="+content;
		params+="&answer=0";
		
		$.ajax({
			type:"POST"
			,url:"<%=cp%>/board/insertReply.do"
			,data:params
			,dataType:"json"
			,success:function(data){
				$("#content").val("");
				var state=data.state;
				if(state=="loginFail"){
					location.href="<%=cp%>/member/login.do";
					return false;
				}
				
				listPage(1);
				
			}
			,error:function(e){
				alert(e.responseText);
			}
		});
		
	}
	
	function deleteReply(replyNum, pageNo){
		if(! confirm("게시물을 삭제 하시겠습니까?"))
			return false;
		
		var url="<%=cp%>/board/deleteReply.do"
		$.post(url,{replyNum:replyNum}, function(data){
			if(data.state=="loginFail"){
				location.href="<%=cp%>/member/login.do";
			}else if(data.state=="false") {
				alert("게시물을 삭제할 수 없습니다.");
			}else{
				listPage(pageNo);
			}
				
		}, "json");		
	}
	
	
	
	
	
	
	</script>





   <div class="right_col" role="main">

                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>
                   <i class="fa fa-child fa-2x"></i>자유게시판
                    
                </h3>
                        </div>

                        <!-- <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="x_panel">
                                <!-- <div class="x_title">
                                    <h2>Invoice Design <small>Sample user invoice design</small></h2>
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
                                </div> -->
                                <div class="x_content">

                                    <section class="content invoice">
                                        <!-- title row -->
                                        <div class="row">
                                            <div class="col-xs-12 invoice-header">
                                                <h1>
                                        <i class="fa fa-globe"></i> ${dto.subject}
                                        <small class="pull-right">등록일: ${dto.created}</small>
                                    </h1>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- info row -->
                                        <div class="row invoice-info">
                                            <div class="col-sm-4 invoice-col">
                                              	  작성자
                                                <address>
                                        <strong>${dto.userName}</strong>

                                    </address>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 invoice-col">
                                                To
                                                <address>
                                        <strong>${dto.userName}</strong>
                                        <br>795 Freedom Ave, Suite 600
                                        <br>New York, CA 94107
                                        <br>Phone: 1 (804) 123-9876
                                        <br>Email: jon@ironadmin.com
                                    </address>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 invoice-col">
                                                <b>조회수 : ${dto.hitCount}</b>
                                                <br>
                                                <br>
                                                <b>댓글수:</b> 4F3S8J
                                                <br>
                                                <b>Payment Due:</b> 2/22/2014
                                                <br>
                                                <b>Account:</b> 968-34567
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->

                                        <!-- Table row -->
                                        <div class="row">
                                            <div class="col-xs-12 table">
                                                
                                       <div class='span8 main'>
								         ${dto.content}
								      </div>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                       
                                        
                                        <!-- this row will not appear when printing -->
                                        <div class="row no-print">
                                            <div class="col-xs-12">
                                             <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
                                                <button class="btn btn-default" onclick="javascript:location.href='<%=cp%>/board/update.do?num=${dto.num}&pageNum=${pageNum}';">수정</button>
                                                <button class="btn btn-default" onclick="javascript:deleteBoard('${dto.num}');">삭제</button>
                                               </c:if>
                                                <c:if test="${not empty nextReadDto }">
                                                	<a href="<%=cp%>/board/article.do?${params}&num=${nextReadDto.num}"><button class="btn btn-success pull-right" style="margin-right: 5px;">다음글</button></a>
   												</c:if>	
                                                <a href="<%=cp%>/board/list.do"><button class="btn btn-primary pull-right" style="margin-right: 5px;">목록</button></a>
                                                <c:if test="${not empty preReadDto }">
                                               <a href="<%=cp%>/board/article.do?${params}&num=${preReadDto.num}"><button class="btn btn-success pull-right" style="margin-right: 5px;">이전글</button></a>
												</c:if>
   
                                            </div>
                                        </div>
                                        
                                        <div class="container">
  <div class="post-comments">

      <div class="form-group">
        <label for="comment">Your Comment</label>
        <textarea name="comment" id="content" class="form-control" rows="3"></textarea>
      </div>
      <button type="button" class="btn btn-default" onclick="sendReply()">Send</button>

    <div class="comments-nav">
      <ul class="nav nav-pills">
        <li role="presentation" class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                  there are 2593 comments <span class="caret"></span>
                </a>
          <ul class="dropdown-menu">
            <li><a href="#">Best</a></li>
            <li><a href="#">Hot</a></li>
          </ul>
        </li>
      </ul>
    </div>



  </div>
  <!-- post-comments -->
</div>
       
                         <div id="listReply" style="width:100%; margin: 0px auto;"></div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 

        </div>
