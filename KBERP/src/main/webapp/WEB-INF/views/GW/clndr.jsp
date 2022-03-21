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
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap { 
	width: 900px;
}
/* 개인 작업 영역 */

/* 팝업 */
.popup_style{
	height: 30px;
	margin-top: 20px;
	margin-bottom: 15px;
	margin-left: 30px;
	font-size: 9pt;
}

.slct_type{
	width: 100px;
	height: 30px;
	position: absolute;
	left: calc(50% - 140px);
	font-size: 9pt;
}
.star{
	font-size: 9pt;
	color: blue;
}
#schdl_title, #schdl_place {
	position: absolute;
	left: calc(50% - 140px);
	width: 360px;
	height: 25px;
	font-size: 9pt;
}
#schdl_start_time, #schdl_end_time{
	position: absolute;
	left: calc(50% - 140px);
	width: 160px;
	height: 25px;
	text-align: center;
	font-size: 9pt;
}

.popup_time{
	position: absolute;
	left: calc(50% + 45px);
	width: 177px;
	height: 27px;
	font-size: 9pt;
	text-align: center;
}
.popup_dtl_cont{
	vertical-align:top;
	width: 475px;
	height: 160px;
	font-size: 9pt;
	margin-bottom: 15px;
	margin-left: 30px;
}
.dtl_cont{
	display: inline-block;
	vertical-align: top;
	position: absolute;
	left: calc(50% - 140px);
	font-size: 9pt;
	resize: none;
	width: 360px;
	height: 150px;
}
#ctgry_user{
	display:none;
	position: absolute;
	left: calc(50% - 20px);
	font-size: 9pt;
	width: 130px;
	height: 25px;
}
#allday{
	position: absolute;
	left: calc(50% - 145px);
	font-size: 9pt;
	width: 17px;
	height: 17px;
}

#fullCalendarArea {
	font-size: 11pt;
	position:absolute;
	top: 155px;
	left: 170px;
	display:inline-block;
	width: 1000px;
	height: 600px;
}
.fc-sat { 
	color:#002AFF;
 }      
.fc-sun{
	color:#E31B23; 
	}     


#side_bar{
	position:absolute;
	top: 200px;
	width: 150px;
	height: 550px;
	border: 1px solid #000;
}
#new_schdl{
	position:absolute;
	top: 140px;
	width: 152px;
	height: 40px;
}

.schdl_type {
	width: 130px;
	height: 120px;
	margin: 10px;
	border-bottom: 1px solid silver;
}
.schdl_ctgry{
	width: 130px;
	height: 265px;
	margin: 10px;
	border-bottom: 1px solid silver;
}
.today{
	width: 130px;
	height: 120px;
	margin: 10px;
}
.side_bar_title{
	font-size: 12pt;
	margin: 10px 0 5px 12px;
}
.type_box, .ctgry_box{
	margin: 8px;
}
.type_label{
	font-size: 10pt;
}

.today > div{
	width: 130px;
	height: 100px;
}
.today > div > div{
	margin-bottom: 5px;
	font-size: 9pt;
	border: 1px solid #000;
	padding: 5px;
}
.today_schdl{
	margin-top: 15px;
}
.get_tgthr{
	background-color: #e9e1f4;
}
.bsns{
	background-color: #add8d3;

}

