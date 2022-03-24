<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP Sample</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- Fullcalendar css -->
<link rel="stylesheet" type="text/css" href="resources/script/fullcalendar/fullcalendar.css" />

<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
	font-size: 11pt;
}
/* 개인 작업 영역 */
#my_fclt_rsrv_row{
	width: 946px;
	font-size: 11pt;
	text-align: end;
	margin-bottom: 10px;
}
#my_fclt_rsrv_btn{
	padding: 5px;
}
.page_srch_area{
	text-align: left;
}
#calendar{
	display: inline-block;
	vertical-align: top;
	width: 500px;
	height: 200px;
	margin: 0px 40px;
}
#fclt_list{
	display:inline-block;
	font-size: 12pt;
	width: 551px;
	height: 365px;
	border: 1px solid #DDD;
	overflow: auto;
	vertical-align: top;
}
.fclt_row{
	margin:10px 20px;
}
.fclt_name{
	display:inline-block;
	border: 1px solid #444;
	width: 350px;
	height: 25px;
	text-align: center;
}
.fclt_place{
	display:inline-block;
	border: 1px solid #444;	
	width: 250px;
	height:25px;
	text-align: center;
}
.srch_sel{
	min-width:0px;
	width: 86px;
}

#cont_top{
	width:1400px;
}
#cont_bottom{
	margin:30px 0px 100px 0px;
	width: 553px;
	height: 200px;
	border: 1px solid #DDD;
}
.cmn_btn_mr{
	font-weight: bold;
	margin: 8px 0 0 16px;
	padding: 5px 36px;
}
.rsrv_time:active{
	background-color: #F2B705;
}

.srch_text_wrap input{
	margin-bottom: 4px;
}
#fclt_list_head{
	background-color: #f2f2f2;
}
</style>
<!-- Moment Script -->
<script type="text/javascript" src="resources/script/jquery/moment.js"></script>


<!-- Fullcalendar Script -->
<script type="text/javascript" src="resources/script/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="resources/script/fullcalendar/locale-all.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var data = [
        {
            title: 'All Day Event',
            start: '2019-01-01',
            color : 'yellow', // 기타 옵션들
			textColor : 'black',
          },
          {
            title: 'Long Event',
            start: '2019-01-07',
            end: '2019-01-10'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2019-01-09T16:00:00'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2019-01-16T16:00:00'
          }
        ];
	
	$("#fullCalendarArea").fullCalendar({
		header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay,listMonth'
	      },
	      defaultDate: '2019-01-12',
	      locale: "ko",
	      editable: false,
	      height: 600,
	      events: data,
	      dayClick: function(date, js, view) { // 일자 클릭
	    	  //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

	    	  //alert('Current view: ' + view.name);
	      }
	});

});

function drawList(list){
	var html = "";
	
	for(var data of list){
		html += "<tr>";
		html += "<td>" + data.FCLTY_NAME + "</td>";
		html += "<td>" + data.PLACE + "</td>";
	}
	$("tbody").html(html);
	
}
</script>

</head>
<body>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">시설물 사용 신청</div>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="gbn" name="gbn"/>
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
			
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div id = "cont_top">
				<div id="fclt_list">
					<table class="board_table">
				<colgroup>
					<col width="150"/>
					<col width="400"/>
					<col width="100"/>
				</colgroup>
				<thead id="fclt_list_head">
					<tr>
						<th id="fclt_list_title">시설물 목록</th>
						<th colspan="2">
									<select class="srch_sel">
											<option>시설물명</option>
											<option>위치</option>
									</select>
										<div class="srch_text_wrap">
											<input type="text" />
										</div>
										<div class="cmn_btn_ml">검색</div>
						</th>
						
					</tr>
				</thead>
				<tbody>
					
				</tbody>
					</table>
				</div>
				<div id = calendar>
					<input type="hidden" id="stdt" name="stdt" value="${stdt}" />
					<input type="hidden" id="eddt" name="eddt" value="${eddt}" />
					
					<div id="fullCalendarArea"></div>
				</div>
			</div>
			<div id ="cont_bottom">
				<div class="rsrv_row">
					<div class="cmn_btn_mr">09:00 ~ 10:00</div>
					<div class="cmn_btn_mr">10:00 ~ 11:00</div>
					<div class="cmn_btn_mr">11:00 ~ 12:00</div>
					<div class="cmn_btn_mr">12:00 ~ 13:00</div>
					<div class="cmn_btn_mr">13:00 ~ 14:00</div>
				</div>
				<div class="rsrv_row">
					<div class="cmn_btn_mr">14:00 ~ 15:00</div>
					<div class="cmn_btn_mr">15:00 ~ 16:00</div>
					<div class="cmn_btn_mr">16:00 ~ 17:00</div>
					<div class="cmn_btn_mr">17:00 ~ 18:00</div>
					<div class="cmn_btn_mr">18:00 ~ 19:00</div>
				</div>

			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>