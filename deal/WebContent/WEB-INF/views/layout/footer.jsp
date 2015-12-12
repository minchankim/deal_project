<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>

   		   <footer>
                    <div class="footer col-xs-12 col-sm-12 col-md-12">
				<a href="<%=cp%>/profile/myDealProfile.do">회사소개</a>&nbsp;&nbsp;&nbsp;<span> | </span>
				&nbsp;&nbsp;&nbsp;<a href="">제휴제안</a>&nbsp;&nbsp;&nbsp;<span> | </span>
				&nbsp;&nbsp;&nbsp;<a href="">이용약관</a>&nbsp;&nbsp;&nbsp;<span> | </span>
				&nbsp;&nbsp;&nbsp;<a href="<%=cp%>/profile/myDealLocation.do">오시는길</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <p class="pull-right"> 
                            <span class="lead"> <i class="fa fa-user"></i> Dealer Chic!</span>
                        </p>
                    </div>
                    <div class="clearfix"></div>


          </footer>