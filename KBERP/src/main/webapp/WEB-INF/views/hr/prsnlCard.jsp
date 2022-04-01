<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 인사기록카드</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.dtl_cont {
	display: block;
	border-top: 2px solid #cccccc;
	border-bottom: 2px solid #cccccc;
/* 	background-color: #4B94F233;*/
}
#top_area {
	width: 100%;
	height: 240px;
	display: inline-block;
	vertical-align: top;
	margin-bottom: 5px;
}
#bottom_area {
	width: 100%;
	height: 320px;
	display: inline-block;
	vertical-align: top;
}
#left_top {
	display: inline-block;
	vertical-align: top;
	width: 551px;
	height: 238px;
	margin-right: 7px;
}
#right_top {
	display: inline-block;
	vertical-align: top;
	width: 320px;
	height: 238px;
}
#bottom {
	display: inline-block;
	vertical-align: top;
	width: 878px;
	height: 318px;
}

#table_area {
	width: 862px;
	height: 278px;
	/* overflow-y: auto; */
}

#basic_info_area {
	display: inline-block;
	vertical-align: top;
	width: 164px;
	height: 200px;
	margin: 5px 10px 10px 0px;
	padding-left: 0px;
}
#basic_info_area_right {
	width: 142px;
	display: inline-block;
	vertical-align: top;
	margin-right: 0px;
}
#rt_l1 {
	height: 30px;
	width: 161px;
	margin: 6px 0px 0px 0px;
}
#rt_l1_e1 .cont_name {
	display: inline-block;
	vertical-align: center;
	width: 50px;
	margin-left: 5px;
}
#rt_l1_e1 .cont_text {
	display: inline-block;
	vertical-align: center;
	background-color: #ffffff00;
	outline: 0;
	font-weight: 700;
	text-align: right;
	width: 80px;
}
#pctr_area {
	width: 141px;
	height: 188px;
	background-size: cover;
	margin: 5px 0px 10px 1px;
}
.cont_line_rt {
	margin-top: 16px;
	margin-bottom: 2px;
}
.cont_element {
	display: inline-block;
	vertical-align: top;
	height: 36px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

#lt1_l1_e1 {
	width: 240px;
}
#lt1_l1_e2 {
	width: 240px;
}
#lt1_l1_e3 {
	width: 40px;
}
#lt1_l2_e1 {
	width: 240px;
}
#lt1_l2_e2 {
	width: 240px;
}
#lt1_l3_e1 {
	width: calc(100% - 14px);
}
#lt1_l4_e1 {
	width: 240px;
}
#lt1_l4_e2 {
	width: 240px;
}

#lt2_l1_e1 {
	width: 172px;
}
#lt2_l1_e2 {
	width: 172px;
}
#lt2_l1_e3 {
	width: 172px;
}
#lt2_l2_e1 {
	width: 172px;
}
#lt2_l2_e2 {
	width: 172px;
}
#lt2_l2_e3 {
	width: 172px;
}
#lt2_l3_e1 {
	width: 172px;
}
#lt2_l3_e2 {
	width: 172px;
}
#lt2_l3_e3 {
	width: 172px;
}
#lt2_l4_e1 {
	width: 172px;
}
#lt2_l4_e2 {
	width: 172px;
}
#lt2_l4_e3 {
	width: 172px;
}

#lt3_l1_e1 {
	width: 160px;
}
#lt3_l1_e2 {
	width: 360px;
}
#lt3_l2_e1 {
	width: 260px;
}
#lt3_l2_e2 {
	width: 260px;
}

#lt4_l1_e1 {
	width: 260px;
}
#lt4_l1_e2 {
	width: 260px;
}
#lt4_l2_e1 {
	width: 130px;
}
#lt4_l2_e2 {
	width: 130px;
}
#lt4_l2_e3 {
	width: 130px;
}
#lt4_l2_e4 {
	width: 130px;
}
#lt4_l3_e1 {
	width: 260px;
}
#lt4_l3_e2 {
	width: 260px;
}

.cont_line {
	margin-top: 12px;
	margin-left: 16px;
}
.cont_name {
	display: block;
	background-color: #ffffff00;
	font-size: 12px;
	color: #4B94F2;
}
.cont_text {
	display: block;
	width: calc(100% - 10px);
	height: 24px;
	background-color: #ffffff;
	text-align: left;
	font-size: 14px;
	padding: 0px 0px 0px 4px;
	margin: 2px 0px 0px 0px;
	border: 0px;
	outline: 1px solid #00000033;
}
#left_top_tab {
	display: block;
	width: 100%;
	height: 24px;
}
#left_top_cont {
	display: block;
	width: 100%;
	height: 214px;
}
#left_top_cont .cont_text {
	display: inline-block;
	vertical-align: top;
}

#bottom_tab {
	display: block;
	width: 100%;
	height: 24px;
}
#bottom_cont {
	display: block;
	width: calc(100% - 16px);
	height: 278px;
	padding: 8px;
}

table {
	width: 100%;
	border: 0px;
	border-collapse: collapse;
	background-color: #FFFFFF;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}
tr {
	text-align: center;
}

th {
	height: 26px;
	font-size: 11pt;
	font-weight: 900;
	color: #fff;
}
td {
	height: 21px;
	font-size: 9pt;
	margin-left: 6px;
	border-bottom: 1px solid #f0f0f0;
}
thead tr th {
	position: sticky;
	top: 0;
}
th:nth-child(odd) {
	background-color: #999999;
}
th:nth-child(even) {
	background-color: #939393;
}

td:nth-child(odd) {
	background-color: #fafafa;
}
td:nth-child(even) {
	background-color: #f6f6f6;
}

.td_cont {
	height: 21px;
	width: 100%;
	margin-top: 1px;
}

.tab_btn {
	display: inline-block;
	vertical-align: top;
	width: 80px;
	height: 22px;
	border: 1px solid #00000022;
	border-radius: 6px 6px 0px 0px;
	background-color: #FFF;
	color: #4B94F2;
	font-size: 8pt;
	text-align: center;
	line-height: 22px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

.func_btn {
	display: inline-block;
	vertical-align: bottom;
	width: 48px;
	height: 20px;
	border: 1px solid #00000022;
	border-radius: 4px 4px 0px 0px;
	font-size: 7pt;
	font-weight: 900;
	text-align: center;
	line-height: 22px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

#lt_edit_btn {
	background-color: #F2CB05;
	color: #222;
	float: right;
	margin-top: 2px;
}

#lt_edit_btn:hover {
	background-color: #F2B705;
	cursor: pointer;
}

#btm_add_btn {
	background-color: #4B94F2;
	color: #fff;
	float: right;
	margin-top: 2px;
	margin-left: 2px;
}

#btm_add_btn:hover {
	background-color: #2E83F2;
	cursor: pointer;
}

#btm_del_btn {
	background-color: #fe3a40;
	color: #fff;
	float: right;
	margin-top: 2px;
}

