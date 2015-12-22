<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<c:forEach var="dto" items="${replyList}">
 <li class="comment">
                        <a class="pull-left" href="#">
                            <img class="img-circle" src="${dto.imageFilename}" style="width:60px;height:59px;" alt="avatar">
                            
                        </a>
                        <div class="comment-body">
                            <div class="comment-heading">
                               <h5 class="time pull-right"><span data-livestamp="${dto.created}"></span></h5><h4 class="user">${dto.userId}</h4>
                               
                            </div>
                            <p style="word-break:break-all;margin-left:40px;">${dto.content}</p>
                        </div>
                   <!--      <ul class="comments-list">
                            <li class="comment">
                                <a class="pull-left" href="#">
                                    <img class="avatar" src="http://bootdey.com/img/Content/user_3.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Ryan Haywood</h4>
                                        <h5 class="time">3 minutes ago</h5>
                                    </div>
                                    <p>Relax my friend</p>
                                </div>
                            </li> 
                            <li class="comment">
                                <a class="pull-left" href="#">
                                    <img class="avatar" src="http://bootdey.com/img/Content/user_2.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Gavino Free</h4>
                                        <h5 class="time">3 minutes ago</h5>
                                    </div>
                                    <p>Ok, cool.</p>
                                </div>
                            </li> 
                        </ul> -->
                    </li>
                    </c:forEach>
                    
                      <c:if test="${dataCount==0}">
					   		등록된 게시물이 없습니다.
					   </c:if>
					   <c:if test="${dataCount!=0}">
					   		${pageIndexList}
					   </c:if>