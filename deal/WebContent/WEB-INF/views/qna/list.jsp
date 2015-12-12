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
.page-header{
padding-bottom:9px;margin:40px 0 20px;border-bottom:1px solid #eee;font-size: 23pt;color: #555;    
    font-weight: bold;}
.col-sm-offset-1{
margin-left:5%
}

.pagination{
	padding-left:20%;
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
.thumbnail{
  height: auto;
}

.panel panel-default arrow left{
	height: 131px;
}
.img-circle1{
	width:130px;
	height:130px;
	border-radius:50%;
	margin-left: 0px;
}
</style>

<script type="text/javascript">

function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/qna/list.do";
	f.submit();
}

// 댓글별 답글 리스트
function listReply(num) {
	var rta="#listReply"+num;
	var btn="#btnAnswer"+num;
	var url="<%=cp%>/qna/reply.do";
	
	 $.post(url, {num:num}, function(data){
		$(rta).html(data);
	}); 
	
 }
	
//댓글별 답글 폼
function replyListForm(num) {
	var id="#listReply"+num;
	var rta="#rta"+num;
	var btn="#btnAnswer"+num;
	var s;
	
	if($(id).is(':hidden')) {
		$("[id*=layoutAnswer]").hide();
		
		$("[id*=btnAnswer]").each(function(){
			s=$(this).val();
			$(this).val(s.substring(0, s.length-1)+"▼");
		});
		
		listReply(num);
		$(id).show();
		
		 
		//$(rta).focus();
		s=$(btn).val();
		$(btn).val(s.substring(0, s.length-1)+"▼");
		//closetest(id); 
	} else{
		$(id).hide();
		s=$(btn).val();
		$(btn).val(s.substring(0, s.length-1)+ "▼");
	}
}

function replyAnswerForm(num) {
	   var id="#layoutAnswer"+num;
	   var rta="#rta"+num;
	   var btn="#btnAnswer"+num;
	   var s;
	   
	   if($(id).is(':hidden')) {
	      $("[id*=layoutAnswer]").hide();
	      
	      $("[id*=btnAnswer]").each(function(){
	         s=$(this).val();
	         $(this).val(s);
	      });

	      $(id).show();
	      //$(rta).focus();
	      s=$(btn).val();
	      $(btn).val(s);
	   }  else {
	      $(id).hide();
	      s=$(btn).val();
	      $(btn).val(s);
	   }
	}

// 댓글별 답글 추가
function sendReplyAnswer(num) {
	var isLogin="${sessionScope.member.userId}";
	if(! isLogin) {
		login();
		return false;
	}
	
	var rta="#rta"+num;
	var content=$.trim($(rta).val());
	
	
	if(! content ) {
		alert("내용을 입력하세요 !!!\n");
		$(rta).focus();
		return false;
	} 
	
	var params="num="+num;
	params+="&content="+content;
	
	$.ajax({
		type:"POST"
		,url:"<%=cp%>/qna/replyCreated.do"
		,data:params
		,dataType:"json"
		,success:function(data) {
			$(rta).val("");
			
  			var state=data.state;
			if(state=="true") {
				listReply(num);
			} else if(state=="false") {
				alert("답글을 등록하지 못했습니다. !!!");
			} else if(state=="loginFail") {
				login();
			}
		}
		,error:function(e) {
			alert(e.responseText);
		}
	});
}

function deleteQna(num) {
	var isLogin="${sessionScope.member.userId}";
	if(! isLogin){
		login();
		return false;
	}
	if(confirm("게시물을 삭제하시겠습니까?")){
		var url="<%=cp%>/qna/deleteQna.do";
		$.post(url,{num:num},function(data){
			var state=data.state;
			if(state=="loginFail"){
				login();
			}
			location.href="<%=cp%>/qna/list.do";
		},"json");
	}
}
</script>

<div class="right_col" role="main">
<div class="container">
  <div class="row">
    <div class="col-sm-10 col-sm-offset-1">
    	
    		 <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                 <form action="" name="searchForm" method="post">
                 <select name="searchKey" class="selectField pull-left" style="height:32px; border-radius:20px;">
					<option value="subject">제목</option>
					<option value="userId">작성자</option>
					<option value="content">내용</option>
					<option value="created">등록일</option>
			    </select>
			     
			    
                 <div class="input-group">
                       <input type="text" name="searchValue" class="form-control" placeholder="Search for...">
                       <span class="input-group-btn">
                       <button class="btn btn-default" type="button" onclick="searchList()">Go!</button>
                       </span>
                 </div>
                 </form>
           		</div>
           	
      <h2 class="page-header">Q&A</h2>
        <section class="comment-list">
          <!-- First Comment -->
          <c:forEach var="dto" items="${list}">
          
          <article class="row">
            <div class="col-md-2 col-sm-2 hidden-xs">
              <figure class="thumbnail">
                <img src="<%=cp%>/uploads/photo/${dto.imageFilename}" class="img-circle1 img-responsive"/>
                <figcaption class="text-center">${dto.userId}</figcaption>
              </figure>
            </div>
             <div class="panel panel-default arrow left col-md-10 col-sm-10 col-xs-12">
                <div class="panel-heading right">${dto.subject}</div>
                <div class="panel-body">
                  <header class="text-left">
                    <div class="comment-user"><i class="fa fa-user"></i></div>
                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i>${dto.created}</time>
                  </header>
                  <div class="comment-post col-md-10 col-sm-10 col-xs-10">
                  
                     ${dto.content}
                  
                  </div>
 
                </div>
                <div>
				
				<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
                <div class="pull-right"><a onclick='deleteQna("${dto.num}")' class="btn btn-default btn-sm">삭제</a></div>
                </c:if>
                
                <div class="pull-right"><a id="btnAnswer${dto.num}" class="btn btn-default btn-sm" onclick="replyListForm('${dto.num}')" >답글보기</a></div>
					
<c:if test="${sessionScope.member.userId=='admin'}">
	<div class="pull-right">
	<a id="btnAnswer${dto.num}" class="btn btn-default btn-sm" onclick="replyAnswerForm('${dto.num}')" >답변하기</a></div>
	<div id="layoutAnswer${dto.num}" >
		<div class="form-group">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<textarea class="form-control" id="rta${dto.num}" name="content" placeholder="내용을 입력해 주세요" rows="5"></textarea>
				</div>
			<div style="float: right;"><br><br>
				<input type="button" value="등록" onclick="sendReplyAnswer('${dto.num}')" class="btn" style="width: 60px; height: 35px; margin-top: 5px;"> 
			</div>
		</div>
	</div>
	
</c:if>
					
					<div id="listReply${dto.num}"></div>
                
					</div> 
		
              </div>


          </article>
          
		
		
          </c:forEach>
          
        
          <!-- 페이징 -->
          <div class="x_content" style="float: left">
          <a href="<%=cp%>/qna/created.do"><button type="button" class="btn btn-danger">글쓰기</button></a>
          <div style="height: 30px">${pageIndexList}</div>
          
          <!-- <ul class="pagination">
			<li class="disabled"><a href="#">«</a></li>
			<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">»</a></li>
			</ul> -->
		  </div>
        </section>
    </div>
  </div>
</div>
</div>


<style>
div {word-break:break-all;}
</style>