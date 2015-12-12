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
                                    <h2><i class="fa fa-child fa-2x"></i>약관 동의<small>필수동의사항 입니다.</small></h2>
                                    
                                    <div class="clearfix"></div>
                                </div>






<div style="min-height: 450px;">
		<div style="width:100%;	height: 240px; line-height:40px;clear: both; border-top: 1px solid #DAD9FF;border-bottom: 1px solid #DAD9FF;">
		    <div style="width:100%; height:240px; line-height:30px; margin:5px auto;">
		   (필수) 딜러시크 구매회원 이용약관
		    <textarea readonly="readonly" rows="5" cols="84" class="boxTF" id="content" style="width:100%; height: 150px; resize:none;">
1. 회원의 주소 또는 e-mail주소에 도달함으로써 회사의 통지는 유효하고, 회원 정보의 변경/미 변경에 대한 책임은 회원에게 있음. (제8조)
2. 약관이 정하는 부정거래 행위를 한 회원에 대하여 제재 조치 가능 예: 직거래, 경매 부정행위, 시스템 부정행위, 결제 부정행위, 재판매 목적의 거래행위 등. (제36조)
3. 딜러시크는 통신판매중개자로서 판매자와 구매자와의 거래에 관한 분쟁에 개입하지 않으며 어떠한 보증 및 책임도 부담하지 않음.(제6조, 제38조)</textarea>
<div align="center" style="width:100%; height:200px; line-height:30px; margin:5px auto;">
		    <input type="checkbox">&nbsp;위 약관에 동의합니다.
		    </div>	
		    </div>
		 
		</div>

		<div style="width:100%;	height: 240px; line-height:40px;clear: both; border-top: 1px solid #DAD9FF;border-bottom: 1px solid #DAD9FF;">
		    <div style="width:100%; height:240px; line-height:30px; margin:5px auto;">
		   (필수) 전자금융 서비스 이용약관
		    <textarea readonly="readonly" rows="5" cols="84" class="boxTF" id="content" style="width:100%; height: 150px; resize:none;">
1. 접근매체의 양도∙양수, 대여∙사용위임, 질권설정 기타 담보 제공 및 이의 알선과 접근매체를 제3자에게 누설∙노출,방치하는 것은 금지됨. (제17조, 제21조, 제23조)
2. 소비자가 재화 등을 공급받은 날부터 3 영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 통보하지 않는 경우 소비자의 동의 없이 판매자에게 결제대금을 지급할 수 있으며, 회사가 결제대금을 지급하기 전에 소비자가 그 결제대금을 환급 받을 사유가 발생한 경우 이를 소비자에게 환급함. (제19조)
3. 이용자의 선불전자지급수단 잔액이 구매 취소 등의 사유 발생으로 회사가 이용자로부터 환수해야 하는 환수 대상액보다 작을 경우 회사는 당해 이용자의 선불전자지급수단을 마이너스로 처리할 수 있음. (제27조)
		    </textarea>
		   <div align="center" style="width:100%; height:200px; line-height:30px; margin:5px auto;">
		    <input  type="checkbox">&nbsp;위 약관에 동의합니다.<br>
		    </div>	
		    </div>
		 
		 
		</div>
		
		
		<div style="width:100%;	height: 270px; line-height:40px;clear: both; border-top: 1px solid #DAD9FF;border-bottom: 1px solid #DAD9FF;">
		    <div style="width:100%; height:270px; line-height:30px; margin:5px auto;">
		   (선택) 딜러시크 이용약관
		    <textarea readonly="readonly" rows="5" cols="84" class="boxTF" id="content" style="width:100%; height: 180px; resize:none;">
① 이 약관에서 정하는 용어의 정의는 다음 각호와 같습니다. 
1. ‘전자금융거래’라 함은 회사가 전자적 장치를 통하여 전자금융서비스를 제공(이하 ‘전자금융업무’라 합니다)하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다. 
2. ‘전자지급수단’이라 함은 선불전자지급수단, 신용카드 등 전자금융거래법 제2조 제11호에서 정하는 전자적 방법에 따른 지급수단을 말합니다. 
3. ‘전자지급거래’라 함은 자금을 주는 자(이하 ‘지급인’이라 합니다)가 회사로 하여금 전자지급수단을 이용하여 자금을 받는 자(이하 ‘수취인’이라 합니다)에게 자금을 이동하게 하는 전자금융거래를 말합니다.
4. ‘전자적 장치’ 라 함은 전자금융거래정보를 전자적 방법으로 전송하거나 처리하는데 이용되는 장치로서 현금자동지급기, 자동입출금기, 지급용단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 정보를 전송하거나 처리하는 장치를 말합니다. 
5. ‘접근매체’라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함합니다), 전자서명법 상의 전자서명생성정보 및 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다. 
6. ‘전자금융거래서비스’ 또는 ‘서비스’라 함은 회사가 이용자에게 제공하는 제4조 기재의 서비스를 말합니다. 
7. ‘이용자’라 함은 제2장 내지 제4장에서 달리 정한 것을 제외하고는 본 이용약관에 동의하고 회사가 제공하는 전자금융거래서비스를 이용하는 인터넷사이트 회원을 말합니다. 
8. '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다. 
9. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다. 
10. '이용자번호'란 이용자의 동일성 식별과 서비스 이용을 위하여 이용자가 설정하고 회사가 승인한 숫자와 문자의 조합을 말합니다. 
11. '비밀번호'란 이용자의 동일성 식별과 회원정보의 보호를 위하여 이용자가 설정하고 회사가 승인한 숫자와 문자의 조합을 말합니다. 
12. ‘가맹점’이란 회사와의 계약에 따라 전자지급수단에 의한 거래에 있어서 이용자에게 재화 또는 용역을 제공하는 자로서 전자금융업자가 아닌 자를 말합니다. 
② 본 조 및 본 약관 각 장의 정의조항에서 정한 것을 제외하고는 전자금융거래법 등 관련법령이 정한 바에 의합니다.
		    </textarea>
		  
		   <div align="center" style="width:100%; height:200px; line-height:30px; margin:5px auto;">
		    <input type="checkbox">&nbsp;위 약관에 동의합니다.
		    </div>	
		    </div>
		 
		</div>
		
		<div style="margin: 20px auto; width:600px; min-height: 10px;">
		<div align="center">
           	<input type="button" value=" 개인 회원가입 " class="btn" onclick="javascript:location.href='<%=cp%>/member/member.do'"/>
			<input type="button" value=" 사업자회원가입" class="btn" onclick="javascript:location.href='<%=cp%>/member/member.do'"/>
		</div>
		</div>
		
		
		
		
		

	</div>
	
	</div>
	
	</div>
	</div>
	