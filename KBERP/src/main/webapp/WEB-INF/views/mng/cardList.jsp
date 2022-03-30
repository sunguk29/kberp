<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cardList</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
.popup_bg {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	background-color: #444444;
	opacity: 0.7;
	z-index: 50;
}

.popup {
	display: inline-block;
	width: 650px;
	height: 300px;
	box-shadow: 0px 0px 4px 0px #b7b7b7;
	position: absolute;
	top: calc(50% - 300px);
	left: calc(50% - 300px);
	z-index: 100;
	background-color: #f4f4f4;
	border-radius: 2px;
	line-height: 45px;
    font-size:10.5pt;
}

.popup_title {
	height: 40px;
	line-height: 40px;
	font-size: 11pt;
	font-weight: bold;
	text-indent: 10px;
	background-color: #f2cb05;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}

.popup_cont {
	width: calc(100% - 20px);
	height: calc(100% - 100px);
	padding: 10px;
	/* 표준 폰트 크기 */
	/* font-size: 10.5pt; */
	 background-color: #fff;
}

.popup_btn_area {
	width: 100%;
	height: 35px;
	text-align: right;
	padding-top: 5px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}
/* 개인 작업 영역 */
.cmn_btn{
	margin-left:8px;
}
.int_list{
   width: 180px;
   height: 30px;
   vertical-align: top;
   margin: 15px 0 0 5px;
   padding: 3px;
   text-align: center;
}

.popup_table {
   text-align: center;
   border-collapse: collapse;
}
.popup_table td {
   border-top: 1px solid #222222;
}
.check{
	width: 189px;
   height: 40px;
   vertical-align: top;
   margin: 15px 0 0 5px;
   padding: 3px;
   text-align: center;
}
.note_cont{
	width:485px;
	margin-left: 26px;
}
.use_date_cont{
	text-align:left;
	margin-left: 25px;
}
.card_sep_cont{
	text-align:left;
	height:23px;
	margin-left: 25px;
}
.card_co_cont{
	text-align:left;
	height:23px;
	margin-left: 25px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	reloadList();
	
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
		
		var html="";
		
		    html += "<div class=\"popup_cont\">";
		    html += "<table class=\"popup_table\">";
		    html += "<tbody>";
		    html += "<tr>";
		    html += "<td> 카드 번호 </td>";
		    html += "<td><input type = \"text\" id =\"card_code\" class = \"card_code_cont\" value=\"01\"></td>";  
			html += "<td> 카드구분 </td>";
			html += "<td class=\"card_sep_cont\"><select class=\"card_sep_cont\" id =\"card_sep\">";
			html +=	"<option value=\"0\">신용</option>";
			html +=	"<option value=\"1\">체크</option>";
			html +=	"</select></td>";          
			html += "</tr>";
			html += "<tr>";
			html += "<td> 카드명 </td>";
			html += "<td><input type = \"text\" class = \"card_name_cont\" id =\"card_name\" value=\"팀회식용\"></td>";
	        html += "<td> 카드사 </td>";
	        html += "<td class=\"card_sep_cont\"><select id =\"card_co\" class=\"card_co_cont\">";
			html +=	"<option value=\"0\">농협</option>";
			html +=	"<option value=\"1\">기업</option>";
			html +=	"<option value=\"2\">신한</option>";
			html +=	"<option value=\"3\">카카오뱅크</option>";
			html +=	"<option value=\"4\">현대</option>";
			html +=	"</select></td>";     
	        html += "<tr>";
	        html += "<td> 카드명의 </td>";
	        html += "<td><input type = \"text\" class = \"use_name_cont\"  id =\"use_name\" value=\"백종훈\"></td>";
	        html += "<td> 발급일자 </td>";
	        html += "<td class = \"use_date_cont\"><input type = \"date\" class = \"use_date_cont\" id =\"use_time\"></td>";
	        html += "</tr>";
	        html +=	"<tr>";
	        html += "<td id =\"note\"> 비고 </td>";
	        html += "<td colspan=3><input type = \"text\" class = \"note_cont\" id =\"note\" value=\"빈칸\" ></td>";
	        html += "</tr>";
	        html += "</tbody>";
	        html +=	"</table>";
			html += "</div>";
		
		makePopup({
			depth:1,
			bg : true,
			width : 650,
			height : 300,
			title : "카드등록",
			contents : html,
			buttons : [{
				name : "등록",
				func:function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post", // 전송 형태
						url : "cardMngAction/insert", // 통신 주소
						dataType : "json", // 받을 데이터 형태
						data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
						success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
							if(res.res=="success"){
								$("#actionForm").attr("action","cardList");
								$("#actionForm").submit();
							}else {
								alert("저장 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error) { // 문제 발생 시 실행 함수
							console.log(request.responseText); // 결과 텍스트
						}
					});
			
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
});

function reloadList() { // 목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post", // 전송 형태
		url : "cardListAjax", // 통신 주소
		dataType : "json", // 받을 데이터 형태
		data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
		success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error) { // 문제 발생 시 실행 함수
			console.log(request.responseText); // 결과 텍스트
		}
	});
}

function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<tr no=\"" + data.CARD_NUM + "\">";
		html += "<td>" + data.CARD_NUM + "</td>";
		html += "<td id=\"click\">" + data.CARD_NAME + "</td>";
		html += "<td>" + data.EMP_NUM + "</td>";
		html += "<td>" + data.USE_START_DT + " ~ " + data.USE_END_DT + "</td>";
		html += "</tr>";
	}
	$("tbody").html(html);
}

function drawPaging(pb) {
	var html = "";
	
	html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
	if($("#page").val() == "1") {
		html += "<div class=\"page_btn page_prev\" page=1>prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">prev</div>";		
	}
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
		}
	}
	if($("#page").val() == pb.maxPcount) {
		html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";		
	} else {
		html += "<div class=\"page_btn page_next\" page=\"" + ($("#page").val() * 1 + 1) + "\">next</div>";				
	}
	html += "<div class=\"page_btn page_last\">last</div>";
	
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
			<div class="page_title_text">카드 관리</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
				<select class="srch_sel">
					<option>카드번호</option>
					<option>카드명</option>
				</select>
				<select class="srch_sel">
					<option>폐기구분</option>
					<option>폐기</option>
				</select>
				<div class="srch_text_wrap">
					<input type="text" />
				</div>
				<div class="cmn_btn_ml">검색</div>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="100"/>
					<col width="400"/>
					<col width="150"/>
					<col width="250"/>
				</colgroup>
				<thead>
					<tr>
						<th>카드번호</th>
						<th>카드명</th>
						<th>카드소유자</th>
						<th>카드소유기간</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area">
				</div>
				<div class="cmn_btn" id="btn2Btn">신규</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>