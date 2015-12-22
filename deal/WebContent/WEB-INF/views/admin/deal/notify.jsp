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
                                    <h2><i class="fa fa-child fa-2x"></i>딜 신고 관리</h2>
                                    <div class="title_right">           

<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                         
                         <form name="searchForm" action="" method="post">  
                            	     <select name="searchKey" class="selectField pull-left" style="height:32px; border-radius:20px;">
                            	     <option value="num">딜번호</option>
					                  <option value="subject">딜제목</option>
					                  <option value="userId">ID</option>
					                  <option value="created">작성일</option>
					                   <option value="notifyCreated">신고일</option>
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
                                               
                                                <th class="column-title">딜번호 </th>
                                                <th class="column-title">딜제목</th> <!-- 딜제목누르면 그 해당딜로 가게 하면 될듯 -->
                                                <th class="column-title">아이디 </th>
                                                <th class="column-title">작성일 </th>
                                                <th class="column-title">신고일 </th>
                                                <th class="column-title">신고이유 </th>
                                                
                                </tr>
                            </thead>

                            <tbody>         
                            <tr class="even pointer">
                                    <td class="a-center ">
                                    <td class=" ">23</td>
                                    <td class=" ">[전국]크리스피크림도넛지금사용가능 50%할인 </td>
                                    <td class=" ">ysh3254</td>
                                    <td class=" ">2015-12-16</td>
                                     <td class=" ">2015-12-18</td>
                                     <td class=" ">사기죄</td>
                                 </tr>
                                    <tr class="even pointer">
                                    <td class="a-center ">
                                    <td class=" ">16</td>
                                    <td class=" ">로픈 바오밥 大특가바디상품 증정 이벤트!  </td>
                                    <td class=" ">kjseng032</td>
                                    <td class=" ">2015-12-01</td>
                                     <td class=" ">2015-12-09</td>
                                     <td class=" ">딜러태도불량</td>
                                 </tr>
                                    <tr class="even pointer">
                                    <td class="a-center ">
                                    <td class=" ">41</td>
                                    <td class=" ">플레시크, 지금 특가중!고객만족 사은이벤트! </td>
                                    <td class=" ">kmcchan21</td>
                                    <td class=" ">2015-11-19</td>
                                     <td class=" ">2015-12-15</td>
                                     <td class=" ">사기죄</td>
                                 </tr>
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
   

   