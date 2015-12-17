<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<style>
body.nav-sm .nav.side-menu li a{
	height:60px;
	width:90px;
}

body.nav-sm ul.nav.child_menu{
	left:125%;
	border:2px solid red;
	width:180px;
}
.nav.side-menu> li.active > a{
	color:#e51b13;
	font-weight: bold;
	border:2px solid red;
}
</style>


            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">

                    <div class="navbar nav_title" style="border: 0;">
                        <a href="<%=cp%>/main.do" class="site_title" style="background: #ffffff"><img src="<%=cp %>/res/images/logosample.jpg" style="width:230px; height:55px; pull-left"></a>
                    </div>
                    <div class="clearfix"></div>

                   
                    <!-- /menu prile quick info -->

                    

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu" >

                        <div class="menu_section">
                            
                            <ul class="nav side-menu">
                                   <li><a style="text-align:center; height:40px;" href="<%=cp%>/deal/created.do"><i class="fa fa-plus"></i></a>
                         
                                </li>
                                <li><a ><i class="fa fa-male"></i> 의류/잡화 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="<%=cp%>/deal/manCloth.do">남성의류</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/womanCloth.do">여성의류</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/childCloth.do">유아동</a>
                                        </li>
                                         <li><a href="<%=cp%>/deal/accessaryCloth.do">악세사리</a>
                                        </li>
                                         <li><a href="<%=cp%>/deal/EtcCloth.do">잡화</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-heart"></i> 뷰티 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="<%=cp%>/deal/skinBeauty.do">스킨케어</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/makeupBeauty.do">메이크업</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/hairBeauty.do">헤어케어</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/bodyBeauty.do">바디케어</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/perfumeBeauty.do">향수</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-cutlery"></i> 식품 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none; ">
                                        <li><a href="<%=cp%>/deal/farmGrocery.do" style="width:180px;">농/수/축산 식품</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/processedGrocery.do">가공식품</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/healthGrocery.do" style="width:180px;">건강/다이어트 식품</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/childGrocery.do">유아동식품</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/waterGrocery.do">음료/음식</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-home"></i> 가구/생활 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="<%=cp%>/deal/cottonFurniture.do" style="width:180px;">침대/커튼/카페트</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/tableFurniture.do" style="width:180px;">책상/테이블/식탁</a>
                                        </li>
                                         <li><a href="<%=cp%>/deal/interiorFurniture.do" style="width:180px;">홈/인테리어/DIY</a>
                                        </li>
                                         <li><a href="<%=cp%>/deal/normalFurniture.do" style="width:180px;">생활/수납/욕실/청소</a>
                                        </li>
                                         <li><a href="<%=cp%>/deal/kitchenFurniture.do" style="width:180px;">주방/수입주방</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-car"></i> 레저/자동차 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="<%=cp%>/deal/sportsLeisure.do" style="width:180px;">스포츠용품</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/outdoorLeisure.do" style="width:180px;">등산/아웃도어</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/campingLeisure.do">캠핑/낚시</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/carLeisure.do">자동차용품</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/normalLeisure.do">레저용품</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-laptop"></i> 디지털/가전 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="<%=cp%>/deal/cameraDigital.do" style="width:180px;">카메라/악세사리</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/kitchenDigital.do">주방가전</a>
                                        </li>
                                         <li><a href="<%=cp%>/deal/lifeDigital.do">생활가전</a>
                                        </li>
                                         <li><a href="<%=cp%>/deal/pcDigital.do" style="width:180px;">노트북/데스크탑/PC부품</a>
                                        </li>
                                         <li><a href="<%=cp%>/deal/phoneDigital.do" style="width:180px;">휴대폰/악세사리</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-book"></i> 도서/취미 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="<%=cp%>/deal/normalBook.do" style="width:180px;">도서/음반/DVD</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/ticketBook.do" style="width:180px;">e쿠폰/상품권/이용권</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/travelBook.do" style="width:180px;">여행/숙박/항공</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/animalBook.do">반려동물용품</a>
                                        </li>
                                        <li><a href="<%=cp%>/deal/hobbyBook.do">문구/취미</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-map-marker"></i> 지역<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="tables.html">서울</a>
                                        </li>
                                        <li><a href="tables_dynamic.html" style="width:180px;">인천/경기/강원</a>
                                        </li>
                                        <li><a href="tables_dynamic.html">대구/부산</a>
                                        </li>
                                        <li><a href="tables_dynamic.html">대전/광주</a>
                                        </li>
                                        <li><a href="tables_dynamic.html">제주</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="menu_section">
                            <hr style="margin-left: 10%;">
                            <ul class="nav side-menu">
                                
                                
             
                                <li><a href="<%=cp%>/dealboard/list.do"><i class="fa fa-quote-left"></i> 가격흥정 </a>
                                    <ul class="nav child_menu" style="display: none">


                                    </ul>
                                </li>
                                     <li><a><i class="fa fa-bullhorn"></i> 고객센터 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                       
                                        <li><a href="<%=cp%>/notice/list.do">공지사항</a>
                                        </li>
                                        <li><a href="<%=cp%>/qna/list.do">QnA</a>
                                        </li>
                                        <li><a href="<%=cp%>/faq/faqList.do">FaQ</a>
                                        </li>

                                    </ul>
                                </li>
                                <li><a href="<%=cp%>/board/list.do"><i class="fa fa-pencil-square-o"></i> 자유게시판</a></li>
                               
                            </ul>
                        </div>

                    </div>
                        
                    <!-- /sidebar menu -->
                    
                    </div>
                    </div>
                
                    