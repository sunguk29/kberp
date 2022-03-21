<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 영업일정</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 캘린더 스크립트 추가 -->
<!-- Fullcalendar css -->
<link rel="stylesheet" type="text/css" href="resources/script/fullcalendar/fullcalendar.css" />
<!-- Moment Script -->
<script type="text/javascript" src="resources/script/jquery/moment.js"></script>
<!-- Fullcalendar Script -->
<script type="text/javascript" src="resources/script/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="resources/script/fullcalendar/locale-all.js"></script>
<!-- 캘린더 스크립트 추가 끝 -->
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}
/* 개인 작업 영역 */
.body {
	display: block;
	background-color: white;
	width: 1013px;
	height: 100%;
	margin: auto;
}

.bodyWrap {
	display: block;
	background-color: white;
	width: 927px;
	height: 100%;
	margin: 40px auto;
}
/* 개인 작업 영역 */
.sc_title {
	width: 925px;
	height: 48px;
	border: 1px solid #000;
	background-color: #F2F2F2;
	font-size: 16px;
	font-weight: bold;
	line-height: 48px;
}
.bg {
	margin-top: 9px;
}
.sc_title_bot {
	width: 927px;
	height: 50px;
	margin-top: 10px;
	margin-bottom: 25px;
}
.sc_content {
	width: 927px;
	height: 400px;
}
.calendar {
	display: inline-block;
	vertical-align: top;
	width: 600px;
	height: 398px;
	border: 1px solid #000;
}
.content_bot {
	width: 600px;
	height: 30px;
	font-size: 15px;
	line-height: 30px;
	text-align: center;
}
.calendar_text {
	display: inline-block;
	vertical-align: top;
	width: 317px;
	height: 279px;
	margin-left: 7px;
}
.lead_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #FFC107;
	border-radius: 3px;
}
.lead_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #FFC107;
	border-radius: 3px;
}
.so_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #4B94F2;
	border-radius: 3px;
}
.pers_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #66BB6A;
	border-radius: 3px;
}
.lead_cal_big {
	width: 30px;
	height: 30px;
	background-color: #FFC107;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}
.sales_cal_big {
	width: 30px;
	height: 30px;
	background-color: #4B94F2;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}
.nrml_cal_big {
	width: 30px;
	height: 30px;
	background-color: #66BB6A;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}
.so_cal_big {
	width: 30px;
	height: 30px;
	background-color: #4B94F2;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}
.pers_cal_big {
	width: 30px;
	height: 30px;
	background-color: #66BB6A;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}
.lead_cal_big:hover, .so_cal_big:hover, .pers_cal_big:hover {
	cursor: pointer;
}
.marg {
	margin-left: 30px;
	margin-right: 120px;
}
.boxsize {
	width: 158px;
	height: 25px;
	outline: none;
}
.textsize {
	width: 150px;
	height: 19px;
	outline: none;
}
.cal_text_top {
	width: 312px;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	line-height: 30px;
	border: none;
	background-color: #BDBDBD;
	background-image: url(resources/images/sales/today.png);
	background-size: 20px 20px;
	background-repeat: no-repeat;
	background-position: 0px center;
}
.cal_text1 {
	width: 317px;
	height: 82px;
	border-bottom: 1px dotted #616161;
	background-color: #EEEEEE;
}
.cal_text2 {
	width: 338px;
	height: 82px;
	border-bottom: 1px dotted #616161;
	background-color: #EEEEEE;
}
.cal_text3 {
	width: 338px;
	height: 82px;
	background-color: #EEEEEE;
	border-bottom: 1px dotted #616161;
	background-color: #EEEEEE;
}
.imgsize {
	display: inline-block;
	vertical-align:top;
	width: 30px;
	height: 30px;
}
.newcalsize {
	width: 48px;
	height: 48px;
	float: right;
}
.newcalsize:hover {
	cursor: pointer;
}
.text_left {
	display: inline-block;
	vertical-align: top;
	width: 82px;
	height: 82px;

}
.text_right {
	display: inline-block;
	vertical-align: top;
	width: 235px;
	height: 82px;
	white-space: pre;
	font-size: 12px;
}
.text_right:hover {
	cursor: pointer;
}
.userseach {
	display: inline-block;
	vertical-align: middle;
	width: 260px;
	height: 32px;
	line-height: 32px;
}
#usrsrchTxt{
	width:  170px;
	background-image: url(resources/images/sales/usericon.png);
	background-size: 20px 20px;
	background-repeat: no-repeat;
	background-position: 155px center;
}
.userseach:hover {
	cursor: pointer;
}
.userseach:active {
	outline: 1px solid #000;
}
.userIcon2 {
	width: 20px;
	height: 20px;
	
}
/* 풀캘린더 관련 속성 */
#fullCalendarArea {
	font-size: 11pt;
}
/* 팝업 속성 시작 조회영역 */
.popup_title_mid {
	width: calc(100% + 20px);
	height: 70px;
	margin: -10px 0px 0px -10px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
}
.ptm_left {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 70px;
}
.ptm_left_top, .ptm_left_bot {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}
.ptm_mid {
	display: inline-block;
	vertical-align: top;
	width: 150px;
	height: 70px;
}
.ptm_mid_top, .ptm_mid_bot {
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.sel_size {
	width: 130px;
	height: 25px;
	outline: none;
}
.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 240px;
	height: 70px;
}
.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 240px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.text_size {
	width: 230px;
	height: 19px;
	outline: none;
}
.ptm_right {
	display: inline-block;
	vertical-align: top;
	width: 94px;
	height: 100%;
}
.ptm_right_top {
	width: 94px;
	height: 32px;
	text-align: center;
}
.ptm_right_bot {
	width: 94px;
	height: 32px;
	margin-top: 5px;
	text-align: center;
}
/* 팝업 내용 */
.popup_cc_box_left {
   display: inline-block;
   vertical-align: top;
   width: 120px;
   height: 50px;
}
.popup_cc_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
   line-height: 50px;
}
.popup_box_in {
   width: calc(100% - 4px);
   height: 50px;
   border: 2px solid #d7d7d7;
   border-radius: 3px;
   background-color: #F2F2F2;
   margin-bottom: 5px;
}
.popup_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
.company {
   display: inline-block;
   width: 42px;
   height: 25px;
   background-image: url("resources/images/sales/usericon.png");
   background-size: 42px 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.boldname{
	margin-left: 30px;
	font-weight: bold;
}
.mg_wid {
	margin-left: 50px;
}
/* 팝업 내용 배경색 */
.pc_back {
	background-color: #fff;
}

/* 팝업 페이징 */
.board_bottom2 {
	height: 30px;
	position: relative;
	text-align: right;
	background-color: #fff;
	padding-bottom: 5px;
}
/* 팝업 속성  */
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();
	
	/* 목록 조회용  */
	function reloadList() {
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "salesSchdlAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawList(res.list);
			},
			error : function(req) {
				console.log(req.responseTxt);
			}
		});
	}
	
	/* 목록 그리기용  */
	function drawList(list) {
		var html = "";

		html += "<input type=\"text\" class=\"cal_text_top\" readonly=\"readonly\" value=\"      ${tday}\" />";
		
		for(var data of list){
			html +=	"<div class=\"cal_text1\">";
			html += "<div class=\"text_left\">";
			if(!data.lNum == ""){
				html +=	"<div class=\"lead_cal_big\"></div>";			
			} else if(!data.sNum == ""){				
				html +=	"<div class=\"sales_cal_big\"></div>";
			} else {				
				html +=	"<div class=\"nrml_cal_big\"></div>";
			}
			html +=	"</div>";
			html +=	"<div class=\"text_right\"><br/>" + data.START_DATE_HR + " ~ " + data.END_DATE_HR + "<br/>" + data.CLNT_CMPNY_NAME + "</div>";
			html += "</div>";
		}
		
		$(".calendar_text").html(html);
	}
	
	/* 캘린더 이벤트 관련 시작 */
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
			left: '',
	        center: 'prev, title, next',
	        right : ''
	      },
	      locale: "ko",
	      editable: false,
	      height: 400,
	      events: data,
	      eventClick: function(event) { // 이벤트 클릭
	    	  alert(event.start);
	      },
	      dayClick: function(date, js, view) { // 일자 클릭
	    	  alert('Clicked on: ' + date.format());

	    	  //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

	    	  //alert('Current view: ' + view.name);
	      }
	});
	
	
	/* 캘린더 이벤트 관련 끝 */
	
	/* 검색 밑 등록 버튼 관련 이벤트 시작  */
	$("#usrsrchTxt").on("click", function() {
		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
		html += "<div class=\"ptm_left\">";
		html += "<div class=\"ptm_left_top\">팀분류</div>";
		html +=	"<div class=\"ptm_left_bot\">사원분류</div>";		
		html += "</div>";
		html += "<div class=\"ptm_mid\">";
		html +=	"<div class=\"ptm_mid_top\">";
		html +=	"<select class=\"sel_size\">"
		html +=		"<option>영업1팀</option>";
		html +=		"<option>영업2팀</option>";
		html +=		"<option>영업3팀</option>";
		html +=	"</select>";
		html +=	"</div>";		
		html +=	"<div class=\"ptm_mid_bot\">";
		html +=	"<select class=\"sel_size\">";
		html +=		"<option>사원번호</option>";
		html +=		"<option>사원명</option>";
		html +=	"</select>";
		html +=	"</div>";	
		html += "</div>";
		html += "<div class=\"ptm_mid_right\">";
		html +=	"<div class=\"ptm_mid_right_top\"></div>";
		html +=	"<div class=\"ptm_mid_right_bot\">";
		html +=	"<input type=\"text\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" />";
		html +=	"</div>";
		html += "</div>";
		html += "<div class=\"ptm_right\">";
		html +=	"<div class=\"ptm_right_top\"></div>";
		html +=	"<div class=\"ptm_right_bot\">";
		html +=	"<div class=\"cmn_btn\">검색</div>";
		html +=	"</div>";
		html +=	"</div>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html +=	"<div class=\"popup_box_in\">";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span class=\"company\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	"17824<span class=\"boldname\">김길동 / 대리</span>";
		html +=	"<span class=\"mg_wid\">영업1팀</span>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"<div class=\"popup_box_in\">";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span class=\"company\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	"17824<span class=\"boldname\">김길동 / 대리</span>";
		html +=	"<span class=\"mg_wid\">영업1팀</span>";
		html +=	"</div>";
		html +=	"</div>";
		html += "<div class=\"board_bottom2\">";
		html +=	"<div class=\"pgn_area\">";
		html +=	"<div class=\"page_btn page_first\">first</div>";
		html +=	"<div class=\"page_btn page_prev\">prev</div>";
		html +=	"<div class=\"page_btn_on\">1</div>";
		html +=	"<div class=\"page_btn\">2</div>";
		html +=	"<div class=\"page_btn\">3</div>";
		html +=	"<div class=\"page_btn\">4</div>";
		html +=	"<div class=\"page_btn\">5</div>";
		html +=	"<div class=\"page_btn page_next\">next</div>";
		html +=	"<div class=\"page_btn page_last\">last</div>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "담당자 조회",
			draggable : true,
			contents : html,
			width : 600,
			height : 500,
			buttons : [{
				name : "등록",
				func:function() {
					console.log("등록하시겠습니까?");
					closePopup();
				}
			},{
					name : "취소"	
			}]
		});
		
	});
	
	$("#regBtn").on("click", function() {
		$("#actionForm").attr("action", "salesSchdlReg");
		$("#actionForm").submit();
	});
	
	/* 검색 밑 등록 버튼 관련 이벤트 끝 */
	
});
</script>
<!-- calendar Script -->
<script type="text/javascript" src="resources/script/calendar/calendar.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	showCalendar(d.getFullYear(),(d.getMonth() + 1));
});
</script>

