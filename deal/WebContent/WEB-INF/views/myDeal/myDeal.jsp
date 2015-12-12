<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 


  					 <div class="right_col" role="main">
   							<div class="clearfix"></div>
   
                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">참여 딜 목록</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">찜한 딜 목록</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">올린 딜 목록</a>
                                                </li>
                                            </ul>
                                            <div id="myTabContent" class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                    <!-- start 참여 딜 -->
                                                     <table class="data table table-striped no-margin">
                                                        <thead>
                                                            <tr>
                                                                 <th>
                                                    				참여 일자
                                              					 </th>
                                                                <th>참여 상품 정보</th>
                                                                <th>총 결제 금액</th>
                                                                <th class="hidden-phone">상태</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr valign="middle">
                                                                <td class="a-center " ><br>
                                                 				  2015-11-12<br>
                                                 				  (2015111201)<br>
                                                 				  <a href="#" class="btn btn-primary btn-xs">&nbsp; 딜 상세보기&nbsp; </a><br>
                                                                	 <a href="#" class="btn btn-default btn-xs">&nbsp;&nbsp;영수증발급&nbsp;&nbsp;</a>
                                              				  </td>
                                                                <td>
                                                              	  <img src="<%=cp%>/res/images/food1.jpg" class="mydealavatar2" alt="Avatar">
                                                           			 <div class="message_wrapper">
                                                               		 <h4 class="heading">VIPS 피자 베이컨포테이토,마르게리타 4개×2세트</h4>
                                                               		 <br><br><br>
                                                                	<div class="cam">참여 기간 : 2015. 11. 03 ~ 2015. 11.30</div>
                                                                
                                                            </div></td>
                                                                <td><br><br><b>15,000원</b></td>
                                                                <td class="hidden-phone"><br><br>
                                                                	딜 성공<br>
                                                                	 <a href="#" class="btn btn-danger btn-xs">딜 조회</a>
                                                                </td>
                                                                
                                                          		
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <!-- end 참여 딜 -->

                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                                                    <!-- start 찜한 딜 -->
                                                    <table class="data table table-striped no-margin">
                                                        <thead>
                                                            <tr>
                                                                 <th>
                                                    				<input type="checkbox" class="tableflat">
                                              					 </th>
                                                                <th>상품 정보</th>
                                                                <th>남은 시간</th>
                                                                <th class="hidden-phone">참여</th>
                                                                <th>인원수</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="a-center ">
                                                 				   <input type="checkbox" class="tableflat">
                                              				  </td>
                                                                <td>
                                                              	  <img src="<%=cp%>/res/images/food1.jpg" class="mydealavatar2" alt="Avatar">
                                                           			 <div class="message_wrapper">
                                                               		 <h4 class="heading">VIPS 피자 베이컨포테이토,마르게리타 4개×2세트</h4>
                                                                	<b>15,000원</b><br><span class="zzim"> 무료배송 </span>
                                                                
                                                            </div></td>
                                                                <td><br>D-18<br>2015. 11. 30</td>
                                                                <td class="hidden-phone"><br><br>
                                                                	<a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Join </a>
                                                                	 <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                                                </td>
                                                                
                                                          		<td class="project_progress"><br><br>
                                                    				<div class="progress progress_sm">
                                                      				  <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="57"></div>
                                                  					  </div>
                                                  					  <small>57% Complete</small>
                                                				</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <!-- end 찜한 딜-->

                                                </div>
                                                <!-- start 올린 딜 -->
                                                <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">                                
                                                  <table width="400px">
                                                  	<tr>
                                                  		<td colspan="3">
                                                  			<img src="<%=cp%>/res/images/food1.jpg" class="mydealavatar3" alt="Avatar"></td>
                                                  	</tr>
                                                  	<tr>
                                                  		<td  colspan="2">
                                                  			<a class="uptitle">VIPS 피자 4개×2세트</a> 
                                                  		</td>
                                                  		<td align="right" width="60px">
                                                  			<br><br>
                                                  			<b class="zzim">무료배송</b>
                                                  		</td>
                                                  	</tr>
                                                  	<tr>
                                                  		<td colspan="2" width="100px">
                                                  			<b class="dealchicga">딜러시크가</b>	<b>15,000원</b>	
                                                  		</td>
                                                  		<td align="right" width="150px" ><font color="#DB0000">200</font>명 참여</td>
                                                  	</tr>
                                                  	<tr>
                                                  		<td colspan="3" bgcolor="#D5D5D5" height="1px"></td>
                                                  	</tr>
                                                  	
                                                  </table>
                                                </div>
                                                <!-- end 올린 딜 -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
      
    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
        </ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>

    <script src="js/bootstrap.min.js"></script>

    <!-- chart js -->
    <script src="js/chartjs/chart.min.js"></script>
    <!-- bootstrap progress js -->
    <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- icheck -->
    <script src="js/icheck/icheck.min.js"></script>

    <script src="js/custom.js"></script>

    <!-- image cropping -->
    <script src="js/cropping/cropper.min.js"></script>
    <script src="js/cropping/main.js"></script>

    
    <!-- daterangepicker -->
    <script type="text/javascript" src="js/moment.min.js"></script>
    <script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>
    <!-- moris js -->
    <script src="js/moris/raphael-min.js"></script>
    <script src="js/moris/morris.js"></script>
    <script>
        $(function () {
            var day_data = [
                {
                    "period": "Jan",
                    "Hours worked": 80
                },
                {
                    "period": "Feb",
                    "Hours worked": 125
                },
                {
                    "period": "Mar",
                    "Hours worked": 176
                },
                {
                    "period": "Apr",
                    "Hours worked": 224
                },
                {
                    "period": "May",
                    "Hours worked": 265
                },
                {
                    "period": "Jun",
                    "Hours worked": 314
                },
                {
                    "period": "Jul",
                    "Hours worked": 347
                },
                {
                    "period": "Aug",
                    "Hours worked": 287
                },
                {
                    "period": "Sep",
                    "Hours worked": 240
                },
                {
                    "period": "Oct",
                    "Hours worked": 211
                }
    ];
            Morris.Bar({
                element: 'graph_bar',
                data: day_data,
                xkey: 'period',
                hideHover: 'auto',
                barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                ykeys: ['Hours worked', 'sorned'],
                labels: ['Hours worked', 'SORN'],
                xLabelAngle: 60
            });
        });
    </script>
    <!-- datepicker -->
    <script type="text/javascript">
        $(document).ready(function () {

            var cb = function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                //alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
            }

            var optionSet1 = {
                startDate: moment().subtract(29, 'days'),
                endDate: moment(),
                minDate: '01/01/2012',
                maxDate: '12/31/2015',
                dateLimit: {
                    days: 60
                },
                showDropdowns: true,
                showWeekNumbers: true,
                timePicker: false,
                timePickerIncrement: 1,
                timePicker12Hour: true,
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                opens: 'left',
                buttonClasses: ['btn btn-default'],
                applyClass: 'btn-small btn-primary',
                cancelClass: 'btn-small',
                format: 'MM/DD/YYYY',
                separator: ' to ',
                locale: {
                    applyLabel: 'Submit',
                    cancelLabel: 'Clear',
                    fromLabel: 'From',
                    toLabel: 'To',
                    customRangeLabel: 'Custom',
                    daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                    monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                    firstDay: 1
                }
            };
            $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
            $('#reportrange').daterangepicker(optionSet1, cb);
            $('#reportrange').on('show.daterangepicker', function () {
                console.log("show event fired");
            });
            $('#reportrange').on('hide.daterangepicker', function () {
                console.log("hide event fired");
            });
            $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
                console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
            });
            $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
                console.log("cancel event fired");
            });
            $('#options1').click(function () {
                $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
            });
            $('#options2').click(function () {
                $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
            });
            $('#destroy').click(function () {
                $('#reportrange').data('daterangepicker').remove();
            });
        });
    </script>
    <!-- /datepicker -->
   
   
