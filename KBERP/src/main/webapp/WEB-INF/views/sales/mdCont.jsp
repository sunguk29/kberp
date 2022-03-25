<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	LocalDateTime version = LocalDateTime.now() ;	
	request.setAttribute("version", version);		//캐시 처리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<!-- mdCont css파일  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/md/mdCont.css?version=${version}" />

<!-- common_sales javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}"></script>

<script type="text/javascript">
$(document).ready(function() {
	//목록으로 버튼 클릭시, mdList로 이동
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "mdList");
		$("#actionForm").submit();
	});
	
	//수정 버튼 클릭시, mdUpdate로 이동
	$("#updateBtn").on("click", function(){
		$("#actionForm").attr("action", "mdUpdate");
		$("#actionForm").submit();
	});
	
	//삭제 버튼 클릭시, mdActionAjax/delete를 통해 성공시 mdList
	$("#deleteBtn").on("click", function(){
		if(confirm("삭제하시겠습니까?")){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type: "post", 								// 전송 형태
				url : "mdActionAjax/delete", 				//통신 주소
				dataType : "json", 							//받을 데이터 형태
				data : params,								//보낼 데이터. 보낼 것이 없으면 안씀.
				success : function (res) {					//성공시 실행 함수. 인자는 받아온 데이터
					if(res.res == "success"){
						location.href = "mdList";
					}else{
						alert("삭제중 문제가 발생하였습니다.");						
					}
				},
				error : function (request, status, error) {	//문제 발생 시 실행 함수
					console.log(request.requestText);		//결과 텍스트
				}
			});
		}
	});
	
});
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<!-- 메뉴 데이터 유지용 -->
	<input type="hidden" name="top" 		   value="${params.top}"> 		<!-- top정보 -->
	<input type="hidden" name="menuNum" 	   value="${params.menuNum}"> 	<!-- 메뉴정보 -->
	<input type="hidden" name="menuType" 	   value="${params.menuType}"> 	<!-- 메뉴정보 -->

	<!-- 검색 데이터 유지용 -->
	<input type="hidden" name="no" 	 id="no" 		   value="${param.no}"/>   
	<input type="hidden" name="page" id="page" 		   value="${params.page}"> 
	<input type="hidden" 			 id="old_srch_txt" value="${param.srch_txt}" />
	<input type="hidden"			 id="old_srch_gbn" value="${param.srch_gbn}" />
</form>

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
			<div class="page_title_text">상품관리 상세보기</div>
			<div class="imgPos">
				<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" id="deleteBtn" />
				<img alt="수정버튼" src="resources/images/sales/pencil.png"  class="btnImg" id="updateBtn"/>
				<img alt="목록버튼" src="resources/images/sales/list.png"    class="btnImg" id="listBtn"/>
			</div>
		</div>
		
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->
					<table>
						<colgroup>
							<col width="200" />
							<col width="265" />
							<col width="200" />
							<col width="265" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="상품명 *" readonly="readonly"/></td>
								<td colspan="3"><input type="text" class="txt" readonly="readonly" disabled="disabled" /></td>
							</tr>
							<tr height="40">							
								<td padding="none"><input type="button" class="btn" value="상품 유형 *" /></td>
								<td>
									<select class="txt" disabled="disabled">
										<optgroup>
											<option>선택 하세요</option>
											<option>개인 사업</option>
											<option>법인 사업</option>
											<option>공공 사업</option>
										</optgroup>
									</select>
								</td>	
								<td><input type="button" class="btn" value="상품 등급 *" /></td>
								<td>
									<select class="txt" disabled="disabled">
										<optgroup>
											<option>선택 하세요</option>
											<option>S</option>
											<option>A</option>
											<option>B</option>
											<option>C</option>
											<option>D</option>
										</optgroup>
									</select>
								</td>							
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="판매 상태 *" /></td>
								<td>
									<select class="txt" disabled="disabled">
										<optgroup>
											<option>선택 하세요</option>
											<option>판매중</option>
											<option>판매중단</option>
											<option>출시예정</option>
										</optgroup>
									</select>
								</td>
								<td><input type="button" class="btn" value="한도 금액 *" /></td>
								<td><input type="text" class="txt" readonly="readonly" disabled="disabled" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="판매 기간 *" /></td>
									<td><input type="date" class="txt" readonly="readonly" disabled="disabled" /></td>
									<td>
										<div class="date_sign">
											<span class="txt">~</span>
										</div>
									</td>
									<td colspan="2"><input type="date" class="txt" readonly="readonly" disabled="disabled" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="이자율 *" /></td>
								<td><input type="text" class="txt" readonly="readonly" disabled="disabled" /></td>
								<td><input type="button" class="btn" value="이자 납부 방식 *" /></td>
								<td>
									<select class="txt" disabled="disabled">
										<optgroup>
											<option>선택 하세요</option>
											<option>원금 균등</option>
											<option>원리금 균등</option>
											<option>만기 일시상환</option>
										</optgroup>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="원금 납부 방식 *" /></td>
								<td>
									<select class="txt" disabled="disabled">
										<optgroup>
											<option>선택 하세요</option>
											<option>원금 균등</option>
											<option>원리금 균등</option>
											<option>만기 일시상환</option>
										</optgroup>
									</select>
								</td>
								<td><input type="button" class="btn" value="중도상환 가능 여부 *" /></td>
								<td>
									<select class="txt" disabled="disabled">
										<optgroup>
											<option>선택 하세요</option>
											<option>가능</option>
											<option>불가능</option>
										</optgroup>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="대출 기간 *" /></td>
								<td>
									<select class="txt" disabled="disabled">
										<optgroup>
											<option>선택 하세요</option>
											<option>6개월</option>
											<option>1년</option>
											<option>3년</option>
											<option>5년</option>
										</optgroup>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td rowspan="2"><input type="button" class="btn" value="상품 설명 " readonly="readonly"/></td>
								<td colspan="3">
									<textarea rows="100" cols="50" class="txt_area" readonly="readonly" disabled="disabled"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 끝 -->
					<!-- 첨부자료 부분 -->
					<div class="rvn_txt"> 첨부자료 (0)
						<input type=file name='file1' style='display: none;'> 
					</div>
					<div class="cntrct_box_in"></div> 
				</div>
			</div>	
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>