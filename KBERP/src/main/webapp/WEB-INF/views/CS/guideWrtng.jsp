<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 안내글</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
tr{
	text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#writeBtn").on("click", function(){
		$("#actionForm").submit(); 	
	});	
	
	 reloadList();
	
	function reloadList(){	//목록 조회용 + 페이징 조회용
		
		$.ajax({
			type: "post", // 전송형태
			url : "guideWrtngAjax" , //통신 주소
			dataType : "json", //받을 데이터 형태
			 //보낼 데이터. 보낼 것이 없으면 안씀
			success : function(res){ // 성공 시 실행 함수. 인자는 받아온 데이터
			//받아온 데이터중의 list를 그리겠다.
				drawList(res.list);
			},
			error: function(request, status, error){ // 문제 발생 시 실행 함수
				console.log(request.responseText); //결과텍스트. 스프링 실행 결과
			}
		});
	}

	// 컨트롤러에서 list를 받아서 그린다
	function drawList(list){
		var html ="";
		
		// of: list 하나씩 꺼내오는 for문
		for(var data of list){
			html+="<tr no=\"" + data.BOARD_NUM+ "\">";
			html+="<td>" + data.BOARD_NUM +"</td>";
			html+="<td class=\"board_table_hover board_cont_left\">" + data.CMBN_TITLE +"</td>";
			html+="<td>" + data.EMP_NAME +"</td>";
			html+="<td>" + data.WRITE_DATE +"</td>";
			html+="<td>" + data.CMBN_HITS +"</td>";
			html+="</tr>";
		}
		$("tbody").html(html);
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
			<div class="page_title_text">안내글</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
				<select class="srch_sel">
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
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
					<col width="150"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area">
					<div class="page_btn page_first">first</div>
					<div class="page_btn page_prev">prev</div>
					<div class="page_btn_on">1</div>
					<div class="page_btn">2</div>
					<div class="page_btn">3</div>
					<div class="page_btn">4</div>
					<div class="page_btn">5</div>
					<div class="page_btn page_next">next</div>
					<div class="page_btn page_last">last</div>
				</div>
				<div class="cmn_btn_ml" id="writeBtn">글쓰기</div>
			</div>
		</div>
	</div>
	
	<!-- 글쓰기 form -->
	<form action="guideWrtngAdd" id="actionForm" method="post">
	<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
	</form>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>