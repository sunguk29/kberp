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
	width: 1100px;
}
/* 개인 작업 영역 */
/* 콜센터 고객정보 검색 팝업 */
#srch_txt{
	display: inline-block;
	vertical-align:top;
	width: 100px;
}
#srch_btn{
	display: inline-block;
	vertical-align:top;
	width: 38px;
	height: 22px;
	margin-right: 20px;
	font-size: 8pt;
	font-weight: bold;
	text-align: center;
}

.name_box{
	display: inline-block;
	vertical-align: top;
	width: 55px;
	height: 20px;
	font-size: 9pt;
	font-weight: bold;
	text-align: center;
	background-color: #F2CB05;
	border-radius: 2px;
	margin-top: 3px;
}
.srch_slct{
	width: 100%;
	height: 20px;
	text-align: right;
	font-size: 12pt;
}
.srch_cont{
	display: inline-block;
	vertical-align: top;
	width: 380px;
	height: 280px;
	background-color: white;
	margin-top: 7px;
	overflow: auto;
}
.clnt_srch_table {
	display: inline-table;
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 15px;
}
.clnt_srch_table thead tr {
	background-color: #f4d541;
	height: 30px;
	font-size: 10pt;
}
.clnt_srch_table tbody tr {
	border-bottom: 1px solid #d7d7d7;
	height: 25px;
	text-align: center;
	color: #7b7b7b;
	font-size: 9pt;
}
.clnt_srch_table thead tr{
	position: sticky;
	top: 0px;
}

.clnt_srch_table tbody tr {
	color: #222222;
	cursor: pointer;
}

.clnt_srch_table tbody tr:hover {
	color: #4B94F2;
	text-decoration: underline;
}

/* 저장 팝업 */
.save_cont{
	width: 100%;
	height: 100%;
	text-align: center;
	line-height: 110px;
}

/* 내용부분 위 아래 영역 나누기 */
.call_area {
	display: inline-block;
	vertical-align: top;
	width: 1050px;
	height: 300px;
}

/* 고객정보 파트 */
.top {
	display: inline-block;
	vertical-align: top;
	width: 510px;
	height: 300px;
}


.clnt_info_Header {
	display: inline-block;
	vertical-align: top;
	width: 510px; 
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #999999;;
	font-weight: bold; 
	background-color: #f2cb05;
}

.clnt_info {
	display: inline-block;
	vertical-align: top;
	text-indent: 10px;
    font-size: 13pt;
    width: 240px;
}
.cmn_btn_ml{
	margin-top: 5px;
	margin-left: 0px;
	background-color: #F2F2F2;
}

.clnt_srch {
	margin-top: 5px;
	background-color: #ffffff;
}

.clnt_srch input:focus {
	outline: 2px solid #F2CB05;
}


.clnt_info_cont {
	width: 510px; 
	height: 300px;
	border: 1px solid #999999; 
	border-right: none;
}

.clnt_info_cont_row1 .clnt_name, 
.clnt_info_cont_row1 .clnt_grade {
	display: inline-block;
	width: 70px;
	height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999;
	margin-top: 40px;
	margin-left: 10px;
	
}

.clnt_info_cont_row2 .ltl_cnsl_day,
.clnt_info_cont_row2 .phone_num_1 {
	display: inline-block;
	width: 70px;
	height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999;
	margin-top: 35px;
	margin-left: 10px;
}

.clnt_info_cont_row3 .phone_num_2 {
	display: inline-block;
	width: 70px;
	height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999;
	margin-top: 10px;
	margin-left: 259px;
}

.info_txt {
	width: 162px;
}

.clnt_info_cont_row4 .adrs {
	display: inline-block;
	width: 70px;
	height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999;
	margin-top: 30px;
	margin-left: 10px;
}

.adrs_input {
	width: 100px;
	height: 16px;
}
.adrs_input_dtls{
	width: 330px;
	height: 16px;
	margin-top: 1px;
	margin-left: 82px;
}

.cmn_btn_mr {
	height: 25px;
	line-height: 25px;
	margin-top: 0px;
	margin-right: 10px;
	float: right;
}

/* 상담노트 파트 */
.cnsl_note_top {
	display: inline-block;
	vertical-align: top;
	width: 510.5px;
	height: 40px;
	background-color: #f2cb05;
	border-bottom: 1px solid #999999;;
}

.cnsl_note {
	display: inline-block;
	vertical-align: top;
	font-size: 10pt;
	line-height: 40px;
	font-size: 13pt; 
	font-weight: bold; 
	text-indent: 10pt;
	margin: 0;
}

