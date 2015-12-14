<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
//nice form step wizard
$(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            
    allNextBtn2 = $('.nextBtn2');
    allNextBtn1 = $('.nextBtn1');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn2.click(function(){
    	


         if (!document.getElementById('check1').checked) {
        	alert("약관의 동의해주세용1");

        	document.getElementById('check1').focus();
        	return false;
            
        } 
        
        if (!document.getElementById('check2').checked) {
        	alert("약관의 동의해주세용2");
       
        	document.getElementById('check2').focus();
        	return false;
            
        } 
        
        if (!document.getElementById('check3').checked) {
        	alert("약관의 동의해주세용3");

        	document.getElementById('check3').focus();
        	return false;
            
        } 
    	
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='email'],select[id='industry']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });
    
    allNextBtn1.click(function(){
    	


   	
       var curStep = $(this).closest(".setup-content"),
           curStepBtn = curStep.attr("id"),
           nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
           curInputs = curStep.find("input[type='text'],input[type='email'],select[id='industry']"),
           isValid = true;

       $(".form-group").removeClass("has-error");
       for(var i=0; i<curInputs.length; i++){
           if (!curInputs[i].validity.valid){
               isValid = false;
               $(curInputs[i]).closest(".form-group").addClass("has-error");
           }
       }

       if (isValid)
           nextStepWizard.removeAttr('disabled').trigger('click');
   });

    $('div.setup-panel div a.btn-primary').trigger('click');
});






function memberOk() {
	var f = document.memberForm;
	var str;

	 if (document.check1.unchecked) {
	    	alert("약관의 동의해주세용");
	    	f.check1.focus();
	    	return false;
	        
	    } 
	 if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
			alert('이미지 파일만 가능합니다. !!!');
			f.upload.focus();
			return false;
		}
	 alert(f.businessNum.value());

	f.action = "<%=cp%>/member/member.do";
	f.submit();
	
}

function memberOk() {
	var f = document.memberForm;
	var str;

	 if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
			alert('이미지 파일만 가능합니다. !!!');
			f.upload.focus();
			return false;
		}

	f.action = "<%=cp%>/member/member.do";
	f.submit();
	
}




function memberCheck() {
	

	var f = document.memberForm;
	var str;
	str=f.gender.value;
	alert(str);
	
	str = f.userId.value;
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}
	
	
	str = f.userPwd.value;
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd.focus();
		return;
	}
	
    str = f.userName.value;
    if(!str) {
        alert("\n이름을 입력하세요. ");
        f.userName.focus();
        return;
    }

    str = f.birth.value;
    if(!str || !isValidDateFormat(str)) {
        alert("\n생년월일를 입력하세요[YYYY-MM-DD]. ");
        f.birth.focus();
        return;
    }


}

    
$('.btn-success>input').click(function() {/*gender  */
    alert('test');
    $('input[type="radio"][name="options"]').not(':checked').prop("checked", true);
});

</script>

<style>
.stepwizard-step p {
    margin-top: 10px;
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;

}

.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
/* nice check boxes */
.input-group-addon.beautiful input[type="checkbox"],
.input-group-addon.beautiful input[type="radio"] {
    display: none;
}
.beautiful {
    color: white !important;
    font-size: 14px;
}
.beautiful .fa {
    font-size: 20px !important;
}
.bg-success {
  background-color: #5cb85c;
}
.text-white {
    color:white;
}
.add-top {
    margin-top:20px;
}


.btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}
</style>



<div class="right_col" role="main">



