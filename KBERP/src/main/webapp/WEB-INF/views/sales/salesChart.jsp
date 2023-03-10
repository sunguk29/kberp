<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 보고서</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- highcharts Script -->
<script src="resources/script/highcharts/highcharts.js"></script>
<script src="resources/script/highcharts/modules/exporting.js"></script>
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
/* 상단 검색 영역 */
.srch_table {
	border-collapse: collapse;
	background-color: #f2f2f2;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px 50px 0;
}

.srch_table tr {
	height: 40px;
}
.srch_table td {
	padding: 10px 2px;
}

select {
	height: 23px;
	width: 150px;
	font-size: 12px;
}

.srch_name {
	margin: 0px 10px 0px 20px;
	font-weight: bold;
}

.srch_msg {
	height: 20px;
	width: 305px;
	font-size: 12px;
}
/* 직원검색 */
.findEmp_box {
	background-color: white;
	border : 1px solid #858585;
	height: 22px;
	width: 160px;
	border-radius : 1px;
	text-align: right;
}
.findEmp_box:hover {
	cursor: pointer;
}
.findEmp_box:active {
	background-color : white;
	outline : 1.5px solid #222222;
}
.userIcon{
	height: 15px;
	margin-top: 3px;
	margin-right : 5px;
}
#mngName {
	border: none;
	outline: none;
	font-size: 11pt;
	width: 118px;
	cursor: default;
	padding-bottom: 0px;
}
/*  팝업  */
.popup_title_mid {
	width: calc(100% + 20px);
	height: 70px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
    margin: -10px 0px 0px -10px;
}
.ptm_left {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 70px;
}
.ptm_left_top, .ptm_left_bot  {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot {
	width: 94px;
	height: 35px;
	line-height: 35px;
	text-align: left;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot2 {
	width: 94px;
    height: 32px;
    margin-top: 5px;
    text-align: center;
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
.ptm_mid_right0 {
	display: inline-block;
	vertical-align: top;
	width: 50px;
	height: 70px;
}
.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 185px;
	height: 70px;
}
.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 180px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.text_size1 {
	width: 123px;
	height: 19px;
	outline: none;
}
.text_size2 {
	width: 170px;
	height: 19px;
	margin-left : 12px;
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
/* 팝업 내용 부분 */
.popup_mng_box_in {
   width: calc(100% - 4px);
   height: 50px;
   border: 2px solid #d7d7d7;
   border-radius: 3px;
   background-color: #F2F2F2;
   margin-bottom: 5px;
}
.popup_box_left {
   display: inline-block;
   vertical-align: top;
   width: 120px;
   height: 50px;
}
.mngIcon {
   display: inline-block;
   width: 42px;
   height: 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.popup_mng_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
   line-height: 50px;
}
.boldMngName{
	margin-left: 30px;
	font-weight: bold;
}
.mg_wid {
	margin-left: 50px;
}
.popup_box_mng {
	height: 297px;
	padding-top: 8px;
}

/********** 제목 영역 **********/
.sales_text, .img_rect {
	display: inline-block;
	vertical-align: top;
	font-size: 11pt;
	font-weight: bold;
	color: #7b7b7b;
}

.sales_text {
	width: 100%;
}

.sales_text_top {
	display: inline-block;
}

/* 파란 줄 */
.prgrs_stage {
	background-color: #4B94F2;
	width: 100%;
	height: 2px;
}

/* 네모 이미지 */
.img_rect {
	width: 12px;
	height: 12px;
	padding-top: 4px;
	margin-right: 10px;
	margin-left: 10px;
}
/********** div 큰 영역  **********/
.new_sales_actvty {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 260px;
	margin-bottom: 30px; 
}

.sales_text_bot{
	width: 428px;
    height: 230px;
    border: 1px solid #000;
    margin-top: 10px;
    font-size: 11pt;
    position: relative;
}

/* 각 그래프 영역 크기 */
.bsns_type{
	width: 100%;
	height: 195px;
	margin : 0 auto;
}
.cont_right {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 100%;
}
.cont_left {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 100%;
	padding-right: 33.5px;		
}
.ingArea{
	font-size: 10pt;
	font-weight : bold;
}
.prgrs{
	font-size: 10pt;
    font-weight: bold;
    padding-left: 45px;
}
.cir {
	display: inline-block;
    width: 85px;
    height: 85px;
    border-radius: 50%;
    line-height: 85px;
    text-align: center;
    margin-top: 5px;
    margin-left: 45px;
}
.half_cir {
	display: inline-block;
    width: 50px;
    height: 35px;
    border-radius: 35px;
    line-height: 35px;
    text-align: center;
}
.rec {
	display: inline-block;
    background-color: #f2f3f5;
    border-right: 7px solid #e6e6e6;
    width: 180px;
    height: 54px;
    line-height: 54px;
    text-align: center;
    vertical-align: middle;
}
.actvty_tLine1 {
    background-color: #4B94F2;
    width: 100%;
    height: 2px;
}
.prgrs_step_img {
	display: inline-block;
	background-image: url(resources/images/sales/prgrs_step.png);
    background-size: 100px 280px;
    background-repeat: no-repeat;
    background-position: 0px center;
    width: 100px;
    height: 280px;
    margin-top: 10px;
}
.prgrs_step{
	display: inline-block;
	font-size: 10pt;
	font-weight : bold;
}
ul{
	display: inline-block;
	vertical-align : top;
	list-style: none;
	margin-top: 0;
}
.prgrs_step_cont{
	display:inline-block;
	width : 200px;
	height : 100px;
}
.step{	
	margin-top : 15px;
}
li span{
	margin-right : 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	getData();
	getPrgrsCnt();
	getPrgrsStepCnt();
	
	if('${param.mngNum}' != ''){
		$("#mngName").val(${param.mngName});
		$("#mngNum").val(${param.mngNum});
	}

	/* 엔터 입력 시  */
	$("#mngName").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$(".cmn_btn").click(); 
			
			return false;
		}
	});
	
	/* 검색 */
	$(".cmn_btn").on("click",function() {
		getData();
		getPrgrsCnt();
		getPrgrsStepCnt();
	});

	/* 담당자 팝업 */
	$("#mngBtn").on("click", function() {
		
		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += "<form action=\"#\" id=\"popupMngForm\">";
	 	html += "<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += "<div class=\"ptm_left\">";
		html += "<div class=\"ptm_left_top\">팀분류</div>";		
		html += "<div class=\"ptm_left_bot\">사원분류</div>";	
		html += "</div>";
		html += "<div class=\"ptm_mid\">";
		html += "<div class=\"ptm_mid_top\">";
		html += "<select class=\"sel_size\" name=\"deptS\">";
		html += "<option value=\"6\">영업부</option>";
		html += "<option value=\"7\">영업1팀</option>";
		html += "<option value=\"8\">영업2팀</option>";
		html += "</select>";
		html += "</div>";
		html += "<div class=\"ptm_mid_bot\">";
		html += "<select class=\"sel_size\" name=\"empS\">";
		html += "<option value=\"0\">사원번호</option>";
		html += "<option value=\"1\">사원명</option>";
		html += "</select>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"ptm_mid_right\">";
		html += "<div class=\"ptm_mid_right_top\"></div>";
		html += "<div class=\"ptm_mid_right_bot\">";
		html += "<input type=\"text\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" id=\"searchT\" name=\"searchT\" />";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"ptm_right\">";
		html += "<div class=\"ptm_right_top\"></div>";
		html += "<div class=\"ptm_right_bot\">";
		html += "<div class=\"cmn_btn\" id=\"meBtn\">검색</div>";
		html += "</div>";
		html += "</div>";
		html += "</form>";
		html += "</div>";
		html +=	"<div class=\"popup_box_mng\"></div>";
		html += "<div class=\"board_bottom\">     ";
		html += "<div class=\"pgn_area\"></div>   ";
		html += "</div>                         ";
		
		
		
		makePopup({
			depth : 1,
			bg : false,
			width : 600,
			height : 500,
			title : "담당자 조회",
			contents : html,
			contentsEvent : function() {
				
				drawMngList();
				
				$(".popup_box_mng").on("click", ".popup_mng_box_in", function() {
					var mng = $(this).children("#mng").val();
					var mge = $(this).children("#mge").val();
					$("#mngName").attr("value", mng);
					$("#mngNum").attr("value", mge);
					closePopup();
				});
				
				$("#meBtn").on("click", function () {
					$("#page").val("1");
					
					drawMngList();
					
				});
				
				$("#searchT").on("keypress", function(event) {
					if(event.keyCode == 13 ) {
						$("#meBtn").click();
						
						return false;
					}
				});
				
				$(".pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));

					drawMngList();
				});
			},
			buttons : {
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
		
	});
	
	/* 차트에 데이터 가져오기 */
	function getData() {
		var params = $("#getForm").serialize();
		$.ajax({
			type : "post",
			url : "salesgetChartDataAjax",
			dataType : "json",
			data: params,
			success : function(res) {
				makeChart(res.list);
			},
			error : function(request, status, error) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}

	/* 차트 그리기 */
	function makeChart(list) {
		console.log(list);
		$('.bsns_type').highcharts({
			chart: {
				type: 'pie',
				zoomType: 'x'
			},
			title: {
				text: ''
			},
		    credits: {
                enabled: false
            },
            plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                formatter: function() {
							if(this.y > 0) {
								return this.key + "(" + this.y + "명)";
							}
						}
		            },
		            showInLegend: true
		        }
		    },
			colors: ['#5CB3FF', '#D462FF', '#FBB917'],
	        series : [{
	        	name: '건 수',
	        	data : list,
	        	innerSize : '50%'
	        }]
		});
	}
	
	/* 진행상태 데이터 가져오기  */
	function getPrgrsCnt() {
		var params = $("#getForm").serialize();
		$.ajax({
			type : "post",
			url : "prgrsChartAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawPrgrsList(res.ingCnt, res.endCnt, res.failCnt, res.totalCnt);
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	}
	
	/* 진행단계 데이터 가져오기 */
	function getPrgrsStepCnt() {
		var params = $("#getForm").serialize();
		$.ajax({
			type : "post",
			url : "prgrsStepAjax",
			dataType: "json",
			data : params,
			success : function(res) {
				drawPrgrsStep(res.salesChncCnt, res.sgstnCnt, res.qtnCnt, res.cntrctCnt);
			},
			error : function(request,status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	}
	
	/*  내 영업 조회 */
	$("#salesCheck").on("click", function() {
		
		
		console.log("클릭됨");
		
		var checked = $("#salesCheck").is(':checked');
		
		if(checked) {
			$("#salesCheck").attr("value", 1);
			
			getData();
			getPrgrsCnt();
			getPrgrsStepCnt();
		} else {
			$("#salesCheck").attr("value", 0);
			
			getData();
			getPrgrsCnt();
			getPrgrsStepCnt();
		}
		
	});
}); //jqeury End

/* 진행상태 그리기  */
function drawPrgrsList(ingCnt, endCnt, failCnt, totalCnt) {
	var html = "";
	
	html += "<div class=\"cir\" style=\"background-color:rgb(255,194,54);\">진행중</div><div class=\"half_cir\" style=\"background-color:rgb(255,194,54);\">"+Math.round((ingCnt/totalCnt*100))+"%</div><div class = \"rec\">"+ingCnt+"건</div><br/>";
	html += "<div class=\"cir\" style=\"background-color:rgb(96,187,135);\">성공</div><div class=\"half_cir\" style=\"background-color:rgb(96,187,135);\">"+Math.round((endCnt/totalCnt*100))+"%</div><div class = \"rec\">"+endCnt+"건</div><br/>";
	html += "<div class=\"cir\" style=\"background-color:rgb(88,193,183);\">실패</div><div class=\"half_cir\" style=\"background-color:rgb(88,193,183);\">"+Math.round((failCnt/totalCnt*100))+"%</div><div class = \"rec\">"+failCnt+"건</div>";
	
	$(".ingArea").html(html);
}

function drawPrgrsStep(salesChncCnt, sgstnCnt, qtnCnt, cntrctCnt){
	var html = "";
	
	
	html += "<div class=\"prgrs\">";
	
	html += "<div class=\"prgrs_step_img\"></div>";
	html += "<ul>";
	html += "<li class=\"step\"><span>기회</span><div class = \"rec\">"+salesChncCnt+"건</div></li>";
	html += "<li class=\"step\"><span>제안</span><div class = \"rec\">"+sgstnCnt+"건</div></li>";
	html += "<li class=\"step\"><span>견적</span><div class = \"rec\">"+qtnCnt+"건</div></li>";
	html += "<li class=\"step\"><span>계약</span><div class = \"rec\">"+cntrctCnt+"건</div></li>";
	html += "</ul>";
	html += "</div>";
	
	
	
	
	$(".prgrs_step").html(html);
}

/* 담당자 팝업 Ajax */
function drawMngList() {
	var params = $("#popupMngForm").serialize();
	
	$.ajax({
		type : "post",
		url : "rprtmngListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawMngCont(res.mngList);
			drawMngPaging(res.pb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

function drawMngCont(mngList) {
	var html = "";
	
	for(var data of mngList) {
		html +=	"<div class=\"popup_mng_box_in\" id=\"mlb\">";
		html += "<input type=\"hidden\" id=\"mng\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mge\" value=\"" + data.EMP_NUM + "\" />";
		html +=	"<div class=\"popup_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"mngIcon\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_mng_box_right\">";
		html +=	 data.EMP_NUM + " " + "<span class=\"boldMngName\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
		html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
		html +=	"</div>";
		html +=	"</div>";                                                                      
	}                                                                                                     
	                      
	$(".popup_box_mng").html(html);
	
}

function drawMngPaging(pb) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
	}
	html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
	
	$(".pgn_area").html(html);

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
			<div class="page_title_text">보고서 - 영업</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
					<div class="bodyWrap">
						<!-- 검색창 -->
						<form action="#" id="getForm" method="post">
						<input type="hidden" name="size" value="3" />
						<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
						<table class="srch_table">
							<colgroup>
								<col width="84" />
								<col width="154" />
								<col width="100" />
								<col width="186" />
								<col width="110" />
								<col width="297" />
							</colgroup>
							<tbody>
								<tr>
									<td>
										<span class="srch_name">팀분류</span>
									</td>
									<td>
										<select id="deptS" name="deptS">
											<option value="9">영업부</option>
											<option value="7">영업 1팀</option>
											<option value="8">영업 2팀</option>
										</select>
									</td>
									<td>
										<span class="srch_name">담당자</span>
									</td>
									<td>
										<div class="findEmp_box">
											<input type="text" id="mngName" name="mngName"/>
											<input type="hidden" id="mngNum" name="mngNum" />
											<img class="userIcon" src="resources/images/sales/usericon.png" id="mngBtn">
										</div>									
									</td>
									<td>
										<span class="srch_name">내영업 조회</span>
									</td>
									<td colspan="3">
										<input type="checkbox" id="salesCheck" name="salesCheck"/>
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">기간</span>
									</td>
									<td colspan="4">
										<input type="date" class="date" name="sdate" value="${sdate}" /> ~ <input type="date" class="date" name="edate" value="${edate}" />
									</td>
									<td>
									<span class="cmn_btn">검색</span>
									</td>
								</tr>	
							</tbody>
						</table>
						</form>
						<div class="new_sales_actvty">
								<div class="sales_text">
									<div class="sales_text_top">
										<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />사업유형
									</div>
									<div class="actvty_tLine1"></div>
									<div class="bsns_type"></div>
								</div>
						</div>
						<br/>
						<div class="cont_left">
							<div class="new_sales_actvty">
								<div class="sales_text">
									<div class="sales_text_top">
										<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />진행상태
									</div>
									<div class="actvty_tLine1"></div>
								</div>
								<div class="ingArea"></div>
							</div>
						</div>
						<div class="cont_right">
							<div class="new_sales_actvty">
								<div class="sales_text">
									<div class="sales_text_top">
										<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />진행단계
									</div>
									<div class="actvty_tLine1"></div>
								</div>
								<div class="prgrs_step"></div>
							</div>
						</div>
					<!-- class="bodyWrap" end -->
					</div>
				<!-- class="body" end -->
				</div>
			<!-- 페이징 및 버튼 영역  -->
			<div class="board_bottom">
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>