#btm_del_btn:hover {
	background-color: #ff1016;
	cursor: pointer;
}


.admnstr_btn {
	display: inline-block;
	vertical-align: bottom;
	width: 80px;
	height: 28px;
	border: 1px solid #00000022;
	border-radius: 4px;
	font-size: 9pt;
	font-weight: 900;
	text-align: center;
	line-height: 26px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

#a_list_btn {
	background-color: #4B94F2;
	color: #fff;
	float: right;
	margin-left: 2px;
}

#a_edit_btn {
	background-color: #F2CB05;
	color: #222;
	float: right;
}

/* 팝업 창 */
#human_info_edit_popup {
	/* 숨김용 */
	/* display: none; */
	/* 크기변경용 */
	width: 500px;
	height: 270px;
	top: calc(50% - 135px); /* 높이 반  */
	left: calc(50% - 250px); /* 너비 반 */
}

#slry_info_edit_popup {
	/* 숨김용 */
	/* display: none; */
	/* 크기변경용 */
	width: 520px;
	height: 240px;
	top: calc(50% - 120px); /* 높이 반  */
	left: calc(50% - 260px); /* 너비 반 */
}

#add_info_edit_popup {
	/* 숨김용 */
	/* display: none; */
	/* 크기변경용 */
	width: 520px;
	height: 240px;
	top: calc(50% - 120px); /* 높이 반  */
	left: calc(50% - 260px); /* 너비 반 */
}

/* 팝업 내용 */

.popup_cont_element {
	display: inline-block;
	vertical-align: top;
	height: 26px;
	width: 100%;
	margin: 0px 0px 10px 0px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

.popup_cont_name {
	display: inline-block;
	vertical-align: center;
	height: 24px;
	width: 72px;
	line-height: 24px;
	margin-left: 6px;
	margin-right: 6px;
	background-color: #ffffff00;
	font-size: 12px;
	color: #444444;
}
.popup_cont_text {
	display: inline-block;
	vertical-align: center;
	width: calc(100% - 98px);
	height: 24px;
	background-color: #ffffff;
	text-align: left;
	font-size: 12px;
	padding: 0px 0px 0px 4px;
	margin: 2px 0px 0px 0px;
	border: 0px;
	outline: 1px solid #00000033;
}

#slry_info_edit_popup .popup_cont_name {
	width: 120px;
}
#slry_info_edit_popup .popup_cont_text {
	width: calc(100% - 146px);
}
#edit_lt3_e4 #edit_bnk_copy {
	width: calc(100% - 216px);
}

#add_info_edit_popup .popup_cont_name {
	width: 56px;
}
#add_info_edit_popup .popup_cont_text {
	width: calc(50% - 83px);
	margin-right: 10px;
}

#add_grdtn_crtft {
	width: calc(100% - 166px);
}

#cr_add_popup .popup_cont_name {
	width: 80px;
}
#cr_add_popup .popup_cont_text {
	width: calc(100% - 106px);
}

#qlfctn_add_popup #add_copy_file {
	width: calc(100% - 166px);
}

.upld_btn {
	display: inline-block;
	vertical-align: bottom;
	width: 60px;
	height: 24px;
	font-size: 8pt;
	text-align: center;
	line-height: 22px;
	outline: 1px solid #bbbbbb;
	border-radius: 2px;
	background-color: #dddddd;
	margin-left: 4px;
}
.upld_btn:hover {
	background-color: #d6d6d6;
	cursor: pointer;
}
</style>
<script type="text/javascript">
function tabBtnSelected(obj) {
	$(obj).parents(".tab_bar").children(".tab_btn").css("background-color", "#FFF");
	$(obj).parents(".tab_bar").children(".tab_btn").css("color", "#4B94F2");
	$(obj).css("background-color", "#4B94F2");
	$(obj).css("color", "#FFF");
} 

