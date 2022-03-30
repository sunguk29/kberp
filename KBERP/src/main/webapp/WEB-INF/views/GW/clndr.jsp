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
#schdl_start_date, #schdl_end_date{
	position: absolute;
	left: calc(50% - 140px);
	width: 160px;
	height: 25px;
	text-align: center;
	font-size: 9pt;
}

#schdl_start_time, #schdl_end_time{
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
#user_ctgry{
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
	height: 450px;
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
	margin-top: 10px;
}
.get_tgthr{
	background-color: #e9e1f4;
}
.bsns{
	background-color: #add8d3;

}

.schdl_ctgry>label:hover, #new_schdl:hover,
.schdl_type>label:hover, .fc-content {
	
	cursor: pointer;
}
/* 상세일정 */
.dtl_schdl_title{
	font-size: 9pt;
	font-weight: 500;
}
.dtl_schdl_title h2{
	font-size: 17pt;
	font-weight: 500;
	position: absolute;
	top: calc(50% - 250px);
	left: calc(50% - 220px);
	display:inline-block;
	padding: 5px 40px 5px 40px;
	border: 1px solid #000;
}
.dtl_schdl_cont{
	position: absolute;
	top: calc(50% - 150px);
	left: calc(50% - 240px);
	width: 500px;
	height: 500px;
	font-size: 9pt;
}
.dtl_schdl_style{
	height: 30px;
	margin-top: 20px;
	margin-bottom: 15px;
	margin-left: 30px;
	font-size: 9pt;
}

.dtl_schdl_type{
	width: 100px;
	height: 25px;
	position: relative;
	left: calc(50% - 208px);
	font-size: 9pt;
}

#dtl_schdl_title, #dtl_schdl_place, #dtl_schdl_time {
	position: absolute;
	left: calc(50% - 140px);
	width: 360px;
	height: 25px;
	font-size: 9pt;
}
#dtl_schdl_start_time, #dtl_schdl_end_time{
	position: absolute;
	left: calc(50% - 140px);
	width: 160px;
	height: 25px;
	text-align: center;
	font-size: 9pt;
}

