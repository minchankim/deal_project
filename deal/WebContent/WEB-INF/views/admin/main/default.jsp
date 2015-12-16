<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("UTF-8");
%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/template/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
  function check() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("\n제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

    	str = f.content.value;
        if(str=="" || str=="<br>") {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

        var mode="${mode}";
    	if(mode=="created")
    		f.action="<%=cp%>/bbs/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/bbs/update";

    		// image 버튼, submit은 submit() 메소드 호출하면 두번전송
        return true;
 }
</script>

<div class="bodyFrame2">
    <div style="width:780px; margin-top:40px; margin-left:40px; height: 40px; line-height:40px; clear: both; border-bottom: 2px solid #212121;">
        <div style="width:730px; height:30px; line-height:30px; margin:5px 0px;">
            <span style="font-weight: bold;font-size:16pt;font-family: 맑은 고딕, 돋움; color: #242424">
                  게 시 판           
            </span>
        </div>
    
    <div style="width:780px; margin-left:40px; clear: both">
        <div style="width: 50%; height: 50px; line-height:50px; float: left;">
           <span style="font-size:9pt;font-family: 맑은 고딕, 나눔고딕, 돋움;">
                 홈 &gt; 커뮤니티 &gt; <b>게시판</b>
           </span>
        </div>
        <div style="width: 50%; height: 50px; line-height:50px; float: left;">
        </div>
    </div>
    
    <div style="width:770px; margin-left:50px; padding-top:25px; clear: both">
    
			<form name="boardForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);" >
			  <table style="width: 730px; margin: 0px; border-spacing: 0px;">
			  <tr><td colspan="2" height="2" bgcolor="#212121"></td></tr>
			
			  <tr align="left" height="30"> 
			      <td width="90" bgcolor="#EFEFEF" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			      <td width="640" style="padding-left:10px;"> 
			        <input type="text" name="subject" size="77" maxlength="100" class="boxTF" value="${dto.subject}"/>
			      </td>
			  </tr>
			  <tr><td colspan="2" height="1" bgcolor="#C3C3C3"></td></tr>

			  <tr align="left" height="30"> 
			      <td width="90" bgcolor="#EFEFEF" style="text-align: center;">작성자</td>
			      <td width="640" style="padding-left:10px;"> 
					  ${sessionScope.member.userName}
			      </td>
			  </tr>
			   <tr><td colspan="2" height="1" bgcolor="#C3C3C3"></td></tr>
			
			  <tr align="left"> 
			      <td width="90" bgcolor="#EFEFEF" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td width="640" valign="top" style="padding:5px; padding-left:10px;"> 
			        <textarea id="content" name="content" cols="75" rows="12" style="width:610px; height:270px;">${dto.content}</textarea>
			      </td>
			  </tr>
			  
			   <tr><td colspan="2" height="1" bgcolor="#C3C3C3"></td></tr>
			  <tr align="left" height="30"> 
			      <td width="90" bgcolor="#EFEFEF" style="text-align: center;">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
			      <td width="640" style="padding-left:10px;"> 
					<input type="file" name="upload" class="boxTF" size="61" style="height: 20px;">
			      </td>
			  </tr>
			
<c:if test="${mode=='update'}">
			  <tr><td colspan="2" height="1" bgcolor="#C3C3C3"></td></tr>
			  
			  <tr align="left" height="30"> 
			      <td width="90" bgcolor="#EFEFEF" style="text-align: center;">첨부된파일</td>
			      <td width="640" style="padding-left:10px;"> 
			          ${dto.originalFilename}
			          <c:if test="${not empty dto.originalFilename}">
							| <a href="<%=cp%>/bbs/deleteFile?num=${dto.num}&pageNum=${pageNum}">삭제</a>
			          </c:if>
			      </td>
			  </tr>
</c:if>
			
			  <tr><td colspan="2" height="1" bgcolor="#212121"></td></tr>
			  </table>
			
			  <table style="width: 730px; margin: 0px; border-spacing: 0px;">
			     <tr height="40"> 
			      <td align="center" >
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="num" value="${dto.num}"/>
			         	 <input type="hidden" name="saveFilename" value="${dto.saveFilename}"/>
			         	 <input type="hidden" name="originalFilename" value="${dto.originalFilename}"/>
			        	 <input type="hidden" name="pageNum" value="${pageNum}"/>
			        </c:if>
			      
				    <input type="image" src="<%=cp%>/res/images/btn_submit.gif" />
        		    <a href="javascript:location.href='<%=cp%>/bbs/list';"><img src="<%=cp%>/res/images/btn_cancel.gif" border="0"></a>
			      </td>
			    </tr>
			  </table>
			
			</form>
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
    
    </div>

</div>
