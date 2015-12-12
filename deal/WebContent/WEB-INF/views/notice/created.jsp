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
 
 <script type="text/javascript" src="<%=cp%>/res/template/se/js/HuskyEZCreator.js" charset="utf-8"></script>
 
 
   <div class="right_col" role="main">
   <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2><i class="fa fa-child fa-2x"></i>공지사항<small>중요공지를 확인하세요.</small></h2>
                                    
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br>
                                    <form name = "noticeForm" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" onsubmit="return submitContents(this);">

                                        <div class="form-group">
                                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">제목<span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" required="required" name="subject" value="${dto.subject}" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">공지여부<span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                 <input type="checkbox" name="notice" value="1" ${dto.notice==1 ? "checked='checked' ":"" } />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="last-name">작성자<span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                               ${sessionScope.member.userName}
                                            </div>
                                        </div>
                                        
                       
                                
                                
                                <div class="form-group">
                                            <label class="control-label col-md-2 col-sm-2 col-xs-12">내용을 입력하시오 <span class="required">*</span>
                                            </label>
                                       
                        
 								<table style="width: 730px; margin: 0px; border-spacing: 0px;">
                                  <tr align="left"> 
							      
							      <td width="640" valign="top" style="padding:5px; padding-left:10px;"> 
							        <textarea id="content" name="content" cols="75" rows="12" style="width:610px; height:270px;">${dto.content}</textarea>
							      </td>
							  </tr>
							  </table>

                    </div> 
                                        
                            <c:if test="${mode=='update'}">
				               <input type="hidden" name="pageNum" value="${pageNum}">
				               <input type="hidden" name="num" value="${dto.num}">
			         		</c:if>     
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                       
                                        
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                              <a href="<%=cp%>/notice/list.do"><button type="submit" class="btn btn-dark">
                                              <c:if test="${mode=='update'}">
                                              	수정하기
                                              </c:if>
                                              <c:if test="${mode=='created'}">
                                              	저장하기
                                              </c:if>
                                              </button></a>
                                              <a href="<%=cp%>/notice/list.do"><button type="button" class="btn btn-dark">돌아가기</button></a>
                                              
                                            </div>
                                        </div>
 
                                    </form>
                                </div>
                            </div>
                        </div>
                    
                    </div>
        </div>
        
         <script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/res/template/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			//alert("아싸!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
        
        
        
<script type="text/javascript">
  function check() {
        var f = document.noticeForm;

    	var str = f.subject.value;
        if(!str) {
            alert("\n제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

    	str = f.content.value;
    	if(str=="" || str=="<br>") {
            alert("\n내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

        var mode="${mode}";
        if(mode=="created")
            f.action = "<%=cp%>/notice/created.do";
        else if(mode=="update")
            f.action = "<%=cp%>/notice/update.do";
        else if(mode=="reply")
            f.action = "<%=cp%>/notice/reply.do";
                   
            
       return true;
  }
</script>
        
        
        
        

 