<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
.confirmButton {
	 font-size: 11pt; 
	 font-family: 나눔고딕, 맑은 고딕, 돋움;
	 background-color:#507CD1;
	 border:none;
	 color:#FFFFFF;
	 width: 360px;
	 height: 50px;
	 line-height: 50px;
}
.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 17px;
   color: #999999; font-size: 11pt;
   font-family: 맑은 고딕;
}
.loginTF {
  width: 340px; height: 35px;
  padding: 5px;
  padding-left: 15px;
  border:1px solid #666666;
  margin-top:5px; margin-bottom:5px;
  font-family:돋움;
  font-size:10pt;
}
</style>

<script type="text/javascript">
//엔터 처리
$(function(){
	   $("input").not($(":button")).keypress(function (evt) {
	        if (evt.keyCode == 13) {
	            var fields = $(this).parents('form:eq(0),body').find('button,input,textarea,select');
	            var index = fields.index(this);
	            if ( index > -1 && ( index + 1 ) < fields.length ) {
	                fields.eq( index + 1 ).focus();
	            }
	            return false;
	        }
	     });
});

	function bgLabel(ob, id) {
	    if(!ob.value) {
		    document.getElementById(id).style.display="";
	    } else {
		    document.getElementById(id).style.display="none";
	    }
	}

	function sendOk() {
        var f = document.pwdForm;

        var str = f.userPwd.value;
        if(!str) {
            alert("\n패스워드를 입력하세요. ");
            f.userPwd.focus();
            return;
        }

        f.action = "<%=cp%>/member/pwd.do";
        f.submit();
	}
</script>

<div style="min-height: 450px;">
		<div style="width:100%;	height: 40px; line-height:40px;clear: both; border-top: 1px solid #DAD9FF;border-bottom: 1px solid #DAD9FF;">
		    <div style="width:420px; height:30px; line-height:30px; margin:5px auto;">
		        <img src="<%=cp%>/res/images/arrow.gif" width="11" height="11" alt="" style="padding-left: 5px; padding-right: 5px;" />
		        <span style="font-weight: bold;font-size:13pt;font-family: 나눔고딕, 맑은 고딕, 굴림;">패스워드 재확인</span>
		    </div>
		</div>
		
		<div style="margin: 50px auto 10px; width:420px; min-height: 350px;">
		
			<form name="pwdForm" method="post" action="">
			  <table style="width:420px; margin: 30px auto 0px; padding:30px; border-collapse: collapse; border: 1px solid #DAD9FF;">
			  <tr style="height:50px;"> 
			      <td style="padding-left: 30px; text-align: left;">
			          정보보호를 위해 패스워드를 다시 한 번 입력해주세요.
			      </td>
			  </tr>

			  <tr style="height:60px;" align="center"> 
			      <td> 
			        &nbsp;
			        <input type="text" name="userId" class="loginTF" maxlength="15"
			                   tabindex="1"
			                   value="${sessionScope.member.userId}"
	                           readonly="readonly"
			           >
			           &nbsp;
			      </td>
			  </tr>
			  <tr align="center" height="60"> 
			      <td>
			        &nbsp;
			        <label for="userPwd" id="lblUserPwd" class="lbl" >패스워드</label>
			        <input type="password" name="userPwd" class="loginTF" maxlength="20" 
			                   tabindex="2"
	                           onfocus="document.getElementById('lblUserPwd').style.display='none';"
	                           onblur="bgLabel(this, 'lblUserPwd');"
			        >
			        &nbsp;
			      </td>
			  </tr>
			  <tr align="center" height="65" > 
			      <td>
			        &nbsp;
			        <input type="hidden" name="mode" value="${mode}">
			        <input type="button" value=" 확인 " onclick="sendOk();" class="confirmButton"/>
			        &nbsp;
			      </td>
			  </tr>
			  <tr align="center" height="10" > 
			      <td>&nbsp;</td>
			  </tr>
			  
		    </table>
			</form>
			           
		    <table style="width:420px; margin: 10px auto 0px; border-collapse: collapse;">
			  <tr align="center" height="30" >
			    	<td><span style="color: blue;">${message}</span></td>
			  </tr>
			  </table>
		</div>

</div>
	