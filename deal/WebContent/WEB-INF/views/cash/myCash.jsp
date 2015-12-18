<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
/* $('#cashModal').on('show.bs.modal', function (e) {
	  if (!data) return e.preventDefault() // stops modal from being shown
	})	 */
	
	function cashForm() {
		$("#userId").val("");
		$('#cashmodal').modal('show');
		
		
	}
	
	function chargeCash(){
		var cash=$.trim($("#cashPrice").val());
		var cardNum=$.trim($("#cardNumber").val());
		var cvcNum=$.trim($("#cardCVC").val());
		
		
		if(! cash){
			alert("충전할 금액을 입력해 주세용!!!!!!!!!!!");
			$("#letterContent").focus();
			return false;
		 }
		if(! cardNum){
			alert("카드번호를 입력해주세요");
			$("#cardNumber").focus();
			return false;
		 }
		if(! cvcNum){
			alert("등록하신 결제 비빌번호를 입력해주세요");
			$("#cardCVC").focus();
			return false;
		 }
		
		var url="<%=cp%>/cash/insertCash.do";
		var params="userId="+userId+"&cash="+cash;
		$.ajax({
			type:"POST",
			url:url,
			data:params,
			dataType:"json",
			success:function(data){
				var isLogin=data.isLogin;
				if(isLogin=="false") {
					location.href="<%=cp%>/member/member.do";
					return false;
				}
				$("#cashPrice").val("");
				var scash=data.scash;
				$("#myscash").html(scash);
					// 여기에 받는 유저아이디를 받아야한다.?
	    		alert("성공적으로 충전했습니다.");
			},
			error:function(e) {
	    		alert("충전과정 중 오류가 발생했습니다.");
	    	}
		});
		$('#cashmodal').modal('hide');
	}
	
	
	
	function refundForm(userId) {
		$("#userId").val("");
		$('#refundModal').modal('show');
	}
	
	
	function returnCash(){
		var account=$.trim($("#accoutNum").val());
		var account2=$.trim($("#accountName").val());
		var returnCash=$.trim($("#returnMoney").val());
		
		if(! account){
			alert("받으실 계좌의 번호를 입력바랍니다.");
			$("#accoutNum").focus();
			return false;
		 }
		if(! account2){
			alert("예금주 명을 입력해주세요");
			$("#accountName").focus();
			return false;
		 }
		if(! returnCash){
			alert("환전하실 금액을 입력해주세요");
			$("#returnMoney").focus();
			return false;
		 }
		
		var url="<%=cp%>/cash/returnCash.do";
		var params="userId="+userId+"&returnCash="+returnCash;
		$.ajax({
			type:"POST",
			url:url,
			data:params,
			dataType:"json",
			success:function(data){
				var isLogin=data.isLogin;
				if(isLogin=="false") {
					location.href="<%=cp%>/member/member.do";
					return false;
				}
				$("#returnMoney").val("");
				// 여기에 받는 유저아이디를 받아야한다.?
				var scash2=data.scash2;
				$("#myscash").html(scash2);
	    		alert("성공적으로 환전했습니다했습니다.");
			},
			error:function(e) {
	    		alert("환전과정 중 오류가 발생했습니다.");
	    	}
		});
		$('#refundModal').modal('hide');
	}
	
</script>

<style type="text/css">
 blockquote{
    border-left:none;

}

.quote-badge{
    background-color: rgba(0, 0, 0, 0.2);   
}

.quote-box{

    overflow: hidden;
    margin-top: -50px;
    padding-top: -100px;
    border-radius: 17px;
    background-color: white;
    margin-top: 25px;
    color:black;
    width: 325px;
    box-shadow: 2px 2px 2px 2px #930000;
    
}