<!-- calendar select script -->
<script type="text/javascript">
$(document).ready(function() {
	$.datepicker.setDefaults({
		monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear:true,
		showOn: 'button',
		closeText: '닫기',
		buttonImage: 'resources/images/calender.png',
		buttonImageOnly: true,
		dateFormat: 'yy/mm/dd'    
	}); 
	
	$("#date_start").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
			var startDate = parseInt($("#date_end").val().replace("-", '').replace("-", ''));
			var endDate = parseInt(dateText.replace(/-/g,''));
			
            if (endDate > startDate) {
            	alert("조회 기간은 과거로 설정하세요.");
            	//달력에 종료 날짜 넣어주기
        		$("#date_start").val($("#stdt").val());
			} else {
				$("#stdt").val($("#date_start").val());
			}
		}
	});
	
	$("#date_end").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
			var startDate = parseInt($("#date_start").val().replace("-", '').replace("-", ''));
			var endDate = parseInt(dateText.replace(/-/g,''));
			
            if (startDate > endDate) {
            	alert("조회 기간은 과거로 설정하세요.");
            	//달력에 종료 날짜 넣어주기
        		$("#date_end").val($("#eddt").val());
			} else {
				$("#eddt").val($("#date_end").val());
			}
		}
	});
	
});
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="tday" value="${tday}" />
</form>
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
			<div class="page_title_text">영업일정</div>
			<!-- 검색영역 선택적 사항 -->
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
					<div class="bodyWrap">
						<div class="sc_title">
						<span class="marg">
						팀분류
						<select class="boxsize">
							<option selected="selected">선택안함</option>
							<option>영업1팀</option>
							<option>영업2팀</option>
							<option>영업3팀</option>
						</select>
						</span>
						<span class="userseach">
								담당자 <input type="text" id="usrsrchTxt" readonly="readonly" />
						</span>
						<div class="cmn_btn bg">검색</div>
						</div>
						<div class="sc_title_bot">
							<img alt="일정등록" src="resources/images/sales/newcal.png" class="newcalsize" id="regBtn" />
						</div>
						<div class="sc_content">
							<div class="calendar">
								<div id="fullCalendarArea"></div>
							</div>
							<div class="calendar_text"></div>
						</div>
						<div class="content_bot">
							<div class="lead_cal"></div>
							리드
							<div class="so_cal"></div>
							영업
							<div class="pers_cal"></div>
							개인
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>