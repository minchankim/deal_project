<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>

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

function memberOk() {
	var f = document.memberForm;
	var str;

	str = f.userId.value;
	str = str.trim();
	if(!str) {
		alert("\n아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}

/*
	if(!/^((\w|[\_\!\$\#])+)$/.test(str)) {
		alert("\n아이디는 영숫자와 _ ! $ # %만 가능합니다. ");
		f.userId.focus();
		return;
	}
*/    
	f.userId.value = str;

	str = f.userPwd.value;
	str = str.trim();
	if(!str) {
		alert("\n패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value = str;

	if(str!= f.userPwd1.value) {
        alert("\n패스워드가 일치하지 않습니다. ");
        f.userPwd1.focus();
        return;
	}
	
    str = f.userName.value;
	str = str.trim();
    if(!str) {
        alert("\n이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    f.userName.value = str;

    str = f.birth.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("\n생년월일를 입력하세요[YYYY-MM-DD]. ");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
	str = str.trim();
    if(!str) {
        alert("\n전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
	str = str.trim();
    if(!str) {
        alert("\n전화번호를 입력하세요. ");
        f.tel2.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("\n숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
	str = str.trim();
    if(!str) {
        alert("\n전화번호를 입력하세요. ");
        f.tel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("\n숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email1.value;
	str = str.trim();
    if(!str) {
        alert("\n이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value;
	str = str.trim();
    if(!str) {
        alert("\n이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }

    var mode="${mode}";
    if(mode=="created") {
    	f.action = "<%=cp%>/member/member.do";
    } else if(mode=="update") {
    	f.action = "<%=cp%>/member/update.do";
    }

    f.submit();
}

function changeEmail() {
    var f = document.memberForm;
    
 	var str = f.selectEmail.value;
    if(str!="direct") {
         f.email2.value=str; 
         f.email2.readOnly = true;
         f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}
</script>


   <div class="right_col" role="main">
   
  <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2><i class="fa fa-child fa-2x"></i>회원 가입<small>딜러시크와 함께해요</small></h2>
                                    
                                    <div class="clearfix"></div>
                                </div>






<div style="min-height: 450px;">
		<div style="width:100%;	height: 200px; line-height:40px;clear: both; border-top: 1px solid #DAD9FF;border-bottom: 1px solid #DAD9FF;">
		    <div style="width:100%; height:200px; line-height:30px; margin:5px auto;">
		   
		    <textarea rows="5" cols="84" class="boxTF" id="content" style="width:100%; height: 150px;">
	1. 회원의 주소 또는 e-mail주소에 도달함으로써 회사의 통지는 유효하고, 회원 정보의 변경/미 변경에 대한 책임은 회원에게 있음. (제8조)
	2. 약관이 정하는 부정거래 행위를 한 회원에 대하여 제재 조치 가능 예: 직거래, 경매 부정행위, 시스템 부정행위, 결제 부정행위, 재판매 목적의 거래행위 등. (제36조)
	3. G마켓은 통신판매중개자로서 판매자와 구매자와의 거래에 관한 분쟁에 개입하지 않으며 어떠한 보증 및 책임도 부담하지 않음. (제6조, 제38조)
		    </textarea>
		   <div style="width:100%; height:200px; line-height:30px; margin:5px auto;">
		    <input type="checkbox">위 약관에 동의합니다.
		    </div>	
		    </div>
		 
		</div>
		
		<div style="margin: 20px auto 10px; width:600px; min-height: 400px;">
		
           	<form name="memberForm" method="post">
				<table style="width:600px; margin: 0px auto; border-collapse: collapse; border-spacing: 0;">

				<tr height="2"><td colspan="2" bgcolor="#507CD1"></td></tr>
	
				<tr height="35">

				
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					아&nbsp;이&nbsp;디
					</td>
					<td align="left" style="padding-left: 5px;">
						<input type="text" name="userId" id="userId"  size="25" maxlength="10"  class="boxTF" 
										value="${dto.userId}" ${mode=="update" ? "readonly='readonly' style='border:none;'":""}/>
							  <span id="userIdState" style='display:none;'></span>
					</td>
				</tr>
				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
			
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					패스워드
					</td>
					<td align="left" style="padding-left: 5px;">
						<input type="password" name="userPwd" class="boxTF" size="25" maxlength="10"/>
					</td>
				</tr>
				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
			
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					패스워드 확인
					</td>
					<td align="left" style="padding-left: 5px;">
						<input type="password" name="userPwd1" class="boxTF" size="25" maxlength="10"/>
					</td>
				</tr>
				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
			
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					이&nbsp;&nbsp;&nbsp;&nbsp;름
					</td>
					<td align="left" style="padding-left: 5px;">
						<input type="text" name="userName" size="25" maxlength="20"  class="boxTF" 
										value="${dto.userName}" ${mode=="update" ? "readonly='readonly' style='border:none;' ":""}/>
					</td>
				</tr>
				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
			
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					생년월일
					</td>
					<td align="left" style="padding-left: 5px;">
						<input type="text" name="birth" size="25" maxlength="20"  class="boxTF" 
										value="${dto.birth}" />
					</td>
				</tr>
				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
			
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					이 메 일
					</td>
					<td align="left" style="padding-left: 5px;">
							  <select name="selectEmail" onchange="changeEmail();">
									<option value="">선 택</option>
									<option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
									<option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
									<option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
									<option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
									<option value="direct">직접입력</option>
							  </select>
							  <input type="text" name="email1" size="13" maxlength="30"  class="boxTF" 
										value="${dto.email1}"/> @ 
							  <input type="text" name="email2" size="13" maxlength="30"  class="boxTF" 
										value="${dto.email2}" readonly="readonly"/>
					</td>
				</tr>
				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
				
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					전화번호
					</td>
					<td align="left" style="padding-left: 5px;">
							  <select name="tel1">
									<option value="">선 택</option>
									<option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
									<option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
									<option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
									<option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
									<option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
									<option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
							  </select>
							  <input type="text" name="tel2" size="5" maxlength="4"  class="boxTF" 
										value="${dto.tel2}" onkeypress="onlyNum();"/> -
							  <input type="text" name="tel3" size="5" maxlength="4"  class="boxTF" 
										value="${dto.tel3}" onkeypress="onlyNum();"/>
					</td>

				</tr>
				
					<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
				
				<tr height="50">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					사진
					</td>
			
				<td>
									
				    <img src="http://static.naver.net/me/new/profile_default.gif" width="100" height="100" data-src="">
						<input type="file" accpet="image/*" name="image" class="file_upload _img_input N=a:pfe.upimage">
	</td>

				</tr>
				

			
				<tr height="2"><td colspan="2" bgcolor="#507CD1"></td></tr>
			
				<tr height="40" >
					<td align="center" colspan="2" style="padding-top: 8px">
						<%-- <c:if test="${mode=='created'}"> --%>
							<input type="button" value=" 회원가입 " class="btn" onclick="memberOk();"/>
							<input type="reset" value=" 다시입력 " class="btn" onclick="document.memberForm.userId"/>
							<input type="button" value=" 가입취소 " class="btn" onclick="javascript:location.href='<%=cp%>';"/>
						<%-- </c:if> --%>
						<c:if test="${mode=='update'}">
							<input type="button" value=" 정보수정 " class="btn" onclick="memberOk();"/>
							<input type="reset" value=" 다시입력 " class="btn" onclick="document.memberForm.userId"/>
							<input type="button" value=" 수정취소 " class="btn" onclick="javascript:location.href='<%=cp%>';"/>
						</c:if>
					</td>
				</tr>
				
				<tr height="35">
					<td align="center" colspan="2">
					    <span style="color: blue;">${message}</span>
					</td>
				</tr>
				</table>
			</form>
		
		</div>

	</div>
	
	</div>
	
	</div>
	</div>
	