// 탭 내용 전환
function tabContChange(tId, data, dataList) {
	var check = -1;
	var html = "";
	
	switch (tId) {
	// 인적정보
	case "human_info_btn" :
		console.log("인적정보 탭");
		html += "	<div class=\"cont_line\">                                                                                            ";
		html += "	<div class=\"cont_element\" id=\"lt1_l1_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">주민등록번호</div>                                                                      ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsdnt_rgstn_num\" readonly=\"readonly\" value=\"";
		var brthdt = data.BRTHDT.split("-");
		var year = brthdt[0].slice(-2, 4);
		html += year + brthdt[1] + brthdt[2] + "-";
		if (data.GNDR == 0) {
			if (brthdt[0] < 2000) {
				html += "1";
			} else {
				html += "3";
			}
		} else {
			if (brthdt[0] < 2000) {
				html += "2";
			} else {
				html += "4";
			}
		}
		html += "******" + "\" />";
		html += "	</div>                                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l1_e2\">                                                                         ";
		html += "		<div class=\"cont_name\">생년월일</div>                                                                          ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"brthdt\" readonly=\"readonly\" value=\"";
		html += brthdt[0] + "년 " + brthdt[1] + "월 " + brthdt[2] + "일";
		html += "\" />        ";
		html += "	</div>                                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l1_e3\">                                                                         ";
		html += "		<div class=\"cont_name\">성별</div>                                                                              ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"gndr\" readonly=\"readonly\" value=\"";
		if (data.GNDR == 0) {
			html += "남";
		} else {
			html += "여";
		}
		html += "\" />                       ";
		html += "	</div>                                                                                                               ";
		html += "</div>                                                                                                                  ";
		html += "<br/>                                                                                                                   ";
		html += "<div class=\"cont_line\">                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l2_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">E-mail</div>                                                                            ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"email\" readonly=\"readonly\" value=\"";
		html += data.EMAIL;
		html += "\" />       ";
		html += "	</div>                                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l2_e2\">                                                                         ";
		html += "		<div class=\"cont_name\">최종학력</div>                                                                          ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"final_edctn_level\" readonly=\"readonly\" value=\"\" /> ";
		html += "	</div>                                                                                                               ";
		html += "</div>                                                                                                                  ";
		html += "<br/>                                                                                                                   ";
		html += "<div class=\"cont_line\">                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l3_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">주소</div>                                                                              ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"adrs\" readonly=\"readonly\" value=\"";
		html += data.ADRS + " " + data.DTL_ADRS;
		html += "\" />";
		html += "	</div>                                                                                                               ";
		html += "</div>                                                                                                                  ";
		html += "<br/>                                                                                                                   ";
		html += "<div class=\"cont_line\">                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l4_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">전화번호</div>                                                                          ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"tlphn_num\" readonly=\"readonly\" value=\"";
		if (data.PHONE_NUM != null) {
			html += data.PHONE_NUM;
		} else {
			html += "-";
		}
		html += "\" />                    ";
		html += "	</div>                                                                                                               ";
		html += "	<div class=\"cont_element\" id=\"lt1_l4_e2\">                                                                         ";
		html += "		<div class=\"cont_name\">휴대폰번호</div>                                                                        ";
		html += "		<br/>                                                                                                            ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"mbl_num\" readonly=\"readonly\" value=\"";
		html += data.MBL_NUM;
		html += "\" />         ";
		html += "	</div>                                                                                                               ";
		html += "</div>                                                                                                                  ";
		$("#lt_edit_btn").show();
		$("#left_top_cont").html(html);
		check = 0;
		break;
	
	// 재직정보
	case "work_info_btn" :
		console.log("재직정보 탭");
		html += "	<div class=\"cont_line\">                                                                                      ";
		html += "	<div class=\"cont_element\" id=\"lt2_l1_e1\">                                                                  ";
		html += "		<div class=\"cont_name\">고용형태</div>                                                                    ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsdnt_rgstn_num\" readonly=\"readonly\" value=\"";
		if (data.HIRE_TYPE == 0) {
			html += "정규직";
		}
		else if (data.HIRE_TYPE == 1) {
			html += "계약직";
		} else {
			html += "기타";
		}
		html += "\" />  ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l1_e2\">                                                                  ";
		html += "		<div class=\"cont_name\">직종</div>                                                                        ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"brthdt\" readonly=\"readonly\" value=\"xxx\" />           ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l1_e3\">                                                                  ";
		html += "		<div class=\"cont_name\">급여형태</div>                                                                    ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"gndr\" readonly=\"readonly\" value=\"xxx\" />                   ";
		html += "	</div>                                                                                                         ";
		html += "</div>                                                                                                            ";
		html += "<br/>                                                                                                             ";
		html += "<div class=\"cont_line\">                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l2_e1\">                                                                  ";
		html += "		<div class=\"cont_name\">직급</div>                                                                        ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsdnt_rgstn_num\" readonly=\"readonly\" value=\"xxx\" />        ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l2_e2\">                                                                  ";
		html += "		<div class=\"cont_name\">직책</div>                                                                        ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"brthdt\" readonly=\"readonly\" value=\"xxx\" />                 ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l2_e3\">                                                                  ";
		html += "		<div class=\"cont_name\">직무</div>                                                                        ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"gndr\" readonly=\"readonly\" value=\"xxx\" />                   ";
		html += "	</div>                                                                                                         ";
		html += "</div>                                                                                                            ";
		html += "<br/>                                                                                                             ";
		html += "<div class=\"cont_line\">                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l3_e1\">                                                                  ";
		html += "		<div class=\"cont_name\">재직구분</div>                                                                    ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsdnt_rgstn_num\" readonly=\"readonly\" value=\"";
		if (data.WORK_TYPE == 1) {
			html += '재직';
		} else {
			html += '퇴사';
		}
		html += "\" />    ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l3_e2\">                                                                  ";
		html += "		<div class=\"cont_name\">입사일</div>                                                                      ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"join_date\" readonly=\"readonly\" value=\"";
		html += data.JOIN_DATE;
		html += "\" />   ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l3_e3\">                                                                  ";
		html += "		<div class=\"cont_name\">퇴사일</div>                                                                      ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsgnt_date\" readonly=\"readonly\" value=\"";
		html += data.RSGNT_DATE;
		html += "\" />                   ";
		html += "	</div>                                                                                                         ";
		html += "</div>                                                                                                            ";
		html += "<br/>                                                                                                             ";
		html += "<div class=\"cont_line\">                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l4_e1\">                                                                  ";
		html += "		<div class=\"cont_name\">수습여부</div>                                                                    ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"rsdnt_rgstn_num\" readonly=\"readonly\" value=\"";
		if (data.PRBTN_CHECK == 0) {
			html += "N";
		} else {
			html += "Y";
		}
		html += "\" />       ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l4_e2\">                                                                  ";
		html += "		<div class=\"cont_name\">수습만료일</div>                                                                  ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"brthdt\" readonly=\"readonly\" value=\"xxx\" />                 ";
		html += "	</div>                                                                                                         ";
		html += "	<div class=\"cont_element\" id=\"lt2_l4_e3\">                                                                  ";
		html += "		<div class=\"cont_name\">퇴사사유</div>                                                                    ";
		html += "		<br/>                                                                                                      ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"gndr\" readonly=\"readonly\" value=\"\" />                   ";
		html += "	</div>                                                                                                         ";
		html += "</div>                                                                                                            ";
		$("#lt_edit_btn").hide();
		$("#left_top_cont").html(html);
		check = 0;
		break;
	
	// 급여정보
	case "slry_info_btn" :
		console.log("급여정보 탭");
		html += "	<div class=\"cont_line\">";
		html += "	<div class=\"cont_element\" id=\"lt3_l1_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">급여이체은행</div>                                                                       ";
		html += "		<br/>                                                                                                             ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"slry_trnsf_bank\" readonly=\"readonly\" value=\"";
		if (data != null && data.BANK_NAME != null) {
			html += data.BANK_NAME;
		} else {
			html += "-";
		}
		html += "\" />       ";
		html += "	</div>                                                                                                                ";
		html += "	<div class=\"cont_element\" id=\"lt3_l1_e2\">                                                                         ";
		html += "		<div class=\"cont_name\">급여이체계좌번호</div>                                                                   ";
		html += "		<br/>                                                                                                             ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"slry_trnsf_acnt\" readonly=\"readonly\" value=\"";
		if (data != null && data.ACNT_NUM != null) {
			html += data.ACNT_NUM;
		} else {
			html += "-";
		}
		html += "\" /> ";
		html += "	</div>                                                                                                                ";
		html += "</div>                                                                                                                   ";
		html += "<br/>                                                                                                                    ";
		html += "<div class=\"cont_line\">                                                                                                ";
		html += "	<div class=\"cont_element\" id=\"lt3_l2_e1\">                                                                         ";
		html += "		<div class=\"cont_name\">예금주</div>                                                                             ";
		html += "		<br/>                                                                                                             ";
		html += "		<input type=\"text\" class=\"cont_text\" id=\"dpstr\" readonly=\"readonly\" value=\"";
		if (data != null && data.DPSTR != null) {
			html += data.DPSTR;
		} else {
			html += "-";
		}
		html += "\" />                   ";
		html += "	</div>                                                                                                                ";
		html += "</div>                                                                                                                   ";
		$("#lt_edit_btn").show();
		$("#left_top_cont").html(html);
		check = 0;
		break;
		
	// 학력사항
	case "edctn_level_btn" :
		console.log("학력사항 탭");
		html += "<table id=\"btm1_table\">                                   ";
		html += "<colgroup>                                                  ";
		html += "<col width=\"25%\" />                                       ";
		html += "<col width=\"30%\" />                                       ";
		html += "<col width=\"30%\" />                                       ";
		html += "<col width=\"15%\" />                                       ";
		html += "	<thead>                                                  ";
		html += "		<tr>                                                 ";
		html += "			<th>학교명</th>                                  ";
		html += "			<th>입학일</th>                                  ";
		html += "			<th>졸업일</th>                                  ";
		html += "			<th>학점</th>                                    ";
		html += "		</tr>                                                ";
		html += "	</thead>                                                 ";
		html += "	<tbody>                                                  ";
		
		for (var dl of dataList) {
			html += "		<tr class=\"table_item\" no=\"" + dl.EDCTN_LEVEL_NUM + "\">                            ";
			html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
			html += "			<input type=\"hidden\" class=\"val_existed\" value=\"true\" />        ";
			html += "			<td><div class=\"td_cont\">" + dl.SCHL_NAME + "</div></td> ";
			html += "			<td><div class=\"td_cont\">" + dl.ADMSN_DATE + "</div></td> ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.GRDTN_DATE != null) {
				html += dl.GRDTN_DATE;
			}
			html += "</div></td> ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.GRADE != null) {
				html += dl.GRADE + " / 4.5";
			}
			html += "</div></td>  ";
			html += "		</tr>                                                ";
		}
		if (dataList.length < 10) {
			for (var i = dataList.length; i < 10; i++) {
				html += "		<tr class=\"table_item\">                            ";
				html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
				html += "			<input type=\"hidden\" class=\"val_existed\" value=\"false\" />        ";
				html += "			<td><div class=\"td_cont\"></div></td> ";
				html += "			<td><div class=\"td_cont\"></div></td> ";
				html += "			<td><div class=\"td_cont\"></div></td> ";
				html += "			<td><div class=\"td_cont\"></div></td>           ";
				html += "		</tr>                                                ";
			}
		}
		
		html += "	</tbody>                                                 ";
		html += "</table>                                                    ";

		$("#bottom_cont #table_area").html(html);
		check = 1;
		break;
		
	// 경력사항
	case "cr_btn" :
		console.log("경력사항 탭");
		html += "<table id=\"btm2_table\">                                                   ";
		html += "<colgroup>                                                                  ";
		html += "<col width=\"18%\" />                                                       ";
		html += "<col width=\"28%\" />                                                       ";
		html += "<col width=\"14%\" />                                                       ";
		html += "<col width=\"14%\" />                                                       ";
		html += "<col width=\"14%\" />                                                       ";
		html += "	<thead>                                                                  ";
		html += "		<tr>                                                                 ";
		html += "			<th>회사(단체)명</th>                                            ";
		html += "			<th>근무기간</th>                                                ";
		html += "			<th>소속부서</th>                                                ";
		html += "			<th>직위</th>                                                    ";
		html += "			<th>직무</th>                                                    ";
		html += "		</tr>                                                                ";
		html += "	</thead>                                                                 ";
		html += "	<tbody>                                                                  ";
		
		for (var dl of dataList) {
			html += "		<tr class=\"table_item\" no=\"" + dl.CR_NUM + "\">                                            ";
			html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
			html += "			<input type=\"hidden\" class=\"val_existed\" value=\"true\" />        ";
			html += "			<td><div class=\"td_cont\">" + dl.CMPNY_NAME + "</div></td>                   ";
			html += "			<td><div class=\"td_cont\">" + dl.JOIN_DATE + " ~ " + dl.RSGNT_DATE + "</div></td>    ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.DEPT != null) {
				html += dl.DEPT;
			}
			html += "</div></td>                     ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.PSTN != null) {
				html += dl.PSTN;
			}
			html += "</div></td>                       ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.JOB != null) {
				html += dl.JOB;
			}
			html += "</div></td>                    ";
			html += "		</tr>                                                                ";
		}
		if (dataList.length < 10) {
			for (var i = dataList.length; i < 10; i++) {
				html += "		<tr class=\"table_item\">                                            ";
				html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
				html += "			<input type=\"hidden\" class=\"val_existed\" value=\"false\" />        ";
				html += "			<td><div class=\"td_cont\"></div></td>                     ";
				html += "			<td><div class=\"td_cont\"></div></td>    ";
				html += "			<td><div class=\"td_cont\"></div></td>                     ";
				html += "			<td><div class=\"td_cont\"></div></td>                       ";
				html += "			<td><div class=\"td_cont\"></div></td>                    ";
				html += "		</tr>                                                                ";
			}
		}
		
		html += "	</tbody>                                                                 ";
		html += "</table>                                                                    ";
		
		$("#bottom_cont #table_area").html(html);
		check = 1;
		break;
		
		
	// 자격사항
	case "qlfctn_btn" :
		console.log("자격사항 탭");
		html += "<table id=\"btm3_table\">                                   ";
		html += "<colgroup>                                                  ";
		html += "<col width=\"24%\" />                                       ";
		html += "<col width=\"18%\" />                                       ";
		html += "<col width=\"22%\" />                                       ";
		html += "<col width=\"18%\" />                                       ";
		html += "<col width=\"18%\" />                                       ";
		html += "	<thead>                                                  ";
		html += "		<tr>                                                 ";
		html += "			<th>자격(면허)증명</th>                          ";
		html += "			<th>취득일자</th>                                ";
		html += "			<th>발급기관</th>                                ";
		html += "			<th>취득점수</th>                                ";
		html += "			<th>만료기한</th>                                ";
		html += "		</tr>                                                ";
		html += "	</thead>                                                 ";
		html += "	<tbody>                                                  ";
		
		for (var dl of dataList) {
			html += "		<tr class=\"table_item\" no=\"" + dl.LCNS_NUM + "\">                            ";
			html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
			html += "			<input type=\"hidden\" class=\"val_existed\" value=\"true\" />        ";
			html += "			<td><div class=\"td_cont\">" + dl.LCNS_NAME + "</div></td>      ";
			html += "			<td><div class=\"td_cont\">" + dl.ACQRMNT_DATE + "</div></td> ";
			html += "			<td><div class=\"td_cont\">" + dl.ISSUE_ORGNZT + "</div></td>        ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.ACQRMNT_SCORE != null) {
				html += dl.ACQRMNT_SCORE;
			}
			html += "</div></td>        ";
			html += "			<td><div class=\"td_cont\">";
			if (dl.EXPRTN_DATE != null) {
				html += dl.EXPRTN_DATE;
			}
			html += "</div></td> ";
			html += "		</tr>                                                ";
		}
		
		if (dataList.length < 10) {
			for (var i = dataList.length; i < 10; i++) {
				html += "		<tr class=\"table_item\">                            ";
				html += "			<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
				html += "			<input type=\"hidden\" class=\"val_existed\" value=\"false\" />        ";
				html += "			<td><div class=\"td_cont\"></div></td>";
				html += "			<td><div class=\"td_cont\"></div></td> ";
				html += "			<td><div class=\"td_cont\"></div></td>    ";
				html += "			<td><div class=\"td_cont\"></div></td>           ";
				html += "			<td><div class=\"td_cont\"></div></td>           ";
				html += "		</tr>                                                ";
			}
		}
		
		html += "	</tbody>                                                 ";
		html += "</table>                                                    ";
		
		$("#bottom_cont #table_area").html(html);
		check = 1;
		break;
	}
	
	if (check == 0) { // 상단탭
		$("#selectedTopTab").val(tId);
	} else {
		$("#selectedBottomTab").val(tId);
	}
}