<div class="container">
    <!-- Step Wizard -->
            <div class="stepwizard">
                <div class="stepwizard-row setup-panel">
                    <div class="stepwizard-step">
                        <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                        <p>Step 1 <span style="color: blue;">${message}</span></p>
                    </div>
                    <div class="stepwizard-step">
                        <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                        <p>Step 2</p>
                    </div>
                    <div class="stepwizard-step">
                        <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                        <p>Step 3</p>
                    </div>
                </div>
            </div>
            <!-- Step Wizard END -->
            <!-- quote form -->
            <form name="memberForm" class="form-horizontal" role="form" method="post" enctype="multipart/form-data" autocomplete="on" spellcheck="true">
            
                <fieldset><!-- form contents -->




                    <!-- Wizard STEP 1 -->
                    <div class="row setup-content" id="step-1">
                        <div class="col-sm-12">
                        
                          <!-- ID input-->
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">ID</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                  <input name="userId" autocomplete="on" type="text" placeholder="NewId" class="form-control" required>
                                  <span class="input-group-addon label-danger"><i class="fa fa-user fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>
                            <!-- Pwd input-->
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Password</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                  <input name="userPwd" autocomplete="on" type="password" placeholder="Full Name" class="form-control" required>
                                  <span class="input-group-addon label-danger"><i class="fa fa-user fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>
                          
                          <!-- name input-->
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Name</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                  <input name="userName" autocomplete="on" type="text" placeholder="Full Name" class="form-control" required>
                                  <span class="input-group-addon label-danger"><i class="fa fa-user fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>
                            <!-- Gender input-->
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Gender</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                 
                                 
                                 
		
		<div class="btn-group" data-toggle="buttons">
			
			<label class="btn btn-success active" style="background-color:rgba(76, 168, 248, 0.79); border-color:#3276B1;">
				<input type="radio" name="gender" id="option1" autocomplete="off" value="1"  checked>
				<span class="glyphicon">M</span>
			</label>

			<label class="btn btn-danger"  style="background-color:rgba(255, 136, 132, 0.94) ; "  >
				<input type="radio" name="gender" id="option2" value="0"  autocomplete="off">
				<span class="glyphicon ">W</span>
			</label>
		
		</div>
                                 
                                 
                                  <span class="input-group-addon label-danger"><i class="fa fa-user fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>
                          
                            <!-- birth input-->
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">birth</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                  <input name="birth" autocomplete="on" type="text" placeholder="XXXX-XX-XX" class="form-control" required>
                                  <span class="input-group-addon label-danger"><i class="fa fa-user fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>
                          
                            <!-- tel input-->
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Tel</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                  <input name="tel" autocomplete="on" type="text" placeholder="000-0000-0000" class="form-control" required>
                                  <span class="input-group-addon label-danger"><i class="fa fa-user fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>
                          
                            
                          

                          <!-- email input-->
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Email</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                  <input name="email" type="email" placeholder="Email Address" class="form-control" required>
                                  <span class="input-group-addon label-danger"><i class="fa fa-envelope fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>
                          
                           <!-- addr input-->
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Addr</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                  <input name="addr" autocomplete="on" type="text" placeholder="주소를 입력하시오" class="form-control" required>
                                  <span class="input-group-addon label-danger"><i class="fa fa-user fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>

               

                          <!-- Text input-->
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">CardNum</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                  <input name="cardNum" type="text" placeholder=" 16자리" class="form-control" >
                                  <span class="input-group-addon bg-success"><i class="fa fa-phone fa-lg text-white"></i></span>
                                </div>
                            </div>

                            <label class="col-sm-2 control-label" for="textinput">CardPwd</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                  <input name="cardPwd" id="postcode" type="password" placeholder="Card Pwd" class="form-control" >
                                  <span class="input-group-addon bg-success"><i class="fa fa-map-marker fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>

						 <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">BusinessNum</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                  <input name="businessNum" autocomplete="on" type="text" placeholder="BusinessNum" class="form-control" required>
                                  <span class="input-group-addon label-danger"><i class="fa fa-user fa-lg text-white"></i></span>
                                </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="industry">Industry</label>
                            <div class="col-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon label-danger"><i class="fa fa-briefcase fa-lg text-white" required></i></span>
                                <select id="industry" class="form-control">
                                  <option value="" selected disabled>Choose One:</option>
                                  <option value="Accountancy">Accountancy</option>
                                  <option value="Agricultural">Agricultural</option>
                                  <option value="Automotive">Automotive</option>
                                </select>
                              </div>
                              </div>
                            </div>
                        
                            
                            <p style="display:inline;" class="small col-xs-9 col-sm-offset-2 col-sm-7 text-SI-grey">this is a block of copy for you to write some blurb.</p>
                            <button class="btn btn-primary nextBtn1 col-xs-3 pull-right" type="button" onclick="memberCheck()" >Next Step <i class="fa fa-angle-double-right"></i> </button>
                        </div>
                    </div>
                  
                    <!-- Wizard STEP 1 END -->
                    
                    <!-- Wizard STEP 2 -->
                    <div class="row setup-content" id="step-2">
                        <div class="col-sm-12">
                    
                          <div class="form-group">
                            
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="textinput">Requirements</label>
									<div class="col-sm-10">
										<div class="input-group">
										<textarea readonly="readonly" rows="6" placeholder="What additional specifics do you require?" class="form-control" required>
