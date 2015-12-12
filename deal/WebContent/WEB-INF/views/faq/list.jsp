<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
  
   <div class="right_col" role="main">
   
 	 <div class="col-md-12 col-sm-12 col-xs-12">
     	<div class="x_panel">
        	<div class="x_title">
             	<h2><i class="fa fa-child fa-2x"></i>FAQ<small> 자주 묻는 질문 </small></h2>
		        <div class="clearfix"></div>
            </div>

            <div class="x_content">
            	<div class="col-md-10 col-sm-10 col-xs-10">
                	<div class="panel-group accordion" id="accordion">
                        
                        <c:forEach var="dto" items="${list}">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${dto.num}">
                                        <i class="switch fa fa-plus"></i>
                                       ${dto.subject}
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse${dto.num}" class="panel-collapse collapse">
                            <c:if test="${dto.content==null}">
                            	<div class="panel-body" style="color: red;">"해당 게시물의 답글이 아직 작성되지 않았습니다."</div>
                            </c:if>
                            <c:if test="${dto.content!=null}">
                             	<div class="panel-body">${dto.content}</div>
                            </c:if>
                            </div>
                        </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
         </div>
       </div>

    </div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
        