.dtl_schdl_time{
	position: absolute;
	left: calc(50% + 45px);
	width: 177px;
	height: 27px;
	font-size: 9pt;
	text-align: center;
}
.dtl_schdl_dtl_cont{
	vertical-align:top;
	width: 475px;
	height: 160px;
	font-size: 9pt;
	margin-top: 20px;
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

.dtl_schdl_btn {
	text-align: right;	
	font-size: 9pt;
}
.dtl_schdl_btn input{
	margin-left:5px;
	font-size: 9pt;
	width: 70px;
	height: 30px;
}


#dtl_ctgry{
	position: relative;
	left: 320px;
	top: 0px;
}
#dtl_schdl_ctgry{
	margin-left: 20px;
}
.schdl_ctgry div{
	border-radius: 12px;
	width: 12px;
	height: 12px;
	display: inline-block;
	margin-left: 3px;
}
#bsns_color,#bsns_schdl{
	background-color: #fb8484;
}
#leave_color,#leave_schdl{
	background-color: #ffb264;
}
#edctn_color,#edctn_schdl{
	background-color: #ffd352;
}
#mtng_color,#mtng_schdl{
	background-color: #66BB6A;
}
#get_tgthr_color,#get_tgthr_schdl{
	background-color: #2fc1af;
}
#bsns_trip_color,#bsns_trip_schdl{
	background-color: #76a7f7;
}
#devel_color,#devel_schdl{
	background-color: #4d75b5;
}
#user_dsgnt_color,#user_dsgnt_schdl{
	background-color: #a17fed;
}
#bsns_schdl,#leave_schdl,#edctn_schdl,#mtng_schdl,#get_tgthr_schdl,#bsns_trip_schdl,#devel_schdl,#user_dsgnt_schdl{
	display: block;
	border: none;
	white-space: nowrap;
	border-radius : 5px;
	text-align: center;
	text-overflow:ellipsis;
	overflow: hidden;
	width: 120px;
}
#devel_schdl,#bsns_trip_schdl,#user_dsgnt_schdl{
	color: white;
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
	var now = new Date();
	var clndrYear = now.getFullYear();	// 연도
	var clndrMonth =now.getMonth()+1;	// 월
	
	var Cdate = "";
	if(clndrMonth >= 10){
		Cdate = ""+clndrYear+ clndrMonth;
	}else{
		Cdate = ""+clndrYear+"0"+clndrMonth;
	}
	$('input[name=clndrDate]').attr('value',Cdate);
	reloadList();
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
	        left: 'prevYear,prev,next,nextYear today',
	        center: 'title',
	        right: 'month,agendaWeek,listMonth'
	      },
	      locale: "ko",
	      editable: false,
	      height: 600,
	      events: data,
	      eventClick: function(event) { // 이벤트 클릭
	    	  var params = $("#dtlForm").serialize();
	    	 
	    	  $.ajax({
					type: "post", 
					url : "dtlSchdl",
					dataType : "json",
					data : {id : event.id}, 
					success : function(res) { 
						 console.log(res);
						 drawList(res.dtl);
						 
					},
					error : function(request, status, error) { 
						console.log(request.responseText); 
					}
				});
	    	  
	    	  
	      },
	      dayClick: function(date, js, view) { // 일자 클릭
	    	 // alert('Clicked on: ' + date.format());
	    	  
	    	  //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

	    	 //alert('Current view: ' + view.name);
	    	 
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
	  		html += "<input type=\"date\" value=\"" + date.format() + "\"  id=\"schdl_start_date\" name=\"schdl_start_date\">";
	  		html += "<input type=\"time\" id=\"schdl_start_time\" name=\"schdl_start_time\">";
	  		html += "<input type=\"hidden\" id=\"hidden_start_time\" name=\"schdl_start_time\">";
	  		html += "</div>";	
	  		html += "<div class=\"popup_style\">";
	  		html += "<span>종료 시간</span>";
	  		html += "<input type=\"date\" value=\"" + date.format() + "\"  id=\"schdl_end_date\" name=\"schdl_end_date\">";			
	  		html += "<input type=\"time\" id=\"schdl_end_time\" name=\"schdl_end_time\">";
	  		html += "<input type=\"hidden\" id=\"hidden_end_time\" name=\"schdl_end_time\">";
	  		html += "</div>";
	  		html += "<div class=\"popup_dtl_cont\">";
	  		html += "<span>상세내용</span>";
	  		html += "<textarea rows=\"10\" cols=\"57\" class=\"dtl_cont\" id=\"schdl_cont\" name=\"schdl_cont\"></textarea>";			
	  		html += "</div>";
	  		html += "<div class=\"popup_style\">";
	  		html += "<span>범주</span><span class=\"star\"> *</span>";
	  		html += "<select class=\"slct_type\" id=\"schdl_ctgry\" name=\"schdl_ctgry\">";
	  		html += "<option value=\"0\">사용자지정</option>";
	  		html += "<option value=\"1\">업무</option>";
	  		html += "<option value=\"2\">휴가</option>";
	  		html += "<option value=\"3\">교육</option>";
	  		html += "<option value=\"4\">회의</option>";
	  		html += "<option value=\"5\">회식</option>";
	  		html += "<option value=\"6\">출장</option>";
	  		html += "<option value=\"7\">개발</option>";
	  		html += "</select>";
	  		html += "<input type=\"text\" placeholder=\"사용자 지정\"id=\"user_ctgry\" name=\"user_ctgry\">";
	  		html += "<input type=\"hidden\" id=\"hidden_user_ctgry\" name=\"user_ctgry\">";
	  		html += "</div>";
	  		html += "<div class=\"popup_style\">";
	  		html += "<span>종일 일정</span>";
	  		html += "<input type=\"checkbox\" id=\"aldy_dvsn\" name=\"aldy_dvsn\" value=\"1\">";		
	  		html += "<input type=\"hidden\" id=\"aldy_dvsn_hidden\" name=\"aldy_dvsn\" value=\"0\">";		
	  		html += "</div>";
	  		html += "</form>";
	  		/* 종일일정 체크 시 time 비활성화 및 숨기기 */
	  		$("body").on("click", "#aldy_dvsn", function () {
	  			if($("#aldy_dvsn").is(":checked")){
	  				 $('input[name=schdl_start_time]').attr('style', "display:none;");
	  				 $('#schdl_start_time').attr('disabled',true);
	  				 $('input[name=schdl_end_time]').attr('style', "display:none;");
	  				 $('#schdl_end_time').attr('disabled',true);
	  			 }else{
	  				 $('input[name=schdl_start_time]').attr('style', "display:inline;");
	  				 $('#schdl_start_time').attr('disabled',false);
	  				 $('input[name=schdl_end_time]').attr('style', "display:inline;");
	  				 $('#schdl_end_time').attr('disabled',false);
	  			 }
	  		});
	  		/* 사용자지정 범주를 선택하지 않으면 입력창 비활성화 및 숨기기 */
	  		 $("body").on("click", "#schdl_ctgry", function () {
	  			if($("#schdl_ctgry").val() == 0){
	  				$('input[name=user_ctgry]').attr('style', "display:inline;");
	  				 $('#user_ctgry').attr('disabled',false);
	  			 }else{
	  				$('input[name=user_ctgry]').attr('style', "display:none;");
	  				 $('#user_ctgry').attr('disabled',true);
	  			 }
	  		});
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
	  					}else if(checkEmpty("#schdl_start_date")){
	  						alert("시작 시간을 선택하세요.");
	  						$("#schdl_start_date").focus();
	  					}else if(checkEmpty("#schdl_end_date")){
	  						alert("종료 시간을 선택하세요.");
	  						$("#schdl_end_date").focus();
	  					}else if($("#schdl_ctgry").val() == "0" && checkEmpty("#user_ctgry")){
	  						alert("사용자지정 범주를 입력하세요.");
	  						$("#user_ctgry").focus();
	  					}else if($("#schdl_start_date").val() > $("#schdl_end_date").val()){
	  						alert("종료일이 시작일보다 빠를 수 없습니다.");
	  						$("#schdl_end_date").focus();
	  					}else{
	  						 if(checkEmpty("#schdl_cont")){
	  							$("#schdl_cont").val(" "); // 내용을 비워두면 undefined 출력돼서 추가
	  						}
	  						 if(checkEmpty("#schdl_place")){
	  								$("#schdl_place").val(" "); // 내용을 비워두면 undefined 출력돼서 추가
	  							}
	  						var params = $("#addForm").serialize();
	  						console.log(params);
	  						$.ajax({
	  							type: "post", 
	  							url : "clndrAction/insert",
	  							dataType : "json",
	  							data : params, 
	  							success : function(res) { 
	  								if(res.res == "success"){
	  									history.go(0);
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
	      }
	});
	
	$("body").on("click", ".fc-month-button", function() {
		clndrDvsn
		$("#clndrDvsn").attr('value',"month");
		history.go(0);
	});
	
	$("body").on("click", ".fc-agendaWeek-button", function() {
		clndrDvsn
		$("#clndrDvsn").attr('value',"week");
	});
	
	$("body").on("click", ".fc-nextYear-button", function() {
		clndrYear = clndrYear+1;
		
		if(clndrMonth >= 10){
			Cdate = ""+clndrYear+ clndrMonth;
		}else{
			Cdate = ""+clndrYear+"0"+clndrMonth;
		}
		$('input[name=clndrDate]').attr('value',Cdate);
		reloadList();
	});
	
	$("body").on("click", ".fc-prevYear-button", function() {
		clndrYear = clndrYear-1;
		if(clndrMonth >= 10){
			Cdate = ""+clndrYear+ clndrMonth;
		}else{
			Cdate = ""+clndrYear+"0"+clndrMonth;
		}
		$('input[name=clndrDate]').attr('value',Cdate);
		reloadList();
	});
	
	$("body").on("click", ".fc-next-button", function() {
		if($("#clndrDvsn").val() == "month"){
			clndrMonth = clndrMonth+1;
			if(clndrMonth >= 13){
				clndrMonth = 1;
			}
			if(clndrMonth >= 10){
				Cdate = ""+clndrYear+ clndrMonth;
			}else{
				Cdate = ""+clndrYear+"0"+clndrMonth;
			}
			$('input[name=clndrDate]').attr('value',Cdate);
			reloadList();
		} else{
			
		}
	});
	
	$("body").on("click", ".fc-prev-button", function() {
		if($("#clndrDvsn").val() == "month"){
		clndrMonth = clndrMonth-1;
		
		if(clndrMonth < 1){
			clndrMonth = 12;
		}
		if(clndrMonth >= 10){
			Cdate = ""+clndrYear+ clndrMonth;
		}else{
			Cdate = ""+clndrYear+"0"+clndrMonth;
		}
		$('input[name=clndrDate]').attr('value',Cdate);
		reloadList();
		}
	});
	
	$(".fc-today-button").on("click", function() {
		clndrYear = now.getFullYear();
		clndrMonth =now.getMonth()+1;
		if(clndrMonth >= 10){
			Cdate = ""+clndrYear+ clndrMonth;
		}else{
			Cdate = ""+clndrYear+"0"+clndrMonth;
		}
		$('input[name=clndrDate]').attr('value',Cdate);
		reloadList();
	});
	
	/* 상세일정 */
	function drawList(dtl) {
		var schdl_type_name = "";
		var schdl_ctgry_name = "";
		for(var data of dtl){
			console.log(data)
			switch(data.schdl_cont){
			case "":
				data.schdl_cont = " "					
				break;
			
		}
			switch(data.schdl_type_num){
				case "0":
					schdl_type_name = "개인"					
					break;
				case "1":
					schdl_type_name = "팀"					
					break;
				case "2":
					schdl_type_name = "전사"					
					break;
			}
			switch(data.schdl_ctgry_num){
			case "0":
				schdl_ctgry_name = data.user_ctgry_name				
				break;
			case "1":
				schdl_ctgry_name = "업무"					
				break;
			case "2":
				schdl_ctgry_name = "휴가"					
				break;
			case "3":
				schdl_ctgry_name = "교육"					
				break;
			case "4":
				schdl_ctgry_name = "회의"					
				break;
			case "5":
				schdl_ctgry_name = "회식"					
				break;
			case "6":
				schdl_ctgry_name = "출장"					
				break;
			case "7":
				schdl_ctgry_name = "개발"					
				break;
			}
		}
		var html ="";
	    
  	  html += "<form action=\"#\" id=\"dtlForm\" method=\"post\">";
  	  html += "<div class=\"dtl_schdl_style\" id=\"dtl_type\">";
  	  html += "<span>일정 종류</span>";
  	  html += "<input type=\"text\" value=\"" + schdl_type_name + "\" class=\"dtl_schdl_type\" readonly>";
  	  html += "<input type=\"text\" value=\"" + schdl_ctgry_name + "\" class=\"dtl_schdl_type\" readonly id=\"dtl_schdl_ctgry\">";
  	  html += "</div>";
  	  html += "<div class=\"dtl_schdl_style\">";
  	  html += "<span>제목</span>";
  	  html += "<input type=\"text\" value=\"" + data.title + "\" id=\"dtl_schdl_title\" readonly>";
  	  html += "</div>";
  	  html += "<div class=\"dtl_schdl_style\">";
  	  html += "<span>위치</span>";
  	  html += "<input type=\"text\" value=\"" + data.schdl_place + "\" id=\"dtl_schdl_place\" readonly>";
  	  html += "</div>";
  	  html += "<div class=\"dtl_schdl_style\">";
  	  html += "<span>기간</span>";
  	  if(data.aldy_dvsn == "1"){
	  	  html += "<input type=\"text\" value=\"" + data.start_date + " ~ " + data.end_date + "\" id=\"dtl_schdl_time\" readonly>";
  	  }else{
  	 	  html += "<input type=\"text\" value=\"" + data.start_date + data.start_time + " ~ " + data.end_date + data.end_time + "\" id=\"dtl_schdl_time\" readonly>";
  	  }
  	  html += "</div>";
  	  html += "<div class=\"dtl_schdl_dtl_cont\">";
  	  html += "<span>상세내용</span>";
  	  html += "<textarea rows=\"10\" cols=\"57\" class=\"dtl_cont\" readonly>" + data.schdl_cont + "</textarea>";			
  	  html += "</div>";
  	  html += "</form>";
  	  
  			makePopup({
  				bg : true,
  				bgClose : false,
  				title : "상세일정",
  				contents : html,
  				width : 540,
  				height : 520,
  				buttons : [{
  					name : "수정",
  					func:function() {
  						schdlUpdate(data);
  						if(data.aldy_dvsn == "1"){
  							$('input[name=schdl_start_time]').attr('style', "display:none;");
  							$('#schdl_start_time').attr('disabled',true);
  							$('input[name=schdl_end_time]').attr('style', "display:none;");
  							$('#schdl_end_time').attr('disabled',true);
  						 }
  					}
  				}, {
  					name : "삭제",
  					func:function(){
  						makePopup({
  							bg : true,
  							bgClose : false,
  							title : "삭제",
  							contents : "삭제하시겠습니까?",
  							draggable : true,
  							buttons : [{
  								name : "삭제",
  								func:function() {
			  						schdlDelete(data);
  								}
  							}, {
  								name : "취소"
  							}]
  						});
  					}
  					
  				},{
  					name : "닫기"
  				}]
  			});
	}
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
function schdlUpdate(data){
	console.log(data.id);
	var html = "";
	
	html += "<form action=\"#\" id=\"updateForm\" method=\"post\">";
	html += "<input type=\"hidden\" id=\"emp_num\" name=\"emp_num\" value=\"" + data.id + "\" >";
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
	html += "<input type=\"text\" value=\"" + data.title + "\"  id=\"schdl_title\" name=\"schdl_title\">";
	html += "</div>";
	html += "<div class=\"popup_style\">";
	html += "<span>위치</span>";
	html += "<input type=\"text\" value=\"" + data.schdl_place + "\"  id=\"schdl_place\" name=\"schdl_place\">";
	html += "</div>";
	html += "<div class=\"popup_style\">";
	html += "<span>시작 시간</span>";
	html += "<input type=\"date\" value=\"" + data.start_update + "\"  id=\"schdl_start_date\" name=\"schdl_start_date\">";
	html += "<input type=\"time\" value=\"" + data.start_time + "\"  id=\"schdl_start_time\" name=\"schdl_start_time\">";
	html += "<input type=\"hidden\" id=\"hidden_start_time\" name=\"schdl_start_time\">";
	html += "</div>";	
	html += "<div class=\"popup_style\">";
	html += "<span>종료 시간</span>";
	html += "<input type=\"date\" value=\"" + data.end_update + "\" id=\"schdl_end_date\" name=\"schdl_end_date\">";			
	html += "<input type=\"time\" value=\"" + data.end_time + "\"  id=\"schdl_end_time\" name=\"schdl_end_time\">";
	html += "<input type=\"hidden\" id=\"hidden_end_time\" name=\"schdl_end_time\">";
	html += "</div>";
	html += "<div class=\"popup_dtl_cont\">";
	html += "<span>상세내용</span>";
	html += "<textarea rows=\"10\" cols=\"57\" class=\"dtl_cont\" id=\"schdl_cont\" name=\"schdl_cont\">" + data.schdl_cont + "</textarea>";			
	html += "</div>";
	html += "<div class=\"popup_style\">";
	html += "<span>범주</span><span class=\"star\"> *</span>";
	html += "<select class=\"slct_type\" id=\"schdl_ctgry\" name=\"schdl_ctgry\">";
	html += "<option value=\"0\">사용자지정</option>";
	html += "<option value=\"1\">업무</option>";
	html += "<option value=\"2\">휴가</option>";
	html += "<option value=\"3\">교육</option>";
	html += "<option value=\"4\">회의</option>";
	html += "<option value=\"5\">회식</option>";
	html += "<option value=\"6\">출장</option>";
	html += "<option value=\"7\">개발</option>";
	html += "</select>";
	html += "<input type=\"text\" placeholder=\"사용자 지정\"id=\"user_ctgry\" name=\"user_ctgry\">";
	html += "<input type=\"hidden\" id=\"hidden_user_ctgry\" name=\"user_ctgry\">";
	html += "</div>";
	html += "<div class=\"popup_style\">";
	html += "<span>종일 일정</span>";
	if(data.aldy_dvsn == "1"){
	html += "<input type=\"checkbox\" id=\"aldy_dvsn\" name=\"aldy_dvsn\" value=\"1\" checked>";
	}else{
	html += "<input type=\"checkbox\" id=\"aldy_dvsn\" name=\"aldy_dvsn\" value=\"1\">";
	}
	html += "<input type=\"hidden\" id=\"aldy_dvsn_hidden\" name=\"aldy_dvsn\" value=\"0\">";		
	html += "</div>";
	html += "</form>";

	$("body").on("click", "#aldy_dvsn", function () {
		if($("#aldy_dvsn").is(":checked")){
			 $('input[name=schdl_start_time]').attr('style', "display:none;");
			 $('#schdl_start_time').attr('disabled',true);
			 $('input[name=schdl_end_time]').attr('style', "display:none;");
			 $('#schdl_end_time').attr('disabled',true);
		 }else{
			 $('input[name=schdl_start_time]').attr('style', "display:inline;");
			 $('#schdl_start_time').attr('disabled',false);
			 $('input[name=schdl_end_time]').attr('style', "display:inline;");
			 $('#schdl_end_time').attr('disabled',false);
		 }
	});
	$("body").on("click", "#schdl_ctgry", function () {
		if($("#schdl_ctgry").val() == 0){
			$('input[name=user_ctgry]').attr('style', "display:inline;");
			$('#user_ctgry').attr('disabled',false);
		 }else{
			$('input[name=user_ctgry]').attr('style', "display:none;");
			$('#user_ctgry').attr('disabled',true);
		 }
	});
	makePopup({
		bg : true,
		bgClose : false,
		title : "일정수정",
		contents : html,
		contentsEvent : function() {
			$("#schdl_type").val(data.schdl_type_num);
			$("#schdl_ctgry").val(data.schdl_ctgry_num);
			$("#user_ctgry").val(data.user_ctgry_name);
			if($("#schdl_ctgry").val() != 0){
				$('input[name=user_ctgry]').attr('style', "display:none;");
				$('#user_ctgry').attr('disabled',true);
			 } 
				
			
		},
		width : 540,
		height : 620,
		buttons : [{
			name : "저장",
			func:function() {
				if(checkEmpty("#schdl_title")){
					alert("제목을 입력하세요.");
					$("#schdl_title").focus();
				}else if(checkEmpty("#schdl_start_date")){
					alert("시작 시간을 입력하세요.");
					$("#schdl_start_date").focus();
				}else if(checkEmpty("#schdl_end_date")){
					alert("종료 시간을 입력하세요.");
					$("#schdl_end_date").focus();
				}else if($("#schdl_ctgry").val() == "0" && checkEmpty("#user_ctgry")){
					alert("범주를 입력하세요.");
					$("#user_ctgry").focus();
				}else if($("#schdl_start_date").val() > $("#schdl_end_date").val()){
					alert("종료일이 시작일보다 빠를 수 없습니다.");
					$("#schdl_end_date").focus();
				}else{
					if(checkEmpty("#schdl_cont")){
						$("#schdl_cont").val(" ");
					}
					 if(checkEmpty("#schdl_place")){
							$("#schdl_place").val(" ");
						}
					 /* if($("#aldy_dvsn").is(":checked")){
						 $("#hidden_end_time").val("23:59"); // 종일일정 시 하루씩 짧아져서 시간 할당
					 } */
					 
					var params = $("#updateForm").serialize();
					console.log(params);
					$.ajax({
						type: "post", 
						url : "clndrAction/update",
						dataType : "json",
						data : params, 
						success : function(res) { 
							if(res.res == "success"){
								history.go(0);
							}else{
								alert("수정중 문제가 발생하였습니다.");
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
}
/* 일정삭제 */
function schdlDelete(data){
	var params = "";
 	 
		$.ajax({
			type: "post", 
			url : "clndrAction/delete",
			dataType : "json",
			data : {id : data.id}, 
			success : function(res) { 
				if(res.res == "success"){
					history.go(0);
				}else{
					alert("삭제중 문제가 발생하였습니다.");
				}
				 
			},
			error : function(request, status, error) { 
				console.log(request.responseText); 
			}
		});
}

/* 오늘 할 일 추가 */
function drawToDayList(schdl){
	var now = new Date();
	var clndrYear = now.getFullYear();	// 연도
	var clndrMonth =now.getMonth()+1;	// 월
	var clndrDate =now.getDate();	// 일
	if(clndrMonth >= 10){
		var date = clndrYear+"-" + clndrMonth+"-" + clndrDate
	}else{
		var date = clndrYear+"-"+"0" + clndrMonth+"-" + clndrDate
	}
		var html = "";
		for(var data of schdl){
			var sidebar = document.getElementById("side_bar").offsetHeight + 34 +"px";
			if(date == data.startDate){
				$("#side_bar").css('height', (sidebar));
				html += "<input type=\"hidden\" id=\"today_schdl_num\" name=\"today_schdl_num\" value=\"" + data.id + "\" >";
				if(data.startTime == "00:00"){
					html +=	"<div class=\"today_schdl\" id=\"" + data.schdlCtgryName +"\">" + "종일 - "  + data.title + "</div>";
				}else{
					html +=	"<div class=\"today_schdl\" id=\"" + data.schdlCtgryName +"\">" + data.startTime + " - " + data.title + "</div>";
				}
				
			}else{
				
			}
			
		}
		$(".today_schdl").html(html);
			
			
	}
/* 일정 불러오기 */
function reloadList() {
	var params = $("#dateForm").serialize();	
	$.ajax({
		type: "post", 
		url : "clndrAjax", 
		dataType : "json",
		data : params, 
		success : function(schdl) { 
			console.log(schdl);
			drawToDayList(schdl.list);
			var oldEvents = $("#fullCalendarArea").fullCalendar("getEventSources");
			//기존 이벤트 제거
			$("#fullCalendarArea").fullCalendar("removeEventSources", oldEvents);
			$("#fullCalendarArea").fullCalendar("refetchEvents");
			//신규이벤트 추가
			$("#fullCalendarArea").fullCalendar("addEventSource", schdl.list);
			$("#fullCalendarArea").fullCalendar("refetchEvents");
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	});
	 
}
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
		html += "<input type=\"date\" id=\"schdl_start_date\" name=\"schdl_start_date\">";
		html += "<input type=\"time\" id=\"schdl_start_time\" name=\"schdl_start_time\">";
		html += "<input type=\"hidden\" id=\"hidden_start_time\" name=\"schdl_start_time\">";
		html += "</div>";	
		html += "<div class=\"popup_style\">";
		html += "<span>종료 시간</span>";
		html += "<input type=\"date\" id=\"schdl_end_date\" name=\"schdl_end_date\">";			
		html += "<input type=\"time\" id=\"schdl_end_time\" name=\"schdl_end_time\">";
		html += "<input type=\"hidden\" id=\"hidden_end_time\" name=\"schdl_end_time\">";
		html += "</div>";
		html += "<div class=\"popup_dtl_cont\">";
		html += "<span>상세내용</span>";
		html += "<textarea rows=\"10\" cols=\"57\" class=\"dtl_cont\" id=\"schdl_cont\" name=\"schdl_cont\"></textarea>";			
		html += "</div>";
		html += "<div class=\"popup_style\">";
		html += "<span>범주</span><span class=\"star\"> *</span>";
		html += "<select class=\"slct_type\" id=\"schdl_ctgry\" name=\"schdl_ctgry\">";
		html += "<option value=\"0\">사용자지정</option>";
		html += "<option value=\"1\">업무</option>";
		html += "<option value=\"2\">휴가</option>";
		html += "<option value=\"3\">교육</option>";
		html += "<option value=\"4\">회의</option>";
		html += "<option value=\"5\">회식</option>";
		html += "<option value=\"6\">출장</option>";
		html += "<option value=\"7\">개발</option>";
		html += "</select>";
		html += "<input type=\"text\" placeholder=\"사용자 지정\"id=\"user_ctgry\" name=\"user_ctgry\">";
		html += "<input type=\"hidden\" id=\"hidden_user_ctgry\" name=\"user_ctgry\">";
		html += "</div>";
		html += "<div class=\"popup_style\">";
		html += "<span>종일 일정</span>";
		html += "<input type=\"checkbox\" id=\"aldy_dvsn\" name=\"aldy_dvsn\" value=\"1\">";		
		html += "<input type=\"hidden\" id=\"aldy_dvsn_hidden\" name=\"aldy_dvsn\" value=\"0\">";		
		html += "</div>";
		html += "</form>";
		/* 종일일정 체크 시 time 비활성화 및 숨기기 */
		$("body").on("click", "#aldy_dvsn", function () {
			if($("#aldy_dvsn").is(":checked")){
				 $('input[name=schdl_start_time]').attr('style', "display:none;");
				 $('#schdl_start_time').attr('disabled',true);
				 $('input[name=schdl_end_time]').attr('style', "display:none;");
				 $('#schdl_end_time').attr('disabled',true);
			 }else{
				 $('input[name=schdl_start_time]').attr('style', "display:inline;");
				 $('#schdl_start_time').attr('disabled',false);
				 $('input[name=schdl_end_time]').attr('style', "display:inline;");
				 $('#schdl_end_time').attr('disabled',false);
			 }
		});
		/* 사용자지정 범주를 선택하지 않으면 입력창 비활성화 및 숨기기 */
		 $("body").on("click", "#schdl_ctgry", function () {
			if($("#schdl_ctgry").val() == 0){
				$('input[name=user_ctgry]').attr('style', "display:inline;");
				 $('#user_ctgry').attr('disabled',false);
			 }else{
				$('input[name=user_ctgry]').attr('style', "display:none;");
				 $('#user_ctgry').attr('disabled',true);
			 }
		});
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
					}else if(checkEmpty("#schdl_start_date")){
						alert("시작 시간을 선택하세요.");
						$("#schdl_start_date").focus();
					}else if(checkEmpty("#schdl_end_date")){
						alert("종료 시간을 선택하세요.");
						$("#schdl_end_date").focus();
					}else if($("#schdl_ctgry").val() == "0" && checkEmpty("#user_ctgry")){
						alert("사용자지정 범주를 입력하세요.");
						$("#user_ctgry").focus();
					}else if($("#schdl_start_date").val() > $("#schdl_end_date").val()){
						alert("종료일이 시작일보다 빠를 수 없습니다.");
						$("#schdl_end_date").focus();
					}else{
						 if(checkEmpty("#schdl_cont")){
							$("#schdl_cont").val(" "); // 내용을 비워두면 undefined 출력돼서 추가
						}
						 if(checkEmpty("#schdl_place")){
								$("#schdl_place").val(" "); // 내용을 비워두면 undefined 출력돼서 추가
							}
						var params = $("#addForm").serialize();
						console.log(params);
						$.ajax({
							type: "post", 
							url : "clndrAction/insert",
							dataType : "json",
							data : params, 
							success : function(res) { 
								if(res.res == "success"){
									history.go(0);
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
				<input type="hidden" id="clndrDvsn" value="month">
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->			
			 <form action="#" id="dateForm" method="post">
				<input type="hidden" name="clndrDate" value="">
			 </form>
			<input type="button" value="일정 등록" id="new_schdl">
	<div id="side_bar">
		<div class="schdl_type">
			<h5 class="side_bar_title">일정</h5>
			<input type="checkbox" class="type_box" id="solo" checked="checked"><label for="solo" class="type_label" >개인 일정</label><br>
			<input type="checkbox" class="type_box" id="team"><label for="team" class="type_label">팀 일정</label><br>
			<input type="checkbox" class="type_box" id="all"><label for="all" class="type_label">전사 일정</label>
			
		</div>
		<div class="schdl_ctgry">
			<h5 class="side_bar_title">범주</h5>
			<input type="checkbox" class="ctgry_box" id="bsns"><label for="bsns" class="type_label">업무</label><div id="bsns_color"></div><br>
			<input type="checkbox" class="ctgry_box" id="leave"><label for="leave" class="type_label">휴가</label><div id="leave_color"></div><br>
			<input type="checkbox" class="ctgry_box" id="edctn"><label for="edctn" class="type_label">교육</label><div id="edctn_color"></div><br>
			<input type="checkbox" class="ctgry_box" id="mtng"><label for="mtng" class="type_label">회의</label><div id="mtng_color"></div><br>
			<input type="checkbox" class="ctgry_box" id="get_tgthr"><label for="get_tgthr" class="type_label">회식</label><div id="get_tgthr_color"></div><br>
			<input type="checkbox" class="ctgry_box" id="bsns_trip"><label for="bsns_trip" class="type_label">출장</label><div id="bsns_trip_color"></div><br>
			<input type="checkbox" class="ctgry_box" id="devel"><label for="devel" class="type_label">개발</label><div id="devel_color"></div><br>
			<input type="checkbox" class="ctgry_box" id="user_dsgnt"><label for="user_dsgnt" class="type_label">사용자 지정</label><div id="user_dsgnt_color"></div>
			
			
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