.cmn_btn{
	float: right;
	width: 35px;
	height: 30px;
	margin-top: 5px;
	margin-right: 5px;
	background-color: #F2F2F2;
}
#imgs{
	width: 100%;
	height: 100%;
}
.mid_area {
	display: inline-block;
	vertical-align: top;
	width:  510px;
	height: 300px;
	border: 1px solid #999999; 
}

.mid_row1 {
	display: inline-block;
	width: 510px;
	height: 40px;
	line-height: 40px;
	margin-top: 5px;
	margin-left: 10px;
}

.cnsl_type {
	display: inline-block;
	width: 60px;
	height: 20px;
	line-height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999; 
}

[name="big_sel"] {
	margin-left:10px;
	width: 100px;
	height: 20px;
}

[name='small_sel'] {
	margin-left:5px;
	width: 100px;
	height: 20px;
}

.mid_row2 {
	display: inline-block;
	width: 510px;
	height: 150px;
	margin-left: 10px;
}

.cnsl_note_cont {
	display: inline-block;
	vertical-align: top;
	width: 60px;
	height: 20px;
	line-height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999;
}

.cont_memo {
	display: inline-block;
	width: 400px;
	height: 150px;
	resize: none;
	margin-left: 10px;
}

.mid_row3 {
	display: inline-block;
	width: 510px;
	height: 50px;
	margin-top: 18px;
	margin-left: 10px;
}

.cnsl_note_rslt {
	display: inline-block;
	width: 60px;
	height: 20px;
	line-height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999;
	margin-top: 5px; 
}

[name="cnsl_rslt"] {
	margin-left: 5px;
	width: 70px;
	height: 20px;
}
.note_cmn_btn_mr {
	display: block;
	padding: 0px 10px;
	min-width: 30px;
	height: 25px;
	line-height: 25px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #F2B705;
	border-radius: 2px;
	color: #222222;
	cursor: pointer;
	float: right;
	margin-top: 5px;
	margin-right: 30px;
}
.note_cmn_btn_mr:active {
	background-color: #F2CB05;
}

/* 상담이력 파트 */

.bottom_1 {
	display: inline-block;
	vertical-align: top;
	width: 509px;
	height: 300px;
	border: 1px solid #999999;
	border-right: none;
}

.cnsl_rcrd_header {
	display: inline-block;
	width: 509px; 
	height: 40px;
	line-height: 40px;
	font-weight: bold; 
	background-color: #f2cb05;
	border-bottom: 1px solid #999999;
	
}

.cnsl_rcrd { 
	display: inline-block;
	text-indent: 10px;
    font-size: 13pt;
    width: 240px;
} 

.cnsl_rcrd_srch_text_wrap {
	display: inline-block;
	vertical-align: top;
	width: 198px;
	height: 28px;
	margin-left: 10px;
	text-align: left;
	border: 1px solid #d7d7d7;
	line-height: 28px;
	background-image: url('./images/cmn/srch_icon.png');
	background-repeat: no-repeat;
	background-size: 26px;
	background-position: right center;
	margin-top: 5px;
	background-color: #ffffff;
}

.cnsl_rcrd_srch_text_wrap input {
	width: 161px;
	height: 28px;
	padding: 0px 2px;
	vertical-align: middle;
	border: none;
}

.cnsl_rcrd_srch_text_wrap input:focus {
	outline: 2px solid #F2CB05;
}

.cnsl_rcrd_cont {
	display: inline-block;
	vertical-align: top;
	width: 510px;
	height: 260px;
	overflow: auto;
}

.cnsl_rcrd_table{
	display: inline-table;
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 15px;
}
.cnsl_rcrd_table thead tr {
	background-color: #F2F2F2;
	height: 30px;
	font-size: 10pt;
	position: sticky;
	top: 0px;
}
.cnsl_rcrd_table tbody tr {
	border-bottom: 1px solid #d7d7d7;
	height: 25px;
	text-align: center;
	color: #7b7b7b;
	font-size: 9pt;
}

.cnsl_rcrd_table tbody tr {
	color: #222222;
	cursor: pointer;
}

.cnsl_rcrd_table tbody tr:hover {
	color: #4B94F2;
	text-decoration: underline;
}


/* [이력]상담노트 파트 */
.bottom_2 {
	display: inline-block;
	vertical-align: top;
	width: 510px;
	height: 300px;
}

.rcrd_cnsl_note_top {
	display: inline-block;
	vertical-align: top;
	width: 510.5px;
	height: 40px;
	background-color: #f2cb05;
	border-bottom: 1px solid #999999;
	margin: 0;
}

