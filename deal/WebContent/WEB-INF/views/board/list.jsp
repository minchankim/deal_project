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
	f.action="<%=cp%>/board/list.do";
	f.submit();
}
</script>


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 -->
 <%-- <%=cp%>/res/template/ --%>
<link href="<%=cp%>/res/template/css/icheck/flat/green.css" rel="stylesheet">
<link href="<%=cp%>/res/template/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">
<link href="<%=cp%>/res/template/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">
<%-- <script src="<%=cp%>/res/template/js/jquery.min.js"></script>
    --%>
   

   
   <div class="right_col" role="main">
   
   
<!--    <form name="searchForm" action="" method="post">
			              <select name="searchKey" class="selectField">
			                  <option value="subject">제목</option>
			                  <option value="userName">작성자</option>
			                  <option value="content">내용</option>
			                  <option value="created">등록일</option>
			            </select>
			            <input type="text" name="searchValue" class="boxTF"/>
			            <input type="button" value=" 검 색 " class="btn" onclick="searchList()"/>
			        </form> -->
   
  <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2><i class="fa fa-child fa-2x"></i>자유 게시판<small> 자유로운 의견을 올려주세요.</small></h2>
                                    <div class="title_right">           

<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                         <form name="searchForm" action="" method="post">  
                            	     <select name="searchKey" class="selectField pull-left" style="height:32px; border-radius:20px;">
					                  <option value="subject">제목</option>
					                  <option value="userName">작성자</option>
					                  <option value="content">내용</option>
					                  <option value="created">등록일</option>
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
                                                <th class="column-title">글 번호 </th>
                                                <th class="column-title">제목</th>
                                                <th class="column-title">작성자 </th>
                                                <th class="column-title">날짜 </th>
                                                <th class="column-title">조회수 </th>
                                                <!-- <th class="column-title">Amount </th>
                                                <th class="column-title no-link last"><span class="nobr">Action</span>
                                                </th>
                                                <th class="bulk-actions" colspan="7">
                                                    <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                            </th> -->
                                </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="dto" items="${list}">
                            
                                <tr class="even pointer">
                                    <td class="a-center ">
                                    <td class=" ">${dto.num}</td>
                                    <td class=" "><a href="${urlArticle}&num=${dto.num}">${dto.subject}</a></td>
                                    <td class=" ">${dto.userName}</td>
                                    <td class=" ">${dto.created}</td>
                                    <td class=" ">${dto.hitCount}</td>
                                   
                                 </tr>
                            </c:forEach>
                                      </tbody>
                                            

                                    </table>
                                    
                                            <div class="x_content" style="float: left">
                                    
                                    <a href="<%=cp%>/board/created.do"><button type="button" class="btn btn-dark">글쓰기</button></a>
                                    
                      <c:if test="${dataCount==0}">
					   		등록된 게시물이 없습니다.
					   </c:if>
					   <c:if test="${dataCount!=0}">
					   		${pageIndexList}
					   </c:if>
                                    
             <!--      <ul class="pagination">
					<li ><a href="#">«</a></li>
					<li class="active">
					<a href="#">1 <span class="sr-only">(current)</span></a></li>
					 <li><a href="#">»</a></li>
					</ul> -->
                               
                               
                               
                                </div>
                                
                                
                                </div>
                            </div>
                        </div>  
        </div>
        
        
        
          <script src="<%=cp%>/res/template/js/bootstrap.min.js"></script>
 
  <script src="<%=cp%>/res/template/js/progressbar/bootstrap-progressbar.min.js"></script>

  <script src="<%=cp%>/res/template/js/icheck/icheck.min.js"></script>
  <script src="<%=cp%>/res/template/js/custom.js"></script>
 
 


        <script>

        $(document).ready(function () {
            $('input.tableflat').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            });
        });

        var asInitVals = new Array();
        $(document).ready(function () {
            var oTable = $('#example').dataTable({
                "oLanguage": {
                    "sSearch": "Search all columns:"
                },
                "aoColumnDefs": [
                    {
                        'bSortable': false,
                        'aTargets': [0]
                    } //disables sorting for column one
        ],
                'iDisplayLength': 12,
                "sPaginationType": "full_numbers",
                "dom": 'T<"clear">lfrtip',
                "tableTools": {
                    "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                }
            });
            $("tfoot input").keyup(function () {
                /* Filter on the column based on the index of this element's parent <th> */
                oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
            });
            $("tfoot input").each(function (i) {
                asInitVals[i] = this.value;
            });
            $("tfoot input").focus(function () {
                if (this.className == "search_init") {
                    this.className = "";
                    this.value = "";
                }
            });
            $("tfoot input").blur(function (i) {
                if (this.value == "") {
                    this.className = "search_init";
                    this.value = asInitVals[$("tfoot input").index(this)];
                }
            });
        });
    
        </script>
        
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
   

   