<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cardView</title>
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


#empSrchBtn {
    margin-top: 8px;
}
.name_srch_wrap{
    margin-left: 35px;
}
.use_name{
margin-left: 59px;
margin-top: 4px;
}
.text_cont{
margin-left: 59px;
}
.title{
 text-align: right;
}
.cont{
 text-align: left;
}
</style>
<script type="text/javascript">

$(document).ready(function() {

	$("#listBtn").on("click",function(){
		$("#backForm").submit();
	});
	
	$("#addBtn").on("click", function() {
		if(checkEmpty("#dept_name")) {
			alert("부서명을 입력하세요.")
			$("#dept_num").focus();
		} else if(checkEmpty("#rank_name")) {
			alert("직급을 입력하세요.")
			$("#rank_name").focus();
		} else if(checkEmpty("#use_name")) {
			alert("사용자를 입력하세요.")
			$("#use_name").focus();
		} else if(checkEmpty("#use_start_dt")) {
			alert("사용시작일을 입력하세요.")
			$("#use_start_dt").focus();
		} else if(checkEmpty("#use_end_dt")) {
			alert("사용종료일을 입력하세요.")
			$("#use_end_dt").focus();
		} else {
			var writeForm = $("#WriteForm");
			
			writeForm.ajaxForm({
				success : function(res) {

					// 글 저장
					var params = $("#WriteForm").serialize();
					
					$.ajax({
						type : "post", // 전송 형태
						url : "cardMngAction/insert2", // 통신 주소
						dataType : "json", // 받을 데이터 형태
						data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
						success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
							if(res.res == "success") {
								$("#backForm").submit();
							} else {
								alert("작성 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error) { // 문제 발생 시 실행 함수
							console.log(request.responseText); // 결과 텍스트
						}
					});
				},
				error : function(req) {
					console.log(req.responseText);
					
				}
			});
			writeForm.submit(); // ajaxForm 실행	
		}
	});
	$("#btn").on("click", function() {

		var html = "";
		
		html += "<div class=\"popup_cont\">";
		html += "<div class=\"name_srch_wrap\" >";
		html += "<table class=\"name_srch_table\">";
		html += "<tbody>";
		html += "<tr>";
		html += "<td>사원명</td>";
		html += "<td><input type=\"text\" id=\"empSrchTxt\"></td>";
		html += "<td><div class=\"cmn_btn\" id=\"empSrchBtn\">검색</div></td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "</div>";
		html += "<table class=\"board_table\">";
		html += "<colgroup>";
		html += "<col width=\"100\">";
		html += "<col width=\"100\">";
		html += "<col width=\"100\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr>";
		html += "<th>부서명</th>";
		html += "<th>직급</th>";
		html += "<th>사원명</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody id=\"empAllListTbody\">";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"board_bottom\">";
		html += "<div class=\"pgn_area\" id=\"pgn_area\">";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 500,
			title : "사원검색",
			contents : html,
			contentsEvent : function() {
				$("#sendSrchTxt").val("");
				
				reloadList();
				
				$("#pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));
					reloadList();
				});
				
				$("#empSrchBtn").on("click", function() {
					$("#sendSrchTxt").val($("#empSrchTxt").val());
					reloadList();
				});
				
				$("#empSrchTxt").on("keypress", function(event) {
					if(event.keyCode == 13) {
						
						$("#empSrchBtn").click();
						
						return false;
					}
				});
				$("#empAllListTbody").on("click", "#empName", function() {
					$("#use_num").val($(this).attr("use_num"));
					$("#use_name").val($(this).attr("use_name"));
					$("#dept_name").val($(this).attr("dept_name"));
					$("#rank_name").val($(this).attr("rank_name"));
					closePopup(1);
				});
			},
			buttons : {
				name : "닫기",
				func:function() {
					closePopup(1);
				}
			}
		});
	});	//srchEmp
});
function reloadList() {
	var params = $("#allEmpSrchForm").serialize();
	
	$.ajax({
		type : "post",
		url : "callEmpSrchAjax", 
		dataType : "json",
		data : params, 
		success : function(res) {
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	}); 
}// 사원검색
	function drawList(list) {
		var html = "";
		
		for(data of list) {
			html += "<tr>";
			html += "<td>" + data.DEPT_NAME + "</td>";
			html += "<td>" + data.RANK_NAME + "</td>";
			html += "<td class=\"board_table_hover\" id=\"empName\" use_num=\"" + data.EMP_NUM + "\" rank_name=\""+ data.RANK_NAME +"\" dept_name=\""+ data.DEPT_NAME +"\" use_name=\"" + data.EMP_NAME + "\">" + data.EMP_NAME + "</td>";
			html += "</tr>";
		}
		
		$("#empAllListTbody").html(html);
	} // 사원 목록
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
		
		html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
		
		$("#pgn_area").html(html);
		
	} // 사원 페이징
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
			<div class="page_title_text">카드 관리 > 카드 소유 등록</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
<form action="cardList" id="backForm" method="post">
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="mng_num" value="${param.mng_num}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchMon" value="${param.searchMon}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
<form action="#" id="allEmpSrchForm" method="post">
			<input type="hidden" id="sendSrchTxt" name="sendSrchTxt">
			<input type="hidden" id="page" name="page" value="1">
		</form>
<form action="cardList" id="WriteForm" method="post">
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="use_num" id="use_num"  />
	<input type="hidden" name="mng_num" value="${param.mng_num}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchMon" value="${param.searchMon}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">

    		  <colgroup>
               <col width="200"/>
               <col width="250"/>

             </colgroup>
      <tbody>
      <tr>
            <td class="title"> 부서명 </td>
               <td class="cont"><input type = "text" class = "text_cont" id="dept_name" name="dept_name"></td>         
         </tr>
         <tr>
            <td class="title"> 직급 </td>
               <td class="cont"><input type = "text" class = "text_cont" id = "rank_name" name="rank_name" ></td>
         </tr>
         <tr>
            <td class="title"> 소유자 </td>
               <td class="cont"><input type = "text" class = "use_name" id = "use_name" name="use_name"><input type = "button" class = "cmn_btn"  id = "btn" value="검색"></td> 

         </tr>
         <tr>
            <td class="title"> 사용시작일 </td>
               <td class="cont"><input type = "date" class = "text_cont" id = "use_start_dt" name = "use_start_dt" ></td> 
         </tr>
         <tr>
            <td class="title"> 사용종료일 </td>
               <td class="cont"><input type = "date" class = "text_cont"  id = "use_end_dt" name = "use_end_dt" ></td> 
         </tr>

         </tbody>
	</table>
			<div class="board_bottom">
				<div class="cmn_btn" id="addBtn">등록</div>
				<div class="cmn_btn" id="listBtn">취소</div>
			</div>
		</div>
		</form>
	</div>

	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>