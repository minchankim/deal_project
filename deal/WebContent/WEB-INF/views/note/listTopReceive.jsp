<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
								<c:forEach var="dto" items="${list}">
  									
  									<li>
                                        <a>
                                            <span class="image">
                                       <img class="media-object img-circle" src="<%=cp %>/res/images/park.jpg" >
                                    		</span>
                                            <span>
                                        <span>${dto.sendUserId}</span>
                                            <span class="time">${dto.sendDay}</span>
                                            </span>
                                            <span class="message">
                                       			
                                    </span>
                                        </a>
                                    </li>
                                    </c:forEach>