.schdl_ctgry>label:hover, #new_schdl:hover,
.schdl_type>label:hover {
	
	cursor: pointer;
}
</style>
<!-- Fullcalendar css -->
<link rel="stylesheet" type="text/css" href="resources/script/fullcalendar/fullcalendar.css" />

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
          },
          {
        	  title: '풀캘린더 적용',
              start: '2022-03-17',
              color : '#BFA0ED',
			  textColor : 'black',
            },
        ];
	
	$("#fullCalendarArea").fullCalendar({
		header: {
	        left: 'prevYear,prev,next,nextYear today',
	        center: 'title',
	        right: 'month,agendaWeek,listMonth'
	      },
	      locale: "ko",
	      editable: false,
	      height: 600,
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
	
	$("#eventChangeBtn").on("click", function() {
		var newEvents = [ {
			title : "계획1",
			start : "2019-01-02",
			end : "2019-01-08",
			color : 'yellow', // 기타 옵션들
			textColor : 'black',

		}, {
			title : "계획2",
			start : "2019-01-02",
			end : "2019-01-08",
			color : 'green', // 기타 옵션들
			textColor : 'black',
		} ];
		
		var oldEvents = $("#fullCalendarArea").fullCalendar("getEventSources");
		//기존 이벤트 제거
		$("#fullCalendarArea").fullCalendar("removeEventSources", oldEvents);
		$("#fullCalendarArea").fullCalendar("refetchEvents");
		//신규이벤트 추가
		$("#fullCalendarArea").fullCalendar("addEventSource", newEvents);
		$("#fullCalendarArea").fullCalendar("refetchEvents");
	});
	
	
});
function checkEmpty(sel) {
	if($.trim($(sel).val()) == ""){
		return true;
	} else {
		return false;
	}
}

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
	$("#new_schdl").on("click", function () {
		var html = "";
		
		html += "<form action=\"#\" id=\"addForm\" method=\"post\">";
		html += "<input type=\"hidden\" id=\"emp_num\" name=\"emp_num\" value=\"${sEmpNum}\">";
		html += "<div class=\"popup_style\">";
		html += "<span>일정 종류</span><span class=\"star\"> *</span>";
		html += "<select class=\"slct_type\" id=\"schdl_type\" name=\"schdl_type\">";
		html += "<option value=\"0\">개인</option>";
		html += "<option value=\"1\">팀</option>";
		html += "<option value=\"2\">전사</option>";
		html += "</select>";
		html += "</div>";
		html += "<div class=\"popup_style\">";
		html += "<span>제목</span><span class=\"star\"> *</span>";
		html += "<input type=\"text\" id=\"schdl_title\" name=\"schdl_title\">";
		html += "</div>";
		html += "<div class=\"popup_style\">";
		html += "<span>위치</span>";
		html += "<input type=\"text\" id=\"schdl_place\" name=\"schdl_place\">";
		html += "</div>";
		html += "<div class=\"popup_style\">";
		html += "<span>시작 시간</span>";
		html += "<input type=\"date\" id=\"schdl_start_time\" name=\"schdl_start_time\"> <input type=\"time\" class=\"popup_time\">";
		html += "</div>";	
		html += "<div class=\"popup_style\">";
		html += "<span>종료 시간</span>";
		html += "<input type=\"date\" id=\"schdl_end_time\" name=\"schdl_end_time\"> <input type=\"time\"class=\"popup_time\">";			
		html += "</div>";
		html += "<div class=\"popup_dtl_cont\">";
		html += "<span>상세내용</span>";
		html += "<textarea rows=\"10\" cols=\"57\" class=\"dtl_cont\" id=\"schdl_cont\" name=\"schdl_cont\"></textarea>";			
		html += "</div>";
		html += "<div class=\"popup_style\">";
		html += "<span>범주</span><span class=\"star\"> *</span>";
		html += "<select class=\"slct_type\" id=\"schdl_ctgry\" name=\"schdl_ctgry\">";
		html += "<option value=\"1\">전체</option>";
		html += "<option value=\"2\">업무</option>";
		html += "<option value=\"3\">휴가</option>";
		html += "<option value=\"4\">교육</option>";
		html += "<option value=\"5\">회의</option>";
		html += "<option value=\"6\">회식</option>";
		html += "<option value=\"7\">출장</option>";
		html += "<option value=\"8\">개발</option>";
		html += "<option value=\"0\">사용자지정</option>";
		html += "</select>";
		html += "<input type=\"text\" placeholder=\"사용자 지정\"id=\"ctgry_user\" name=\"ctgry_user\">";
		html += "</div>";
		html += "<div class=\"popup_style\">";
		html += "<span>종일 일정</span>";
		html += "<input type=\"checkbox\" id=\"aldy_dvsn\" name=\"aldy_dvsn\" value=\"1\">";		
		html += "<input type=\"hidden\" id=\"aldy_dvsn_hidden\" name=\"aldy_dvsn\" value=\"0\">";		
		html += "</div>";
		html += "</form>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "일정등록",
			contents : html,
			width : 540,
			height : 620,
			buttons : [{
				name : "저장",
				func:function() {
					if(checkEmpty("#schdl_title")){
						alert("제목을 입력하세요.");
						$("#schdl_title").focus();
					}else if(checkEmpty("#schdl_start_time")){
						alert("시작 시간을 선택하세요.");
						$("#schdl_start_time").focus();
					}else if(checkEmpty("#schdl_end_time")){
						alert("종료 시간을 선택하세요.");
						$("#schdl_end_time").focus();
					}else{
						var params = $("#addForm").serialize();
						console.log(params);
						$.ajax({
							type: "post", 
							url : "clndrAction/insert",
							dataType : "json",
							data : params, 
							success : function(res) { 
								if(res.res == "success"){
									location.href = "clndr";
								}else{
									alert("작성중 문제가 발생하였습니다.");
								}
							},
							error : function(request, status, error) { 
								console.log(request.responseText); 
							}
						});
					}
				}
			
			}, {
				name : "취소"
			}]
		});
		
		
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
			<div class="page_title_text">프로젝트 관리</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->			
			<input type="button" value="일정 등록" id="new_schdl">
	<div id="side_bar">
		<div class="schdl_type">
			<h5 class="side_bar_title">일정</h5>
			<input type="checkbox" class="type_box" id="solo"><label for="solo" class="type_label">개인 일정</label><br>
			<input type="checkbox" class="type_box" id="team"><label for="team" class="type_label">팀 일정</label><br>
			<input type="checkbox" class="type_box" id="all"><label for="all" class="type_label">전사 일정</label>
			
		</div>
		<div class="schdl_ctgry">
			<h5 class="side_bar_title">범주</h5>
			<input type="checkbox" class="ctgry_box" id="bsns"><label for="bsns" class="type_label">업무</label><br>
			<input type="checkbox" class="ctgry_box" id="leave"><label for="leave" class="type_label">휴가</label><br>
			<input type="checkbox" class="ctgry_box" id="edctn"><label for="edctn" class="type_label">교육</label><br>
			<input type="checkbox" class="ctgry_box" id="mtng"><label for="mtng" class="type_label">회의</label><br>
			<input type="checkbox" class="ctgry_box" id="get_tgthr"><label for="get_tgthr" class="type_label">회식</label><br>
			<input type="checkbox" class="ctgry_box" id="bsns_trip"><label for="bsns_trip" class="type_label">출장</label><br>
			<input type="checkbox" class="ctgry_box" id="devel"><label for="devel" class="type_label">개발</label><br>
			<input type="checkbox" class="ctgry_box" id="user_dsgnt"><label for="user_dsgnt" class="type_label">사용자 지정</label>
			
			
		</div>
		
		<div class="today">		
			<h5 class="side_bar_title">오늘 할 일</h5>
			<div class="today_schdl">
			</div>
		</div>
		
	</div>
			<div id="fullCalendarArea"></div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>