1. 회원의 주소 또는 e-mail주소에 도달함으로써 회사의 통지는 유효하고, 회원 정보의 변경/미 변경에 대한 책임은 회원에게 있음. (제8조)
2. 약관이 정하는 부정거래 행위를 한 회원에 대하여 제재 조치 가능 예: 직거래, 경매 부정행위, 시스템 부정행위, 결제 부정행위, 재판매 목적의 거래행위 등. (제36조)
3. 딜러시크는 통신판매중개자로서 판매자와 구매자와의 거래에 관한 분쟁에 개입하지 않으며 어떠한 보증 및 책임도 부담하지 않음.(제6조, 제38조)
										</textarea>
										   <div>
		    <input id="check1" type="checkbox">&nbsp;위 약관에 동의합니다.<br>
		    </div>	
										  <span class="input-group-addon bg-success"><i class="fa fa-list-ol fa-lg text-white"></i></span>
										</div>
									</div>
								</div>
								
											<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="textinput">Requirements</label>
									<div class="col-sm-10">
										<div class="input-group">
										<textarea readonly="readonly" rows="6" placeholder="What additional specifics do you require?" class="form-control" required>
1. 회원의 주소 또는 e-mail주소에 도달함으로써 회사의 통지는 유효하고, 회원 정보의 변경/미 변경에 대한 책임은 회원에게 있음. (제8조)
2. 약관이 정하는 부정거래 행위를 한 회원에 대하여 제재 조치 가능 예: 직거래, 경매 부정행위, 시스템 부정행위, 결제 부정행위, 재판매 목적의 거래행위 등. (제36조)
3. 딜러시크는 통신판매중개자로서 판매자와 구매자와의 거래에 관한 분쟁에 개입하지 않으며 어떠한 보증 및 책임도 부담하지 않음.(제6조, 제38조)
										</textarea>
										   <div>
		    <input id="check2"  type="checkbox">&nbsp;위 약관에 동의합니다.<br>
		    </div>	
										  <span class="input-group-addon bg-success"><i class="fa fa-list-ol fa-lg text-white"></i></span>
										</div>
									</div>
								</div>
								
											<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="textinput">Requirements</label>
									<div class="col-sm-10">
										<div class="input-group">
										<textarea readonly="readonly" rows="6" placeholder="What additional specifics do you require?" class="form-control" required>
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
										   <div>
		    <input id="check3"  type="checkbox">&nbsp;위 약관에 동의합니다.<br>
		    </div>	
										  <span class="input-group-addon bg-success"><i class="fa fa-list-ol fa-lg text-white"></i></span>
										</div>
									</div>
								</div>
								
		
								<p style="display:inline;" class="small col-xs-9 col-sm-offset-2 col-sm-7">this is a block of copy for you to write some blurb.</p>
								<button class="btn btn-primary nextBtn2 col-xs-3 pull-right" type="button" onclick="return checkBox();" >Next Step <i class="fa fa-angle-double-right"></i> </button>
							</div>
						</div>
					</div>
                    <!-- Wizard STEP 2 END -->
                    
                    <!-- Wizard STEP 3 -->
                    <div class="row setup-content" id="step-3">
                      <div class="col-sm-12">
                      
                          <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                            
                            <hr>
                            
                                <div class="list-inline">
                                    <input type="file"  name="upload" class="boxTF" style="height: 20px; width: 480px;">
                                </div>
                                
                                <div class="row">
                                    <i class="fa fa-info-circle fa-3x half-top text-danger col-xs-2"></i>
                                    <p class="small col-xs-10">add some blurb here to explain the above process</p>
                                </div>
                                
                            <hr>
                            
							<div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10 clearfix">
                                <div class="row">
                                  <div class=" col-sm-8">
                                    <p>add recapatcha here
                                    <!--<div class="g-recaptcha modal-recaptcha" data-sitekey="recapatcha key here"></div>-->
                                  </div>

                                  <!-- SUBMIT FORM BUTTON-->
                                  <div class="col-sm-4 pull-right">
                                    <button type="submit" value="submit" class="btn btn-block btn-success" onclick="return memberOk();">Send</button>
                                  </div>
                                  <!-- SUBMIT FORM BUTTON END-->
                                </div>
                            </div>
                          </div>
							
                            </div>
                          </div> 
								                            
                          <hr>
                          
                          <div class="col-xs-12">
                            <div class="row" style="margin-top:-20px;">
                                <div class="col-sm-3"><h3>SHARE <i class="fa fa-angle-double-right"></i></h3></div>
                                <div class="pull-right col-sm-9 add-top">Add your share code here</div>
                            </div>
                          </div>
                          
						</div>
                      </div>
                    <!-- Wizard STEP 3 END -->
                </fieldset><!-- form contents END -->
            </form>
</div>
        </div>

        