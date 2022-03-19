<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업일정</title>
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
	width: 498px;
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
	width: 317px;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	line-height: 30px;
	background-color: #BDBDBD;
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
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 300,
			title : "버튼하나팝업",
			contents : "내용임",
			buttons : {
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
	});
	$("#btn2Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "버튼두개팝업",
			contents : "내용임",
			buttons : [{
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "둘닫기"
			}]
		});
	});
	
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
			<div class="page_title_text">일정</div>
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
								담당자
								<input type="text" id="usrsrchTxt" readonly="readonly" />
						</span>
						<div class="cmn_btn bg">검색</div>
						</div>
						<div class="sc_title_bot">
							<img alt="일정등록" src="resources/images/sales/newcal.png" class="newcalsize" />
						</div>
						<div class="sc_content">
							<div class="calendar">
								<div id="fullCalendarArea"></div>
							</div>
							<div class="calendar_text">
								<div class="cal_text_top">
								<img alt="오늘날짜" src="resources/images/sales/today.png" class="imgsize" />
								오늘날짜
								</div>
								<div class="cal_text1">
									<div class="text_left">
										<div class="lead_cal_big"></div>
									</div>
									<div class="text_right"><br/>10:00 ~ 11:30 방문/종합광고<br/>미래전자<br/>[진행중-제안]대출 상담 건</div>
								</div>
							</div>
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