.rcrd_cnsl_note {
	display: inline-block;
	font-size: 10pt;
	line-height: 40px;
	font-size: 13pt; 
	font-weight: bold; 
	text-indent: 10pt;
	margin: 0;
}



.rcrd_cnsl_note_row1 {
	display: inline-block;
	width: 510px;
	height: 40px;
	line-height: 40px;
	margin-top: 5px;
	margin-left: 10px;
}

.cnsl_type {
	display: inline-block;
	width: 60px;
	height: 20px;
	line-height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999; 
}

#cnsl_type {
	margin-left: 10px;
}

.rcrd_cnsl_note_row2{
	display: inline-block;
	width: 510px;
	height: 150px;
	margin-left: 10px;
}

.cnsl_note_cont {
	display: inline-block;
	width: 60px;
	height: 20px;
	line-height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999; 
	vertical-align: top;
}



.rcrd_cnsl_note_row3 {
	display: inline-block;
	width: 510px;
	height: 50px;
	margin-left: 10px;
	margin-top: 20px;
}
.cnsl_note_rslt {
	display: inline-block;
	width: 60px;
	height: 20px;
	line-height: 20px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #eeeeee;
	border: 1px solid #999999;
	margin-top: 5px; 
}
#rcrd_cnsl_rslt_txt{
	width: 70px;
	height: 15px;
	text-align: center;
	font-size: 10.5pt;
	font-weight: bold;
	margin-top: 1px;
	margin-left: 5px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#guide_btn").on("click", function() {
		var html = "";
		
		makePopup({
			bg : false,
			bgClose : false,
			width: 510,
			height: 300,
			title : "대응가이드",
			contents : html,
			draggable : true,
			buttons : [{
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}]
		});
	});

	$("#call_btn").on("click", function() {
		var html = "";
		
		makePopup({
			bg : false,
			bgClose : false,
			width: 510,
			height: 300,
			title : "안내/부서별연락",
			contents : html,
			draggable : true,
			buttons : [{
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}]
		});
	});
	
	$("#searchTxt").on("keypress", function() {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
			
			return false;
		}
	});

	$("#searchBtn").on("click", function() {
		
		var html = "";
		
		html += "<form action=\"#\" id=\"actionForm\" method=\"post\">"
		html += "<div class=\"srch_slct\">";
		html += "<div class=\"name_box\">선택</div>";
		html += "<select id=\"clnt_slct\" name=\"clnt_slct\">";
		html += "	<option value=\"0\">이름</option>";
		html += "	<option value=\"1\">등급</option>";
		html += "	<option value=\"2\">전화번호</option>";
		html += "</select>";
		html += "<input type=\"text\" name=\"searchTxt\" value=\"" + $("#searchTxt").val() + "\"/>"
		html += "</div>";
		html += "</form>";
		html += "<div class=\"srch_cont\">";
		html += "	<table class=\"clnt_srch_table\">";
		html += "	<colgroup>";
		html += "		<col width=\"100\"/>";
		html += "		<col width=\"100\"/>";
		html += "		<col width=\"200\"/>";
		html += "	</colgroup>";
		html += "	<thead>";
		html += "		<tr>";
		html += "			<th>이름</th>";
		html += "			<th>등급</th>";
		html += "			<th>전화번호</th>";
		html += "		</tr>";
		html += "	</thead>";
		html += "	<tbody id=\"clntPop\">";
		html += "	</tbody>";
		html += "	</table>";
		html += "</div>";
			
		makePopup({
			bg : false,
			bgClose : false,
			width: 400,
			height: 400,
			title : "고객 검색 결과",
			contents : html,
			contentsEvent : function reloadList() {
				var params = $("#actionForm").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "callCenterPopListAjax",
					dataType : "json",
					data : params,
					success : function(res) {
						console.log(res);
						drawList(res.list);
					},
					error : function(request, status, error) {
						console.log(request.responseText);

					}
				});
			},
			draggable : true,
			buttons : [{
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}]
		});
		
		
		
	});
	
	function drawList(list) {
		var html = "";
		
		for(var data of list) {
			html += "<tr no=\"" + data.CLNT_NUM +"\">";
			html += "<td>" + data.CLNT_NAME + "</td>"
			html += "<td>" + data.CLNT_GRADE + "</td>"
			html += "<td>" + data.PHONE_NUM_1 + "</td>"
			html += "</tr>"
		}
		$("#clntPop").html(html);
	}
	
	$("#clntPop").on("click", "tr" , function() {
		$("#no").val($(this).attr("no"));
		
		$("#saveForm").attr("action");
		$("#saveForm").submit();
		
	});
	
	$(".cmn_btn_mr").on("click", function() {
		
		var html = "";
		
		html += "<div class=\"save_cont\">지금까지의 내용을 저장 하시겠습니까?</div>"
		
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 220,
			title : "저장",
			contents : html,
			buttons :  [{
				name : "확인",
				func:function() {
					if(checkEmpty("#clnt_name")) {
						alert("고객명을 입력하세요.");
						$("#clnt_name").focus();
					} else if(checkEmpty("#clnt_grade")) {
						alert("고객등급을 입력하세요.");
						$("#clnt_grade").focus();
					} else if(checkEmpty("#phon_num_1")) {
						alert("전화번호를 입력하세요.");
						$("#phon_num_1").focus();
					} else {
						// 저장
						var params = $("#saveForm").serialize();
						
						$.ajax({
							type : "post",
							url : "callCenterAction/ClntSave",
							dataType : "json",
							data : params,
							success : function(res) {
								if(res.res == "success") {
									location.href = "callCenter";
								} else {
									alert("작성중 문제가 발생하였습니다.");
								}

							},
							error : function(request, status, error) {
								console.log(request.responseText);

							}
						}); // ajax end
					} // else end
				saveForm.submit();
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	$(".note_cmn_btn_mr").on("click", function() {
		
		var html = "";
		
		html += "<div class=\"save_cont\">지금까지의 내용을 저장 하시겠습니까?</div>"
		
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 220,
			title : "저장",
			contents : html,
			buttons :  [{
				name : "확인",
				func:function() {
					if(checkEmpty("#big_sel")) {
						alert("대분류를 입력하세요.");
						$("#big_sel").focus();
					} else if(checkEmpty("#small_sel")) {
						alert("소분류를 입력하세요.");
						$("#small_sel").focus();
					} else if(checkEmpty("#cont")) {
						alert("상담내용을 입력하세요.");
						$("#cont").focus();
					} else if(checkEmpty("#cnsl_rslt")) {
						alert("상담결과를 입력하세요.");
						$("#cnsl_rslt").focus();
					} else {
						// 저장
						var params = $("#noteSaveForm").serialize();
						
						$.ajax({
							type : "post",
							url : "callCenterAction/NoteSave",
							dataType : "json",
							data : params,
							success : function(res) {
								if(res.res == "success") {
									location.href = "callCenter";
								} else {
									alert("작성중 문제가 발생하였습니다.");
								}

							},
							error : function(request, status, error) {
								console.log(request.responseText);

							}
						}); // ajax end
					} // else end
					noteSaveForm.submit();
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	
	function reloadCnslList() {
		var params = $("#cnslForm").serialize();
		
		$.ajax({
			type : "post",
			url : "callCenterCnslListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log(res);
				drawCnslList(res.list);
			},
			error : function(request, status, error) {
				console.log(request.responseText);

			}
		});
	}
	
	function drawCnslList(list) {
		var html = "";
		
		for(var data of list) {
			html += "<tr no=\"" + data.I.CLNT_NUM + "\">";
			html += "<td>"+ data.I.CLNT_NAME + "</td>"
			html += "<td>"+ data.I.PHONE_NUM_1 + "</td>"
			html += "<td>"+ data.E.EMP_NAME + "</td>"
			html += "<td>"+ data.N.CNSL_TYPE_NUM + "</td>"
			html += "<td>"+ data.WRITE_DATE + "</td>"
			html += "<td>"+ data.N.CNSL_RSLT_NUM + "</td>"
			html += "</tr>";
		}
		$("#cnslList").html(html);
	}
	
});



function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
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
			<div class="page_title_text">콜센터</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<!-- 내용 위 아래 영역지정 -->
			<div class="call_area">
			
			<!-- 고객정보 파트 -->
				<div class="top">
					<div class="clnt_info_cont">
						<input type="hidden" id="oldsearchTxt" value="${param.searchTxt}"/>
					<form action="#" id="saveForm" method="post">
					<input type="hidden" id="no" name="no"/>
						<div class="clnt_info_Header">
							<div class="clnt_info">고객정보</div>
							<div class="srch_text_wrap clnt_srch">
								<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
							</div>
							<div class="cmn_btn_ml" id="searchBtn">검색</div>
						</div>
		    			<div class="clnt_info_cont_row1">	  
			    			<div class="clnt_name">고객명</div>
			    				<input type="text" class="info_txt" id="clnt_name" name="clnt_name">
			    			<div class="clnt_grade">고객등급</div>
			    				<input type="number" class="info_txt" id="clnt_grade" name="clnt_grade">
			    		</div>
			    		<div class="clnt_info_cont_row2">	  
			    			<div class="ltl_cnsl_day">최근상담일</div>
			    				<input type="date" class="info_txt" id="ltl_cnsl" name="ltl_cnsl">
			    			<div class="phone_num_1">전화번호 1</div>
			    				<input type="tel" class="info_txt" id="phon_num_1" name="phon_num_1">
			    		</div>	
		    			<div class="clnt_info_cont_row3">	  
			    			<div class="phone_num_2">전화번호 2</div>
			    				<input type="tel" class="info_txt" id="phon_num_2" name="phon_num_2">
			    		</div>
			    		<div class="clnt_info_cont_row4">	  
			    			<div class="adrs">주소</div>
			    				<input class="adrs_input" type="text" id="adrs" name="adrs">
			    				<br/>
			    				<input class="adrs_input_dtls" type="text" id="dtl_adrs" name="dtl_adrs">
			    		</div>	
		    			<div class="cmn_btn_mr" id="saveBtn">저장</div>
		    		</form>
		    		</div>
		    	</div> <!-- 고객정보 div 끝 -->
		    	
		    	<!-- 상담노트 파트 -->
		    	<div class="top">
		    		<div class="mid_area">
		    		<form action="#" id="noteSaveForm" method="post">
						<div class="cnsl_note_top">
							<div class="cnsl_note">상담노트</div>
							<div class="cmn_btn" id="call_btn"><img alt="부서별연락처" src="resources/images/CS/call.png" id="imgs"></div>
							<div class="cmn_btn" id="guide_btn"><img alt="대응가이드" src="resources/images/CS/call_guide.png" id="imgs"></div>
						</div>
						<div class="mid_row1">
							<input type="hidden" id="emp_num" name="emp_num" value="${sEmpNum}"/>
							<input type="hidden" id="clnt_num" name="clnt_num" value="${data.CLNT_NUM}"/>
							<div class="cnsl_type">상담유형</div>
							<select id="cnsl_type_num" name="cnsl_type_num">
								<option value="">대분류</option>
							</select>
							<select id="small_sel" name="small_sel">
								<option value="">소분류</option>
							</select>
						</div>
						<div class="mid_row2">
							<div class="cnsl_note_cont">상담내용</div>
							<textarea class="cont_memo" id="cont" name="cont" rows="10" cols="42"></textarea>
						</div>
						<div class="mid_row3">
							<div class="cnsl_note_rslt">상담결과</div>
							<select id="cnsl_rslt" name=cnsl_rslt>
								<option value="0">완료</option>
								<option value="1">미처리</option>
								<option value="2">예약</option>
								<option value="3">이관</option>
							</select>
							<div class="note_cmn_btn_mr" id="noteSaveBtn">노트저장</div>
						</div>
						</form>
					</div>
				</div>
			</div> <!-- top area div 끝 -->
			
			<!-- 상담이력 시작 -->
			<div class="call_area">
				<div class="bottom_1">
				<form action="#" id="cnslForm" method="post">
					<div class="cnsl_rcrd_header">
						<div class="cnsl_rcrd">상담이력</div>
					</div>
				
					<div class="cnsl_rcrd_cont">
						<table class="cnsl_rcrd_table">
							<colgroup>
								<col width="20"/>
								<col width="50"/>
								<col width="20"/>
								<col width="20"/>
								<col width="40"/>
								<col width="20"/>
							</colgroup>
							<thead>
								<tr>
									<th>이름</th>
									<th>전화번호</th>
									<th>상담사</th>
									<th>유형</th>
									<th>상담일자</th>
									<th>상담결과</th>
								</tr>
							</thead>
							<tbody id="cnslList"></tbody>
						</table>
					</div>
				</form>
				</div>
				
				
				<div class="bottom_2">
					<div class="mid_area">
						<div class="rcrd_cnsl_note_top">
							<div class="rcrd_cnsl_note">[이력]상담노트</div>
						</div>
						<div class="rcrd_cnsl_note_row1">	
							<div class="cnsl_type">상담유형</div>
							<input type="text"  value=""  size="10" readonly="readonly" id="cnsl_type" />
							<input type="text"  value=""  size="10" readonly="readonly" id="cnsl_type" />
						</div>
						<div class="rcrd_cnsl_note_row2">
							<div class="cnsl_note_cont">상담내용</div>
							<textarea class="cont_memo" rows="10" cols="42" readonly="readonly"></textarea>
						</div>
						<div class="rcrd_cnsl_note_row3">
							<div class="cnsl_note_rslt">상담결과</div>
							<input type="text"  value=""  readonly="readonly" id="rcrd_cnsl_rslt_txt" />
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