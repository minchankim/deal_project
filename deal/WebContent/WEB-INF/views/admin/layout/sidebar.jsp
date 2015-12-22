<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<style>
.site_title{
	color:#000000;
}
</style>
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">

                    <div class="navbar nav_title" style="border: 0;">
                        <a href="<%=cp%>/admin.do" class="site_title" style="text-align: center;">관리자</a>
                    </div>
                    <div class="clearfix"></div>

                   
                    <!-- /menu prile quick info -->

                    <br />

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

                        <div class="menu_section">
                            
                            <ul class="nav side-menu">
                                <li><a ><i class="glyphicon glyphicon-user"></i> 회원 관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="<%=cp%>/admin/member/memberList.do">회원 리스트</a>
                                        </li>
                                        <li><a href="<%=cp%>/admin/member/busiList.do">사업자 리스트</a>
                                        </li>
                                        <li><a href="<%=cp%>/admin/member/blackList.do">블랙 리스트</a>
                                        </li>  
                                    </ul>
                                </li>
                                <li><a><i class="glyphicon glyphicon-gift"></i> 딜 관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        </li>
                                        <li><a href="<%=cp%>/admin/deal/notify.do">딜 신고 관리</a>
                                        </li>
                                        <li><a href="<%=cp%>/admin/deal/side.do">슬라이드 관리</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="glyphicon glyphicon-usd"></i> 포인트&캐시 관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="<%=cp%>/admin/point/number.do">계좌 관리</a>
                                        </li>
                                        <li><a href="<%=cp%>/admin/point/refund.do">환불 관리</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="glyphicon glyphicon-bullhorn"></i> 고객센터 관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="<%=cp%>/admin/memCenter/notice.do">공지사항</a>
                                        </li>
                                        <li><a href="<%=cp%>/admin/memCenter/qna.do">Q&A</a>
                                        </li>
                                         <li><a href="<%=cp%>/admin/memCenter/faq.do">FAQ</a>
                                        </li>
                                    </ul>
                                </li>                               
                            </ul>
                        </div>
                       
                    <!-- /sidebar menu -->
                    
                    </div>
                    </div>
                </div>
 