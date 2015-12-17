<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
   
%>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/admin/member/memberList.do";
	f.submit();
}
</script>

<link href="<%=cp%>/res/template/css/icheck/flat/green.css" rel="stylesheet">
<link href="<%=cp%>/res/template/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">
<link href="<%=cp%>/res/template/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">
   
   <div class="right_col" role="main">
   
   
  <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2><i class="fa fa-child fa-2x"></i>사업자 리스트</h2>
                                    <div class="title_right">           

<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                         
                         <form name="searchForm" action="" method="post">  
                            	     <select name="searchKey" class="selectField pull-left" style="height:32px; border-radius:20px;">
					                  <option value="userName">회사명</option>
					                  <option value="userId">ID</option>
					                  <option value="email">이메일</option>
					                  <option value="busiNum">사업자번호</option>
					                  <option value="created">가입일</option>
			           				</select>
			           			 
			            
                                <div class="input-group"> 
                            <input type="text" name="searchValue"  class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button" onclick="searchList()" >Go!</button>
                   			     </span>
                   			      </div>     
                        
                          		   </form>
   
                                   </div>
                        </div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">

                                    <table class="table table-striped responsive-utilities jambo_table dataTable" aria-describedby="example_info">
                                        <thead>
                                            <tr class="headings">
                                                <th class="sorting_disabled">
                                                </th>
                                                <th class="column-title">회사명</th>
                                                <th class="column-title">아이디 </th>
                                                <th class="column-title">이메일 </th>
                                                <th class="column-title">사업자번호 </th>
                                                <th class="column-title">가입일 </th>
                                                <th class="column-title">탈퇴 </th>
                                                
                                </tr>
                            </thead>

                            <tbody>                            
                            <c:forEach var="dto" items="${busiList}">
                            
                                <tr class="even pointer">
                                    <td class="a-center ">
                                    <td class=" ">${dto.userName}</td>
                                    <td class=" ">${dto.userId}</td>
                                    <td class=" ">${dto.email}</td>
                                    <td class=" ">${dto.businessNum}</td>
                                    <td class=" ">${dto.created_date}</td>
                                    <td class=" "><a href="<%=cp%>"><button type="button" class="btn btn-dark"  style="pull-right; font-size: 8pt; height:18px; width: 50px; margin-bottom: 0px; margin-right: 0px; padding:0px;">탈퇴</button></a></td>
                                 </tr>
                            </c:forEach>
                                      </tbody>
                                            

                                    </table>                             
                                
                                </div>
                            </div>
                        </div>  
        </div>
        
        
        
          <script src="<%=cp%>/res/template/js/bootstrap.min.js"></script>
 
  <script src="<%=cp%>/res/template/js/progressbar/bootstrap-progressbar.min.js"></script>

  <script src="<%=cp%>/res/template/js/icheck/icheck.min.js"></script>
  <script src="<%=cp%>/res/template/js/custom.js"></script>
         
<style type="text/css">
.pagination{
	padding-left:33%;
}
.pagination>li>a, .pagination>li>span {
	 border-radius: 50% !important;
	 margin: 0 5px;
	 background: white;
	 color:black;
	 border-color:#e51b13;
}
.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover {
	 background: #e51b13;
	 color:white;
}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover{
	background: #e51b13;
	 color:white;
	 z-index:2;
	 cursor: default;
	 border-color:#e51b13;
	 
}
   </style>
   

   