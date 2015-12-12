<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <link href="<%=cp%>/res/defaultTemplate/css/editor/external/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="<%=cp%>/res/defaultTemplate/css/editor/index.css" rel="stylesheet">
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
 <style>
 .form-control {
    border-radius: 10px;
    line-height: 30px;
    width: 100%;
}
.well.well-sm.well-lg{
	border-radius: 10px;
}
 </style>
 
  <script>
 function check() {
	 
    var f = document.qnaform;
	
	str = f.subject.value;
	str = str.trim();
    if(!str) {
        alert("\n제목을 입력하세요. ");
        f.subject.focus();
        return false;
    }
	f.subject.value = str;

	str = f.content.value;
    str = str.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }
	 str=f.content.value ;
	// alert(str);

	var mode="${mode}";
	if(mode == "created")
        f.action = "<%=cp%>/qna/created.do";
    else
        f.action = "<%=cp%>/qna/update.do";
        
    return true;
}
 </script>
 
<div class="right_col" role="main">
   <div class="clearfix"></div>
   <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
         <div class="x_panel">
            <div class="x_title">
               <h2><i class="fa fa-child fa-2x"></i>QnA<small>QnA 질문을 등록하세요.</small></h2>
               
               <div class="clearfix"></div>
            </div>
         	<div class="clearfix"></div>
     	<div class="container">
     		<div class="col-md-12 col-sm-12 col-xs-12">
      		  <div class="well well-sm well-lg">
       		   <form class="form-horizontal" method="post" name="qnaform" onsubmit="return check();">
       		   <fieldset>
          		  <legend class="text-center">글쓰기</legend>
    
	            <!-- subject input-->
	            <div class="form-group">
	              <label class="col-md-2 control-label" for="name">제목</label>
	              <div class="col-md-10 col-sm-10 col-xs-10">
	                <input id="subject" name="subject" type="text" placeholder="제목을 입력하세요." class="form-control">
	              </div>
	            </div>
	    
	            <!-- userName input-->
	            <div class="form-group">
	              <label class="col-md-2 control-label" for="email">작성자 이름</label>
	              <div class="col-md-10 col-sm-9 col-xs-9">
	                <input id="userName" name="userName" type="text" placeholder="이름을 입력하세요." class="form-control">
	              </div>
	            </div>
	    
	            <!-- Message body -->
	            <div class="form-group">
	              <label class="col-md-2 control-label" for="message">Your message</label>
	              <div class="col-md-10 col-sm-9 col-xs-9">
	                <textarea class="form-control" id="content" name="content" placeholder="내용을 입력해 주세요" rows="10"></textarea>
	              </div>
	            </div>
	    
	            <!-- Form actions -->
	            <div class="form-group">
	              <div class="col-md-12 text-right">
	              	<button type="reset" class="btn btn-primary btn-lg">Cancel</button>
	                <button type="submit" class="btn btn-primary btn-lg">Submit</button>
	              </div>
	            </div>
          	</fieldset>
          </form>
        </div>
      </div>
	</div>
</div>
</div>
</div>
</div>