.quote-text{
    
    font-size: 19px;
    margin-top: -65px;
}
#js{
	width: 700px;
}
</style>
   
  		 <div class="right_col" role="main">

                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>My Cash</h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                          
                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                            <div  class="x_panel">
                    
                              
                               
                                <div  class="x_content">

                                    <div  class="col-md-3 col-sm-3 col-xs-12 profile_left">

                                        <div class="profile_img">

                                            <!-- end of image cropping -->
                                            <div id="crop-avatar">
                                                <!-- Current avatar -->
                                                <div  class="avatar-view" title="Change the avatar">
                                                    <img src="<%=cp%>/res/images/picture.jpg" alt="Avatar">
                                                </div>


                                              
                                            </div>
                                            <!-- end of image cropping -->

                                        </div>
                                       

                                        <ul class="list-unstyled user_data">
                                           
                                           
                                        </ul>
                                      
                                        <br/>

                                        
							<div class="clearfix"></div>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-12">

                                        <div style="height: 280px" class="x_panel">
                            <div class="x_title">
                                <h2>충전/사용/철회내역</h2>
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
                            </div>
                            <div class="x_content">

                                <div  class="bs-example" data-example-id="simple-jumbotron">
                                    <div  class="jumbotron" style="margin-bottom:0px; padding:0px; padding-bottom:8px;">
                                        <p>&nbsp;&nbsp;
                                         
                                         <input type="button" class="btn btn-primary" value="충전하기" onclick="cashForm('userId');" >
                                          <input type="button" class="btn btn-primary" value="환전하기"  onclick="refundForm('userId');" ></p><br>
                                     	<p style="font-size: 13pt">캐시를 이용하여 사이트에서 진행되는 딜에 참여할 수 있습니다<br>캐시 충전은 카드를 이용하여 충전할 수 있습니다.</p>
                                        
                                      
                                         
                                </div>

                            </div>
                        </div>
                                </div>

                            </div>
                            <div class="clearfix"></div>
                            
                            

