<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<c:if test="${dataCountReply!=0}">
 <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row">
                        <c:forEach var="vo" items="${listReply}">
                            <div class="col-xs-2 col-md-1">
                               <img src="<%=cp%>/uploads/photo/${vo.imageFilename}" class="img-circle img-responsive" alt="" /></div>
                            <div class="col-xs-10 col-md-11">
                                <div>${vo.content}
                                    <div class="mic-info">
                                        By: <a href="#">${vo.userName}</a> ${vo.created}
                                    </div>
                                </div>
                                <div class="action">
                                    <button type="button" class="btn btn-primary btn-xs" title="Edit">
                                        <span class="glyphicon glyphicon-pencil"></span>답글
                                    </button>
                                    <button type="button" class="btn btn-success btn-xs" title="Approved">
                                        <span class="glyphicon glyphicon-ok"></span>
                                    </button>
                                    <c:if test="${sessionScope.member.userId==vo.userId ||  sessionScope.member.userId=='admin'}">
                                    <button type="button" class="btn btn-danger btn-xs" title="Delete" onclick='deleteReply("${vo.replyNum}", "${pageNo}");'>
                                    <span class="glyphicon glyphicon-trash"></span>
                                   
                                    </button>
                                    </c:if>
                                </div>
                            </div>
                            </c:forEach>
                            
                        </div>

                    </li>
               	<div height='30'>
                         ${pageIndexList}
                        </div>
                </ul>
                <a href="#" class="btn btn-primary btn-sm btn-block" role="button"><span class="glyphicon glyphicon-refresh"></span> More</a>
            </div>
</c:if>