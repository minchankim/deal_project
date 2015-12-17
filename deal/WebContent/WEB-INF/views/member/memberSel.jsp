<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("UTF-8");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<div class="right_col" role="main">


 <div class="col-md-12 col-sm-12 col-xs-12">
 		<div class="x_panel">
                                <div class="x_title">
                                    <h2><i class="fa fa-child fa-2x"></i>회원가입<small>딜러시크와 함께해요.</small></h2>
		  <div class="title_right">    
		  <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
		  </div>
		  </div>
		    <div class="clearfix"></div>
		
		   <div class="x_content">


			</div>
		
		<button onclick="javascript:location.href='<%=cp%>/member/member.do'">일반 회원가입</button>
		<button onclick="javascript:location.href='<%=cp%>/member/member3.do'">사업자 회원가입</button>


				</div>
				
				<div> 
	
	
	
	
		</div>
	</div>
			
			
			
		</div>
		

</div>

