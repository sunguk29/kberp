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
	margin-left: 262px;
}

#info_txt {
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

[name="sucess_sel"] {
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
						<div class="clnt_info_Header">
							<div class="clnt_info">고객정보</div>
							<div class="srch_text_wrap clnt_srch">
								<input type="text" />
							</div>
							<div class="cmn_btn_ml">검색</div>
						</div>
		    			<div class="clnt_info_cont_row1">	  
			    			<div class="clnt_name">고객명</div>
			    				<input type="text" id="info_txt">
			    			<div class="clnt_grade">고객등급</div>
			    				<input type="text" id="info_txt">
			    		</div>
			    		<div class="clnt_info_cont_row2">	  
			    			<div class="ltl_cnsl_day">최근상담일</div>
			    				<input type="text" id="info_txt">
			    			<div class="phone_num_1">전화번호 1</div>
			    				<input type="text" id="info_txt">
			    		</div>	
		    			<div class="clnt_info_cont_row3">	  
			    			<div class="phone_num_2">전화번호 2</div>
			    				<input type="text" id="info_txt">
			    		</div>
			    		<div class="clnt_info_cont_row4">	  
			    			<div class="adrs">주소</div>
			    				<input class="adrs_input" type="text">
			    				<br/>
			    				<input class="adrs_input_dtls" type="text">
			    		</div>	
		    			<div class="cmn_btn_mr">저장</div>
		    		</div>
		    	</div> <!-- 고객정보 div 끝 -->
		    	
		    	<!-- 상담노트 파트 -->
		    	<div class="top">
		    		<div class="mid_area">
						<div class="cnsl_note_top">
							<div class="cnsl_note">상담노트</div>
							<div class="cmn_btn"><img alt="부서별연락처" src="images/cmn/call.png" id="imgs"></div>
							<div class="cmn_btn"><img alt="대응가이드" src="images/cmn/call_guide.png" id="imgs"></div>
						</div>
						<div class="mid_row1">
							<div class="cnsl_type">상담유형</div>
							<select name="big_sel">
								<option>대분류</option>
							</select>
							<select name="small_sel">
								<option>소분류</option>
							</select>
						</div>
						<div class="mid_row2">
							<div class="cnsl_note_cont">상담내용</div>
							<textarea class="cont_memo" rows="10" cols="42"></textarea>
						</div>
						<div class="mid_row3">
							<div class="cnsl_note_rslt">상담결과</div>
							<select name="sucess_sel">
								<option>완료</option>
								<option>미처리</option>
								<option>예약</option>
								<option>이관</option>
							</select>
							<div class="note_cmn_btn_mr">노트저장</div>
						</div>
					</div>
				</div>
			</div> <!-- top area div 끝 -->
			
			<!-- 상담이력 시작 -->
			<div class="call_area">
				<div class="bottom_1">
					<div class="cnsl_rcrd_header">
						<div class="cnsl_rcrd">상담이력</div>
						<div class="cnsl_rcrd_srch_text_wrap">
							<input type="text" />
						</div>
						<div class="cmn_btn_ml">검색</div>
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
							<tbody></tbody>
						</table>
					</div>
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