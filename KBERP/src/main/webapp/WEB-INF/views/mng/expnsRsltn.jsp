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

.board_table tbody td {
	color: black;
}
.mon {
	display: inline-block;
	vertical-align: top;
	text-align: right;
	width: calc(100%);
	height: 20px;
	margin-bottom: 15px;
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
	
	$("#pgn_area").on("click", "div", function() {
		$("#Page").val($(this).attr("Page"));
		reloadList();
	});
	
	
	
	function reloadList(){
			var params = $("#actionForm").serialize();
	
			$.ajax({
				type : "post", 
				url : "expnsRsltnAjax", 
				dataType : "json",
				data : params,
				success : function(res){ 
					console.log(res);
					drawList(res.list);
					drawPaging(res.pb);		
				},
				error : function(request, status, error){ 
					console.log(request.responseText);
		}
		});
	}
	function drawList(list){
		var html ="";
		
		for(var data of list){
			
			html += "<tr>";
			html += "<td>" + data.DATE_MON +"</td>";
			if(data != null){
				if(data.CRP){
					html += "<td>" + data.CRP + "</td>";
				}else{
				html += "<td> 0 </td>";
			}
				}else{
				html += "<td> 0 </td>";
				}
			if(data != null){
				if(data.IND){
					html += "<td>" + data.IND + "</td>";
				}else{
				html += "<td> 0 </td>";
			}
				}else{
				html += "<td> 0 </td>";
				}
			html += "<td>" + data.TOTAL + "</td>";
			html += "</tr>";
		}                                
		$("#mainlist").html(html);
	}
	
	
	
	function drawPaging(pb) {
		var html = "";
		
		html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
		
		if($("#Page").val() == "1") {
			html += "<div class=\"page_btn page_prev\" page=1>prev</div>";
		} else {
			html += "<div class=\"page_btn page_prev\" page=\"" + ($("#Page").val() * 1 - 1) + "\">prev</div>";		
		}
		
		for(var i = pb.startPcount; i <= pb.endPcount; i++) {
			if($("#Page").val() == i) {
				
				html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
			} else {
				html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
			}
		}
		
		if($("#Page").val() == pb.maxPcount) {
			html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";		
		} else {
			html += "<div class=\"page_btn page_next\" page=\"" + ($("#Page").val() * 1 + 1) + "\">next</div>";				
		}
		
		html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
		
		$("#pgn_area").html(html);
		
	}
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
			<div class="page_title_text">지출 결의서</div>
			<!-- 검색영역 선택적 사항 -->
			
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
	<form action="#" id = "actionForm" method="post">
	<input type ="hidden" name="Page" id="Page" value="1"/>
			<div>
				<div class = "mon"><input type = "month"></div>
					<table class="board_table">
						<thead>
							<tr>
								<th>귀속연월</th>
								<th>개인 지출 합계</th>
								<th>법인 지출 합계</th>
								<th>총 합계</th>
							</tr>
						</thead>
						<tbody class ="mainlist" id ="mainlist">
						</tbody>
					</table>
					<div class="board_bottom">
						<div class="pgn_area" id = "pgn_area">
						</div>
					</div>
				</div>
			
		</div>
	</div>
	</form>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>