</div>
</div>
										<div class="" role="tabpanel" data-example-id="togglable-tabs">
 											<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <li role="presentation" class="active"><a href="#listcash1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">충전내역</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#listcash2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">사용/철회내역</a>
                                           		</li>
                                           		<li role="presentation" class=""><a href="#listcash3" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">캐시 환급내역</a>
                                           		</li>	
                                           		<div class="pull-right">
                                           	   		1년까지만 조회가능
                                           		</div>
                                       
                                            </ul>
                                            <div class="pull-right" style="margin-bottom: 10pt">
                                          <div style="float: left;">
                                           <select style="width: 100px" class="form-control">
                                                    <option>2015</option>
                                                    <option>2014</option>
                                              </select>
                                              </div>
                                              	<div style="float: left; font-size: 16pt" >년</div>
                                              
                                          
                                              <div style="float: left;">
                                               <select style="width: 100px" class="form-control">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                    <option>6</option>
                                                    <option>7</option>
                                                    <option>8</option>
                                                    <option>9</option>
                                                    <option>10</option>
                                                    <option>11</option>
                                                    <option>12</option>
                                              </select>
                                         
                                           </div>
                                             		 <div style="float: left; font-size: 16pt">월</div>
                                          
                                           </div>
                                           
                                           <div id="cashTabContent" class="tab-content">
                                           <div role="tabpanel" class="tab-pane fade active in" id="listcash1" aria-labelledby="home-tab">
                                           <!-- 충전내역 -->

                                    <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                               
                                              
                                                <th class="column-title">충전날짜 </th>
                                                <th class="column-title">충전캐시 </th>
                                                <th class="column-title">충전수단 </th>
                                                <th class="column-title">상태 </th>
                                                
                               	 			 </tr>
                            </thead>

                            <tbody>
                        <c:forEach var="dto" items="${list1}">
                             <tr>
                                
                                    <td class=" ">${dto.created}</td>
                                    <td class=" ">${dto.cash}<i class="success fa fa-long-arrow-up"></i></td>
                                    <td class=" ">신용카드</td>
                                    <td class=" ">정상충전</td>
                            </tr>
                         </c:forEach>
                                   
                             </tbody>

                                    </table>
                                </div>
                                    <!-- end 캐시 사용/충전내역 -->      
                                     <div role="tabpanel" class="tab-pane fade" id="listcash2" aria-labelledby="profile-tab">
                                            <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                             
                                                <th class="column-title">번호 </th>
                                                <th class="column-title">날짜 </th>
                                                <th class="column-title">캐시 </th>
                                                <th class="column-title">상태 </th>
                                                <th class="column-title">Amount </th>
                                			</tr>
                           				 </thead>
												
                           					 <tbody>
                                 <tr>
                                    <td class=" ">1</td>
                                    <td class=" ">2015.12.11 </td>
                                    <td class=" ">3000 <i class="success fa fa-long-arrow-down"></i></td>
                                    <td class=" ">스타벅스커피 결제</td>
                                    <td class="a-right a-right ">12000</td>
                            </tr>
                            <tr>
                                    <td class=" ">2</td>
                                    <td class=" ">2015.12.12 </td>
                                    <td class=" ">33500 <i class="success fa fa-long-arrow-down"></i></td>
                                    <td class=" ">한우</td>
                                    <td class="a-right a-right ">18000</td>
                            </tr>
                             <tr>
                                    <td class=" ">3</td>
                                    <td class=" ">2015.12.14 </td>
                                    <td class=" ">22000 <i class="success fa fa-long-arrow-down"></i></td>
                                    <td class=" ">제주귤</td>
                                    <td class="a-right a-right ">17000</td>
                            </tr>
                             <tr>
                                    <td class=" ">4</td>
                                    <td class=" ">2015.12.15 </td>
                                    <td class=" ">3500 <i class="success fa fa-long-arrow-down"></i></td>
                                    <td class=" ">스타벅스커피</td>
                                    <td class="a-right a-right ">12000</td>
                            </tr>
                                          
                                            </tbody>

                                    </table>
                                           
                                           
                                       </div>
                                       <!--사용/철회내역 end -->
                                       
                                       <!-- 환불내역  start-->
                                        <div role="tabpanel" class="tab-pane fade" id="listcash3" aria-labelledby="profile-tab">
                                        
                                            <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                            
                                                <th class="column-title">환전날짜 </th>
                                                <th class="column-title">환급캐시 </th>
                                                <th class="column-title">환급수단 </th>
                                                <th class="column-title">환급상태 </th>
                                             
                               				 </tr>
                            </thead>

                           					 <tbody>
                        		<c:forEach var="dto" items="${list2}">
                                     <tr>
                                    <td class=" ">${dto.returnDate}</td>
                                    <td class=" ">${dto.returnCash}<i class="success fa fa-long-arrow-down"></i></td>
                                    <td class=" ">계좌입금</td>
                                    <td class=" ">정상환전</td>
                           			 </tr>
                   				</c:forEach>
                                            </tbody>

                                    </table>
                                           
                                           
                                       </div>
                                           
                                           </div>
                                           </div>
                                 
                                 
					
                                </div>
                                 </div>
									  <!--충전하기 모달  -->
									  <div class="modal fade" id="cashmodal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									      <div class="container">
											    <blockquote id="js" class="quote-box">
											     
											    
											      <!-- CREDIT CARD FORM STARTS HERE -->
            <div class="panel panel-default credit-card-box">
                <div class="panel-heading display-table" >
                    <div class="row display-tr" >
                        <h3 class="panel-title display-td" >카드 결제</h3>
                        <div class="display-td" >                            
                            <img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
                        </div>
                    </div>                    
                </div>
                <div class="panel-body">
                   
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label for="cardNumber">카드 번호</label>
                                    <div class="input-group">
                                        <input 
                                      
                                            class="form-control"
                                            id="cardNumber"
                                            placeholder="하이픈(-)제거 후 입력"
                                            required autofocus 
                                        />
                                        <input type="hidden" id="userId">
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                       
                            <div class="col-xs-5 col-md-5 ">
                                <div class="form-group">
                                    <label for="cardCVC">결제 비밀번호</label>
                                    <input 
                                    
                                        class="form-control"
                                        type="password"
                                        id="cardCVC"
                                        placeholder="결제비밀번호  6자리 입력"
                                        required
                                    />
                                    <input type="hidden" id="userId">
                                </div>
                            </div>
                     <div class="col-xs-5 col-md-5 ">
                                <div class="form-group">
                                    <label for="couponCode">결제 금액</label>
                                     <input 
                                
                                        class="form-control"
                                        id="cashPrice"
                                        placeholder="1000원이상"
                                        required
                                    />
                               		<input type="hidden" id="userId">
                                </div>
                        </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                               <center>
                            <input type="button" class="btn btn-success" value="결제하기" onclick="chargeCash();"/>
                            	</center>
                            </div>
                        </div>
                        <div class="row" style="display:none;">
                            <div class="col-xs-12">
                                <p class="payment-errors"></p>
                            </div>
                        </div>
                  
                </div>
  
					     
											        <p class="blog-post-bottom pull-right">
											        <span>
											         <!-- 이거 설정버튼인데 밑에 드롭다운 메뉴 뜨는거야 -->
									      			  <span class="item-right">
                       										 <button class="btn btn-xs btn-danger pull-right" data-dismiss="modal">x</button>
                   									  </span>
											        </span>
											        </p>
											          </blockquote>
											        </div> 
											</div>
									    </div>
									  </div>
									  
									  <!--환전하기 모달  -->
									  <div class="modal fade" id="refundModal">
									  <div class="modal-dialog">
									      <div class="container">
											    <blockquote id="js" class="quote-box">
											    <span class="pull-right note_fontsize" >오늘날짜[현재시간]</span><!-- 보낸시간 뜨는거야 -->
											      
											      <p class="">
											      <!-- CREDIT CARD FORM STARTS HERE -->
            <div class="panel panel-default credit-card-box">
                <div class="panel-heading display-table" >
                    <div class="row display-tr" >
                        <h3 class="panel-title display-td" >회원계좌로 환전</h3>
                        <div class="display-td" >                            
                            <img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
                        </div>
                    </div>                    
                </div>
                <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="cardNumber">계좌 번호</label>
                                    <div class="input-group">
                                        <input 
                                            type="tel"
                                            class="form-control"
                                            id="accoutNum"
                                            placeholder="-(하이픈) 제거후 입력"
                                            autocomplete="cc-number"
                                            required autofocus 
                                        />
                                        <input type="hidden" id="userId">
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="cardExpiry">예금주</label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="accountName"
                                        placeholder="홍길동"
                                        autocomplete="cc-exp"
                                        required 
                                    />
                                    <input type="hidden" id="userId">
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label for="cardCVC">잔여캐시</label>
                                    <div
                                      
                                        class="form-control"
         								
                                    >${cdto}</div>
                                      <input type="hidden" id="userId">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="couponCode">환전금액</label>
                                    <input style="width: 300px" type="text" class="form-control" id="returnMoney"/>
                              		<input type="hidden" id="userId">
                              		
                                </div>
                            </div>                        
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <center>
 				<input type="button" class="btn btn-success" value="환전하기" onclick="returnCash();"/>                            	</center>
                            </div>
                        </div>
                        <div class="row" style="display:none;">
                            <div class="col-xs-12">
                                <p class="payment-errors"></p>
                            </div>
                        </div>
                </div>
            </div> 
			   
											        <p class="blog-post-bottom pull-right">
											        <span>
											         <!-- 이거 설정버튼인데 밑에 드롭다운 메뉴 뜨는거야 -->
									      			  <span class="item-right">
                       										 <button class="btn btn-xs btn-danger pull-right" data-dismiss="modal">x</button>
                   									  </span>
											        </span>
											        </p>
											        </blockquote>
											    
											</div>
									    </div>
									  </div>
									  
                              
                               
                                




