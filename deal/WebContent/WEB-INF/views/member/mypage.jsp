<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("UTF-8");
%>
<%
String birth = "1991-11-04";
String sanum = "191919191919";
String num1 = "1234";
String num2 = "1234";
String num3 = "1234";
String num4 = "1234";
%>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
   <div class="right_col" role="main">
   
  <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2><i class="fa fa-child fa-2x"></i>정보수정<small>내 정보를 확인하세요</small></h2>
                                    
                                    <div class="clearfix"></div>
                                </div>



<div style="min-height: 450px;">
		
		<div style="margin: 20px auto 10px; width:90%; min-height: 400px;">
		
           	<form name="memberForm" method="post">
				<table style="width:100%; margin: 0px auto; border-collapse: collapse; border-spacing: 0;">

				<tr height="2"><td colspan="2" bgcolor="#507CD1"></td></tr>
	
				<tr height="35">

				
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					아&nbsp;이&nbsp;디
					</td>
					<td align="left" style="padding-left: 5px;">
						admin
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
					<tr height="2"><td colspan="2" bgcolor="#507CD1"></td></tr>
				<tr height="30">


					<tr height="2"><td colspan="2" bgcolor="#507CD1"></td></tr>
				</table>
				<table style="width:100%; margin: 0px auto; border-collapse: collapse; border-spacing: 0;">
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					이&nbsp;&nbsp;&nbsp;&nbsp;름
					</td>
					<td align="left" style="padding-left: 5px;">
						어드민
					</td>
				</tr>
				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
			
			
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					생년월일
					</td>
					<td align="left" style="padding-left: 5px;">
						<input type="text" name="birth" size="25" maxlength="20"  class="boxTF" 
										value="<%=birth %>" />
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
						<tr height="2"><td colspan="2" bgcolor="#507CD1"></td></tr>
					<tr height="30">
						<tr height="2"><td colspan="2" bgcolor="#507CD1"></td></tr>
				
				</table>
				
				
				
				
				<table style="width:100%; margin: 0px auto; border-collapse: collapse; border-spacing: 0;">
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					사업자 번호
					</td>
					<td align="left" style="padding-left: 5px;">
						<input type="text" name="userName" size="25" maxlength="20"  class="boxTF" 
										value="<%=sanum %>"/>
					</td>
				</tr>

				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
			
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					카드번호
					</td>
					<td align="left" style="padding-left: 5px;">
							  <select name="selectEmail" onchange="changeEmail();">
									<option value="">카드사 선택</option>
									<option >신한</option>
									<option >농협</option>
									<option >롯데</option>
									<option >삼성</option>
									<option >하나</option>
									<option >우체국</option>
									<option >국민</option>
									<option >시티</option>
							  </select>
							  <input type="text" size="8" maxlength="30"  class="boxTF" value="<%=num1%>"> -
							  <input type="text" size="8" maxlength="30"  class="boxTF" value="<%=num2%>"> -
							  <input type="text" size="8" maxlength="30"  class="boxTF" value="<%=num3%>"> -
							  <input type="text" size="8" maxlength="30"  class="boxTF" value="<%=num4%>">
					</td>
				</tr>
				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
				
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					결제번호
					</td>
					<td align="left" style="padding-left: 5px;">
							
							  <input type="text" name="tel2" size="5" maxlength="4"  class="boxTF" />

					</td>

				</tr>
				<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
				
				<tr height="35">
					<td width="100" align="left" bgcolor="#E6E6E6" style="padding-left: 10px;" >
					캐&nbsp;&nbsp;&nbsp;&nbsp;쉬
					</td>
					<td align="left" style="padding-left: 5px;">
					10000원
					<input type="button" value="캐쉬충전" style="margin-left: 30px;">
					</td>
				
				</tr>
				
				
						<tr height="2"><td colspan="2" bgcolor="#507CD1"></td></tr>
					<tr height="30">
						<tr height="2"><td colspan="2" bgcolor="#507CD1"></td></tr>
				
				</table>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<table style="width:100%; margin: 0px auto; border-collapse: collapse; border-spacing: 0;">
				
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
			
				<tr height="60" >
					<td align="center" colspan="2" style="padding-top: 8px">
						

							<input type="button" value=" 정보수정 " class="btn" onclick="memberOk();"/>
							<input type="reset" value=" 다시입력 " class="btn" onclick="document.memberForm.userId"/>
							<input type="button" value=" 수정취소 " class="btn" onclick="javascript:location.href='<%=cp%>';"/>

					</td>
				</tr>

				</table>
			</form>
		
		</div>

	</div>
	
	</div>
	
	</div>
	</div>
	