function createAddPopup(pId) {
	console.log(pId);
	var title = "";
	var html = "";
	var size = [520, 320]; // [width, height]
	
	html += "<form action=\"#\" id=\"addForm\" method=\"post\">";
	html += "<input type=\"hidden\" class=\"popup_id\" name=\"popup_id\" value=\"" + pId + "\" />";
	html += "<input type=\"hidden\" name=\"empNum\" value=\"" + $("#nEmpNum").val() + "\" />";
	
	switch (pId) {
	case "edctn_level_btn" :
		title = "학력사항 추가";

		html += "	<div class=\"popup_cont\" id=\"edctn_level_add_popup\" >                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e1\">                                                                                        ";
		html += "			<label for=\"add_schl_name\" class=\"popup_cont_name\">학교명 :</label>                                                                   ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_schl_name\" name=\"schl_name\" placeholder=\"학교명\" />                                             ";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e2\">                                                                                        ";
		html += "			<label for=\"add_admsn_day\" class=\"popup_cont_name\">입학일 :</label>                                                                   ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_admsn_date\" name=\"admsn_date\" />                   ";
		html += "			<div class=\"prd_sel_btn\" id=\"admsn_day_btn\"></div>                                                                                    ";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e3\">                                                                                        ";
		html += "			<label for=\"add_grdtn_day\" class=\"popup_cont_name\">졸업일 :</label>                                                                   ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_grdtn_date\" name=\"grdtn_date\" />                   ";
		html += "			<div class=\"prd_sel_btn\" id=\"grdtn_day_btn\"></div>                                                                                    ";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e4\">                                                                                        ";
		html += "			<label for=\"add_grade\" class=\"popup_cont_name\">학점 :</label>                                                                         ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_grade\" name=\"grade\" placeholder=\"학점\" />                                                   ";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e5\">                                                                                        ";
		html += "			<label for=\"add_clsftn\" class=\"popup_cont_name\">학적구분 :</label>                                                                    ";
		html += "		<select class=\"popup_cont_text\" id=\"add_schl_regstr_dvsn\" name=\"schl_regstr_dvsn\">";
		html += "				<option value=\"0\" selected>졸업</option>";
		html += "			<option value=\"1\">수료</option>";
		html += "			<option value=\"2\">휴학</option>";
		html += "			<option value=\"3\">퇴학</option>";
		html += "		</select>";
		html += "		</div>                                                                                                                                        ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm1_e6\">                                                                                        ";
		html += "			<label for=\"add_grdtn_crtft\" class=\"popup_cont_name\">졸업증명서 :</label>                                                             ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_grdtn_crtft\" name=\"grdtn_crtft\" placeholder=\"졸업증명서 파일 업로드\" readonly=\"readonly\" />     ";
		html += "			<div class=\"upld_btn\">업로드</div>                                                                                                      ";
		html += "		</div>                                                                                                                                        ";
		html += "	</div>                                                                                                                                            ";
		break;
		
	case "cr_btn" :
		title = "경력사항 추가";
		
		html += "	<div class=\"popup_cont\" id=\"cr_add_popup\" >                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e1\">                                                                         ";
		html += "			<label for=\"add_cmpny_name\" class=\"popup_cont_name\">회사(단체)명 :</label>                                             ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_cmpny_name\" name=\"cmpny_name\" placeholder=\"회사(단체)명\" />                       ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e2\">                                                                         ";
		html += "			<label for=\"add_join_day\" class=\"popup_cont_name\">입사일 :</label>                                                     ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_join_date\" name=\"join_date\" />     ";
		html += "			<div class=\"prd_sel_btn\" id=\"join_day_btn\"></div>                                                                      ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e3\">                                                                         ";
		html += "			<label for=\"add_rsgnt_day\" class=\"popup_cont_name\">퇴사일 :</label>                                                    ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_rsgnt_date\" name=\"rsgnt_date\" />    ";
		html += "			<div class=\"prd_sel_btn\" id=\"rsgnt_day_btn\"></div>                                                                     ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e4\">                                                                         ";
		html += "			<label for=\"add_afltn_dprtmn\" class=\"popup_cont_name\">소속부서 :</label>                                               ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_dept\" name=\"dept\" placeholder=\"소속부서\" />                         ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e5\">                                                                         ";
		html += "			<label for=\"add_pstn\" class=\"popup_cont_name\">직위 :</label>                                                           ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_pstn\" name=\"pstn\" placeholder=\"직위\" />                                     ";
		html += "		</div>                                                                                                                         ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm2_e6\">                                                                         ";
		html += "			<label for=\"add_job\" class=\"popup_cont_name\">직무 :</label>                                                            ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_job\" name=\"job\" placeholder=\"직무\" />                                      ";
		html += "		</div>                                                                                                                         ";
		html += "	</div>                                                                                                                             ";
		break;
		
	case "qlfctn_btn" :
		title = "자격사항 추가";

		html += "	<div class=\"popup_cont\" id=\"qlfctn_add_popup\" >                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e1\">                                                                               ";
		html += "			<label for=\"add_lcns_name\" class=\"popup_cont_name\">자격증명 :</label>                                                        ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_lcns_name\" name=\"lcns_name\" placeholder=\"자격증명\" />                                  ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e2\">                                                                               ";
		html += "			<label for=\"add_acqrmnt_day\" class=\"popup_cont_name\">취득일자 :</label>                                                      ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_acqrmnt_date\" name=\"acqrmnt_date\" />        ";
		html += "			<div class=\"prd_sel_btn\" id=\"acqrmnt_day_btn\"></div>                                                                         ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e3\">                                                                               ";
		html += "			<label for=\"add_issue_inst\" class=\"popup_cont_name\">발급기관 :</label>                                                       ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_issue_orgnzt\" name=\"issue_orgnzt\" placeholder=\"발급기관\" />                                 ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e4\">                                                                               ";
		html += "			<label for=\"add_score\" class=\"popup_cont_name\">취득점수 :</label>                                                            ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_acqrmnt_score\" name=\"acqrmnt_score\" placeholder=\"취득점수\" />                                      ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e5\">                                                                               ";
		html += "			<label for=\"add_exprtn_day\" class=\"popup_cont_name\">만료기한 :</label>                                                       ";
		html += "			<input type=\"date\" class=\"popup_cont_text\" id=\"add_exprtn_date\" name=\"exprtn_date\" />         ";
		html += "			<div class=\"prd_sel_btn\" id=\"exprtn_btn_day\"></div>                                                                          ";
		html += "		</div>                                                                                                                               ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_btm3_e6\">                                                                               ";
		html += "			<label for=\"add_evdnc\" class=\"popup_cont_name\">증빙자료 :</label>                                                            ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"add_copy_file\" name=\"copy_file\" placeholder=\"자격사항 증빙자료 업로드\" readonly=\"readonly\" />     ";
		html += "			<div class=\"upld_btn\">업로드</div>                                                                                             ";
		html += "		</div>                                                                                                                               ";
		html += "	</div>                                                                                                                             ";
		break;
	}
	
	html += "</form>";
	
	makePopup({
		bg : true,
		bgClose : false,
		width : size[0],
		height : size[1],
		title : title,
		contents : html,
		buttons : [{
			name : "추가",
			func:function() {
				var flag = false;

				$(".popup_cont_element input").css("outline", "1px solid #00000033");
				switch (pId) {
				case "edctn_level_btn" :
					if (checkEmpty("#add_schl_name")) {
						$("#add_schl_name").css("outline", "2px solid #fe3a40");
						$("#add_schl_name").focus();
					} else if (checkEmpty("#add_admsn_date")) {
						$("#add_admsn_date").css("outline", "2px solid #fe3a40");
						$("#add_admsn_date").focus();
					} else if (checkEmpty("#add_schl_regstr_dvsn")) {
						$("#add_schl_regstr_dvsn").css("outline", "2px solid #fe3a40");
						$("#add_schl_regstr_dvsn").focus();
					} else {
						flag = true;
					}
					break;
					
				case "cr_btn" :
					if (checkEmpty("#add_cmpny_name")) {
						$("#add_cmpny_name").css("outline", "2px solid #fe3a40");
						$("#add_cmpny_name").focus();
					} else if (checkEmpty("#add_join_date")) {
						$("#add_join_date").css("outline", "2px solid #fe3a40");
						$("#add_join_date").focus();
					} else if (checkEmpty("#add_rsgnt_date")) {
						$("#add_rsgnt_date").css("outline", "2px solid #fe3a40");
						$("#add_rsgnt_date").focus();
					} else {
						flag = true;
					}
					break;
					
				case "qlfctn_btn" :
					if (checkEmpty("#add_lcns_name")) {
						$("#add_lcns_name").css("outline", "2px solid #fe3a40");
						$("#add_lcns_name").focus();
					} else if (checkEmpty("#add_acqrmnt_date")) {
						$("#add_acqrmnt_date").css("outline", "2px solid #fe3a40");
						$("#add_acqrmnt_date").focus();
					} else if (checkEmpty("#add_issue_orgnzt")) {
						$("#add_issue_orgnzt").css("outline", "2px solid #fe3a40");
						$("#add_issue_orgnzt").focus();
					} else {
						flag = true;
					}
					break;
				}
				if (flag) {
					var params = $("#addForm").serialize();
					
					$.ajax({
						type : "post",
						url : "prsnlCardActionAjax/insert",
						dataType : "json",
						data : params,
						success : function(res) {
							if (res.res == "success") {
								var params = $("#bottomTabForm").serialize();
								reloadTab(params);
								closePopup();
								makeAlert("작업 완료", "추가되었습니다.");
							} else {
								makeAlert("작업 실패", "작업 중 문제가 발생했습니다.<br/>관리자에게 문의하세요.");
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

function createEditPopup(pId) {
	console.log(pId);
	var html = "";
	
	switch (pId) {
	case "human_info_btn" :
		html += "<div class=\"popup_bg\"></div>                                                                                               ";
		html += "<div class=\"popup\" id=\"human_info_edit_popup\">                                                                           ";
		html += "	<div class=\"popup_title\">인적정보 수정</div>                                                                            ";
		html += "	<div class=\"popup_cont\">                                                                                                ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e1\">                                                                 ";
		html += "			<label for=\"edit_email\" class=\"popup_cont_name\">E-mail :</label>                                              ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_email\" placeholder=\"jhk7951@gmail.com\" />             ";
		html += "		</div>                                                                                                                ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e2\">                                                                 ";
		html += "			<label for=\"edit_adrs_1\" class=\"popup_cont_name\">주소 :</label>                                               ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_adrs_1\" placeholder=\"서울특별시 구로구 경인로27길\" /> ";
		html += "		</div>                                                                                                                ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e3\">                                                                 ";
		html += "			<label for=\"edit_adrs_2\" class=\"popup_cont_name\">상세주소 :</label>                                           ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_adrs_2\" />                                              ";
		html += "		</div>                                                                                                                ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e4\">                                                                 ";
		html += "			<label for=\"edit_tlphn_num\" class=\"popup_cont_name\">전화번호 : </label>                                       ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_tlphn_num\" />                                           ";
		html += "		</div>                                                                                                                ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt1_e5\">                                                                 ";
		html += "			<label for=\"edit_mbl_num\" class=\"popup_cont_name\">휴대폰번호 :</label>                                        ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_mbl_num\" placeholder=\"010-1234-5678\" />               ";
		html += "		</div>                                                                                                                ";
		html += "	</div>                                                                                                                    ";
		html += "	<div class=\"popup_btn_area\">                                                                                            ";
		html += "			<div class=\"cmn_btn_mr\" id=\"human_info_edit_cnfrm_btn\">확인</div>                                             ";
		html += "			<div class=\"cmn_btn_mr\" id=\"cnl_btn\">취소</div>                                                               ";
		html += "	</div>                                                                                                                    ";
		html += "</div>                                                                                                                       ";

		$(".cont_area").append(html);
		
		$(".popup_bg, .popup").hide();
		$(".popup_bg, .popup").fadeIn();
		break;
		
	case "slry_info_btn" :
		html += "<div class=\"popup_bg\"></div>                                                                                                                   ";
		html += "<div class=\"popup\" id=\"slry_info_edit_popup\">                                                                                                ";
		html += "	<div class=\"popup_title\">급여정보 수정</div>                                                                                                ";
		html += "	<div class=\"popup_cont\">                                                                                                                    ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt3_e1\">                                                                                     ";
		html += "			<label for=\"edit_slry_trnsf_bank\" class=\"popup_cont_name\">급여이체은행 :</label>                                                  ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_slry_trnsf_bank\" placeholder=\"신한은행\" />                                ";
		html += "		</div>                                                                                                                                    ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt3_e2\">                                                                                     ";
		html += "			<label for=\"edit_slry_trnsf_acnt\" class=\"popup_cont_name\">급여이체계좌번호 :</label>                                              ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_slry_trnsf_acnt\" placeholder=\"110-123-456789\" />                          ";
		html += "		</div>                                                                                                                                    ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt3_e3\">                                                                                     ";
		html += "			<label for=\"edit_dpstr\" class=\"popup_cont_name\">예금주명 :</label>                                                                ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_dpstr\" placeholder=\"김정희\" />                                            ";
		html += "		</div>                                                                                                                                    ";
		html += "		<div class=\"popup_cont_element\" id=\"edit_lt3_e4\">                                                                                     ";
		html += "			<label for=\"edit_bnk_copy\" class=\"popup_cont_name\">통장사본 파일 :</label>                                                        ";
		html += "			<input type=\"text\" class=\"popup_cont_text\" id=\"edit_bnk_copy\" readonly=\"readonly\" placeholder=\"파일을 업로드해주세요\" />    ";
		html += "			<div class=\"upld_btn\">업로드</div>                                                                                                  ";
		html += "		</div>                                                                                                                                    ";
		html += "	</div>                                                                                                                                        ";
		html += "	<div class=\"popup_btn_area\">                                                                                                                ";
		html += "			<div class=\"cmn_btn_mr\" id=\"slry_info_edit_cnfrm_btn\">확인</div>                                                                  ";
		html += "			<div class=\"cmn_btn_mr\" id=\"cnl_btn\">취소</div>                                                                                   ";
		html += "	</div>                                                                                                                                        ";
		html += "</div>                                                                                                                                           ";
		
		$(".cont_area").append(html);
		
		$(".popup_bg, .popup").hide();
		$(".popup_bg, .popup").fadeIn();
		break;
	}
}

function createDelPopup(pId) {
	console.log(pId);
	
	$("#tabId").val($("#selectedBottomTab").val());
	
	var html = "";
	html += "	<div class=\"popup_cont\">                                                             ";
	html += "	선택하신 항목을 삭제하시겠습니까?                                                                      ";
	html += "	</div>                                                                                 ";

	makePopup({
		bg : true,
		bgClose : false,
		height : 140,
		title : "삭제 확인",
		contents : html,
		buttons : [{
			name : "확인",
			func:function() {
				var params = $("#deleteForm").serialize();
				console.log(params);
				
				$.ajax({
					type : "post",
					url : "prsnlCardActionAjax/delete",
					dataType : "json",
					data : params,
					success : function(res) {
						if (res.res == "success") {
							var params = $("#bottomTabForm").serialize();
							reloadTab(params);
							closePopup();
							makeAlert("작업 완료", "삭제되었습니다.");
						} else {
							makeAlert("작업 실패", "작업 중 문제가 발생했습니다.<br/>관리자에게 문의하세요.");
						}
					},
					error : function(request, status, error) {
						console.log(request.responseText);
					}
				});
			}
		}, {
			name : "취소"
		}]
	});
	
	switch (pId) {
	case "edctn_level_btn" :
		break;
	case "cr_btn" :
		break;
	case "qlfctn_btn" :
		break;
	}
}

function reloadTab(params) {
	console.log("***** reloadTab *****");
	
	$.ajax({
		type : "post",
		url : "prsnlCardTabAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log(res);
			console.log(res.tabName + "탭을 선택");
			$("#" + res.tabName).parent(".tab_bar").find(".tab_btn input[type=hidden]").val("false");
			$("#" + res.tabName).find("input[type=hidden]").val("true");
			tabBtnSelected("#" + res.tabName);
			tabContChange(res.tabName, res.tabData, res.tabDataList);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function btnSetting() {
	if ($("#btm_del_btn").attr("da") == "true") {
		$("#btm_del_btn").css("background-color", "#eeeeee");
		$("#btm_del_btn").css("color", "#999999");
	} else {
		$("#btm_del_btn").css("background-color", "#fe3a40");
		$("#btm_del_btn").css("color", "#fff");
	}
}

$(document).ready(function() {
	if (${basicInfoData.EMP_PCTR_FILE != null}) {
		$(".pctr_area").css("background-image", "url(\"" + ${basicInfoData.EMP_PCTR_FILE} + "\")");
		console.log("파일 있음");
	} else {
		$(".pctr_area").css("background-image", "url(\"" + "nullFile.png" + "\")");
		console.log("파일 없음");
	}
	
	$("#isAdmnstr").val(${is_admnstr});
	console.log("체크 : " + $("#isAdmnstr").val());
	
	$("#human_info_btn").css("background-color", "#4B94F2");
	$("#human_info_btn").css("color", "#FFF");
	$("#edctn_level_btn").css("background-color", "#4B94F2");
	$("#edctn_level_btn").css("color", "#FFF");
	
	if ($("#isAdmnstr").val() == "1") {
		$("#topTabAdmnstr").val($("#nEmpNum").val());
	}
	var params = $("#topTabForm").serialize();
	reloadTab(params);
	
	if ($("#isAdmnstr").val() == "1") {
		$("#bottomTabAdmnstr").val($("#nEmpNum").val());
	}
	var params = $("#bottomTabForm").serialize();
	reloadTab(params);
	
	btnSetting();
	
	$(".tab_btn").hover(function() {
		var state;
		if ($(this).find("input[type=hidden]").val() == "true") {
			state = true;
		} else {
			state = false;
		}
		if (!state) {
			$(this).css("background-color", "#dbebff");
			$(this).css("cursor", "pointer");
		}
	}, function() {
		var state;
		if ($(this).find("input[type=hidden]").val() == "true") {
			state = true;
		} else {
			state = false;
		}
		if (!state) {
			$(this).css("background-color", "#FFF");
			$(this).css("cursor", "default");
		}
	});
	$(".tab_btn").click(function() {
		var state;
		if ($(this).find("input[type=hidden]").val() == "true") {
			state = true;
		} else {
			state = false; 
		}
		if (state) {
			console.log("선택되어 있는 탭");
		} else {
			if ($(this).parent("div").attr("id") == "left_top_tab") {
				$("#selectedTopTab").val($(this).attr("id"));
				console.log($(this).attr("id"));
				console.log($(".isAdmnstr").val());
				if ($("#isAdmnstr").val() == "1") {
					$("#topTabAdmnstr").val($("#nEmpNum").val());
				}
				console.log($("#topTabAdmnstr").val());
				var params = $("#topTabForm").serialize();
			}
			else if ($(this).parent("div").attr("id") == "bottom_tab") {
				$("#selectedBottomTab").val($(this).attr("id"));
				console.log($(this).attr("id"));
				console.log($(".isAdmnstr").val());
				if ($("#isAdmnstr").val() == "1") {
					$("#bottomTabAdmnstr").val($("#nEmpNum").val());
				}
				console.log($("#bottomTabAdmnstr").val());
				var params = $("#bottomTabForm").serialize();
				$("#selItemNum").val("-1");
				if ($("#btm_del_btn").attr("da") == "false") {
					$("#btm_del_btn").attr("da", "true");
					btnSetting();
				}
			} else {
				console.log("이거 안됨");
			}
			reloadTab(params);
		}
	});
	
	
	$(".func_btn").on("mouseenter", function() {
		if ($(this).attr("da") == "false") {
			$(this).css("cursor", "pointer");
		}
	});	
	$(".func_btn").on("mouseleave", function() {
		$(this).css("cursor", "default");
	});
	

	$("#lt_edit_btn").click(function() {
		createEditPopup($(this).find("input[type=hidden]").val());
	});

	$("#btm_add_btn").click(function() {
		createAddPopup($("#selectedBottomTab").val());
	});
	
	$("#btm_del_btn").click(function() {
		if ($("#selItemNum").val() != "-1") {
			createDelPopup($("#selectedBottomTab").val());
		}
	});


	$(".cont_area").on("click", ".popup #cnl_btn", function() {
		$(".popup_bg, .popup").fadeOut(function() {
			$(".popup_bg, .popup").remove();
		});
	});
	
	$(".cont_area").on("click", ".popup #cnfrm_btn", function() {
		$(".popup_bg, .popup").fadeOut(function() {
			$(".popup_bg, .popup").remove();
		});
	});
	
	$("#table_area").slimScroll({height: "280px"});
	
	$("#table_area").on("mouseenter", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		if (state == "false") {
			$(this).children("td:nth-child(odd)").css("background-color", "#f3f3f3");
			$(this).children("td:nth-child(even)").css("background-color", "#efefef");
		}
	});
	
	$("#table_area").on("mouseleave", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		if (state == "false") {
			$(this).children("td:nth-child(odd)").css("background-color", "#fafafa");
			$(this).children("td:nth-child(even)").css("background-color", "#f6f6f6");
		}
	});
	$("#table_area").on("click", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		var flag = $(this).find(".val_existed").val();
		if (flag == "true") {
			if (state == "false") {
				$(this).parent("tbody").find(".table_item .item_selected").val("false");
				$(this).find(".item_selected").val("true");
				$("#selItemNum").val($(this).attr("no"));
				console.log("selected: " + $("#selItemNum").val());
				$("#btm_del_btn").attr("da", "false");
				btnSetting();
		
				$(this).parent("tbody").find(".table_item").children("td:nth-child(odd)").css("background-color", "#fafafa");
				$(this).parent("tbody").find(".table_item").children("td:nth-child(even)").css("background-color", "#f6f6f6");
				
				
				$(this).children("td").css("background-color", "#b3e0ff");
			} else {
				$(this).find(".item_selected").val("false");
				$("#selItemNum").val("-1");
				console.log("unselected");
				$("#btm_del_btn").attr("da", "true");
				btnSetting();
				
				$(this).children("td:nth-child(odd)").css("background-color", "#fafafa");
				$(this).children("td:nth-child(even)").css("background-color", "#f6f6f6");
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
			<c:choose>
				<c:when test="${is_admnstr eq '1'}">
					<div class="page_title_text">인사기록카드(관리자)</div>
				</c:when>
				<c:otherwise>
					<div class="page_title_text">인사기록카드</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${is_admnstr eq '1'}">
					<div class="admnstr_btn" id="a_list_btn" da="false">목록</div>
					<div class="admnstr_btn" id="a_edit_btn" da="false">수정</div>
				</c:when>
			</c:choose>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<input type="hidden" id="isAdmnstr" name="isAdmnstr" value="-1" />
			<input type="hidden" id="nEmpNum" name="nEmpNum" value="${basicInfoData.EMP_NUM}" />
			<form action="#" id="topTabForm" method="post">
				<input type="hidden" id="selectedTopTab" name="selectedTopTab" value="human_info_btn"/>
				<input type="hidden" id="topTabAdmnstr" name="admnstrNum" value="-1"/>
			</form>
			<form action="#" id="bottomTabForm" method="post">
				<input type="hidden" id="selectedBottomTab" name="selectedBottomTab" value="edctn_level_btn"/>
				<input type="hidden" id="bottomTabAdmnstr" name="admnstrNum" value="-1"/>
			</form>
			<form action="#" id="deleteForm" method="post">
				<input type="hidden" id="selItemNum" name="selItemNum" value="-1" />
				<input type="hidden" id="tabId" name="tabId" value="edctn_level_btn"/>
			</form>
			<div id="top_area">
				<div class="cont_wrap" id="left_top">
					<div class="tab_bar" id="left_top_tab">
						<div class="tab_btn" id="human_info_btn">인적정보<input type="hidden" value="true" /></div>
						<div class="tab_btn" id="work_info_btn">재직정보<input type="hidden" value="false" /></div>
						<div class="tab_btn" id="slry_info_btn">급여정보<input type="hidden" value="false" /></div>
						<div class="func_btn" id="lt_edit_btn" da="false">수정</div>
					</div>
					<div class="dtl_cont" id="left_top_cont">
						
					</div>
				</div>
				<div class="dtl_cont" id="right_top">
					<div id="basic_info_area">
						<div class="cont_line_rt">
							<div class="cont_element">
								<div class="cont_name">이름(한글)</div>
								<br/>
								<input type="text" class="cont_text" id="emp_name" readonly="readonly" value="${basicInfoData.EMP_NAME}" />
							</div>
						</div>
						<div class="cont_line_rt">
							<div class="cont_element">
								<div class="cont_name">이름(영문)</div>
								<br/>
								<input type="text" class="cont_text" id="emp_name_eng" readonly="readonly" value="${basicInfoData.EMP_NAME_ENG}" />
							</div>
						</div>
						<div class="cont_line_rt">
							<div class="cont_element">
								<div class="cont_name">소속부서</div>
								<input type="text" class="cont_text" id="dprtmn" readonly="readonly" value="${basicInfoData.DEPT_NAME}" />
								<br/>
							</div>
						</div>
						<div class="cont_line_rt">
							<div class="cont_element">
								<div class="cont_name">직급</div>
								<br/>
								<input type="text" class="cont_text" id="pstn" readonly="readonly" value="${basicInfoData.RANK_NAME}" />
							</div>
						</div>
					</div>
					<div id="basic_info_area_right">
					<div class="cont_line" id="rt_l1">
						<div class="cont_element" id="rt_l1_e1">
							<div class="cont_name">사원번호</div>
							<input type="text" class="cont_text" id="emp_num" readonly="readonly" value="${basicInfoData.EMP_NUM}" />
						</div>
					</div>
					<br/>
					<div id="pctr_area"></div>
					</div>
				</div>
			</div>
			<div id="bottom_area">
				<div class="cont_wrap" id="bottom">
					<div class="tab_bar" id="bottom_tab">
						<div class="tab_btn" id="edctn_level_btn">학력사항<input type="hidden" value="true" /></div>
						<div class="tab_btn" id="cr_btn">경력사항<input type="hidden" value="false" /></div>
						<div class="tab_btn" id="qlfctn_btn">자격사항<input type="hidden" value="false" /></div>
						<div class="func_btn" id="btm_add_btn" da="false">추가</div>
						<div class="func_btn" id="btm_del_btn" da="true">삭제</div>
					</div>
					<div class="dtl_cont" id="bottom_cont">
						<div id="table_area">
							
						</div>
					</div>
				</div>
			</div>
		</div> <!-- cont_area 끝 -->
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>