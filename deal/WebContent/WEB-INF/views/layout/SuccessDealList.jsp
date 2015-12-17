<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
 <c:forEach  var="dto" items="${sucdealList}">
                                   <li data-toggle="modal">
                                        <a href="#success" data-toggle="modal">
                                            <span class="image">
                                       ${dto.image1}
                                    		</span>
                                          
                                        <span style="word-break:break-all;width:200;text-overflow:ellipsis; overflow:hidden;">${dto.subject}</span> 
                                            <span class="time pull-right" ></span>
                                         
                                            <span class="time pull-right">
                                       			딜에 성공하였습니다!!!
                                    		</span>
                                        </a>
                                    </li>
                                    </c:forEach>