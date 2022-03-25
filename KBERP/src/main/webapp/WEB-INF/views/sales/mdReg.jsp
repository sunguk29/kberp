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
<title>상품 등록</title>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<!-- mdReg css파일  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/md/mdReg.css?version=${version}" />

<!-- common_sales javaScript파일 -->
<script type="text/javascript" src="resources/script/sales/common_sales.js?version=${version}"></script>

<script type="text/javascript">
$(document).ready(function() {
	//목록으로 버튼 클릭시, mdList로 이동
	$("#listBtn").on("click", function(){
		$("#backForm").submit();
	});
	
	//저장 버튼 클릭시, 필수항목 체크 후 저장 후 mdList로 이동
	$("#saveBtn").on("click", function() {
		// instance[이름] : 해당 이름으로 CKEDITOR객체 취득
		// getData() : 입력된 데이터 취득
		if(checkEmpty("#itemName")){
			alert("상품명을 입력하세요.");
			$("#itemName").focus();
		}else if(checkEmpty("#sellCnt")){
			alert("수량을 입력하세요.");
			$("#sellCnt").focus();
		}else if(checkEmpty("#sellDt")){
			alert("등록일을 입력하세요.");
			$("#sellDt").focus();
		}else{
			var params = $("#writeForm").serialize();
			
			$.ajax({
				type: "post", 								// 전송 형태
				url : "aSellAction/insert", 					//통신 주소
				dataType : "json", 							//받을 데이터 형태
				data : params,								//보낼 데이터. 보낼 것이 없으면 안씀.
				success : function (res) {					//성공시 실행 함수. 인자는 받아온 데이터
					if(res.res == "success"){
						location.href = "aSellList";
					}else{
						alert("작성중 문제가 발생하였습니다.");						
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
<!--============== back Form ==================-->
<form action="mdList" id="backForm" method="post">
	<!-- 메뉴 데이터 유지용 -->
	<input type="hidden" name="top" 		   value="${params.top}"> 		<!-- top정보 -->
	<input type="hidden" name="menuNum" 	   value="${params.menuNum}"> 	<!-- 메뉴정보 -->
	<input type="hidden" name="menuType" 	   value="${params.menuType}"> 	<!-- 메뉴정보 -->

	<!-- 검색 데이터 유지용 -->
	<input type="hidden" id="old_md_grade" 			value="${param.md_grade}" />
	<input type="hidden" id="old_sales_stsA" 		value="${param.sales_stsA}" />
	<input type="hidden" id="old_sales_sts0"	  	value="${param.sales_sts0}" />
	<input type="hidden" id="old_sales_sts1"	   	value="${param.sales_sts1}" />
	<input type="hidden" id="old_sales_sts2"	   	value="${param.sales_sts2}" />
	<input type="hidden" id="old_sales_start_date" 	value="${param.sales_start_date}" />
	<input type="hidden" id="old_sales_end_date" 	value="${param.sales_end_date}" />
	<input type="hidden" id="old_srch_gbn" 			value="${param.srch_gbn}" />
	<input type="hidden" id="old_srch_txt" 			value="${param.srch_txt}" />
	<input type="hidden" id="old_sort_gbn" 			value="${param.sort_gbn}" />
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
			<div class="page_title_text">상품 등록</div>
				<div class="imgPos"> 					
				<img class="btnImg" alt="저장버튼" src="resources/images/sales/save.png"  id="saveBtn"/>
				<img class="btnImg" alt="목록버튼" src="resources/images/sales/list.png"  id="listBtn" />
			</div>
		</div>
		
		<!-- 해당 내용에 작업을 진행하시오. -->	
		<!--============= write Form ==============-->
		<form action="#" id="writeForm" method="post">
			<div class="cont_area">
				<div class="body">
					<div class="bodyWrap">
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
									<td colspan="3"><input type="text" class="txt" name="md_name"/></td>					<!-- MD_NAME 으로 / 보낼값 1 -->
								</tr>
								<tr height="40">							
									<td padding="none"><input type="button" class="btn" value="상품 유형 *" /></td>	
									<td>
										<select class="txt" name="md_type">													<!-- MD_TYPE_NUM으로 / 보낼값 2 -->
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
										<select class="txt" name="md_grade">												<!-- MD_GRADE_NUM으로 / 보낼값 3 -->
											<option value="-1" selected>선택 하세요</option>
											<option value="0">S 등급</option>
											<option value="1">A 등급</option>
											<option value="2">B 등급</option>
											<option value="3">C 등급</option>
											<option value="4">D 등급</option>
											<option value="5">E 등급</option>
										</select>
									</td>							
								</tr>
								<tr height="40">
									<td><input type="button" class="btn" value="판매 상태 *" /></td>				
									<td>
										<select class="txt" name="sales_sts">												<!-- SALES_STS_NUM으로 / 보낼값 4 -->
											<option value="-1" selected>선택 하세요</option>
											<option value="0">판매중</option>
											<option value="1">판매중단</option>
											<option value="2">출시예정</option>
										</select>
									</td>
									<td><input type="button" class="btn" value="한도 금액 *" /></td>
									<td><input type="text" class="txt" name="limit_amnt"/></td>								<!-- LIMIT_AMNT 으로 / 보낼값 5  -->
								</tr>
								<tr height="40">
									<td><input type="button" class="btn" value="판매 기간 *" /></td>
										<td><input type="date" class="txt" name="sales_start_date"/></td> 					<!-- SALES_START_DATE 으로 / 보낼값 6  -->
										<td>
											<div class="date_sign">
												<span class="txt">~</span>
											</div>
										</td>
										<td colspan="2"><input type="date" class="txt" name="sales_end_date"/></td>			<!-- SALES_END_DATE 으로 / 보낼값 7  -->
								</tr>
								<tr height="40">
									<td><input type="button" class="btn" value="이자율 *" /></td>
									<td><input type="text" class="txt" name="intrst_rate"/></td> 				 			<!-- INTRST_RATE 으로 / 보낼값 8  -->
									<td><input type="button" class="btn" value="이자 납부 방식 *" /></td>
									<td>
										<select class="txt" name="intrst_pymnt_mthd"> 										<!-- INTRST_PYMNT_MTHD_NUM 으로 / 보낼값 9  -->
											<option value="-1">선택 하세요</option>
											<option value="0">원금 균등</option>
											<option value="1">원리금 균등</option>
											<option value="2">만기 일시상환</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td><input type="button" class="btn" value="원금 납부 방식 *" /></td>
									<td>
										<select class="txt" name="prncpl_pymnt_mthd"> 										<!-- PRNCPL_PYMNT_MTHD_NUM 으로 / 보낼값 10  -->
											<option value="-1">선택 하세요</option>
											<option value="0">원금 균등</option>
											<option value="1">원리금 균등</option>
											<option value="2">만기 일시상환</option>
										</select>
									</td>
									<td><input type="button" class="btn" value="중도상환 가능 여부 *" /></td>
									<td>
										<select class="txt" name="mid_prdmptn_psbl_check"> 									<!-- MID_RDMPTN_PSBL_CHECK 으로 / 보낼값 11  -->
											<option value="-1">선택 하세요</option>
											<option value="0">가능</option>
											<option value="1">불가능</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td><input type="button" class="btn" value="대출 기간 *" /></td>
									<td>
										<select class="txt" name="loan_prd"> 												<!-- LOAN_PRD 으로 / 보낼값 12  -->
											<option value="-1">선택 하세요</option>
											<option value="0">6개월</option>
											<option value="1">1년</option>
											<option value="2">3년</option>
											<option value="3">5년</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td rowspan="2"><input type="button" class="btn" value="상품 설명 " readonly="readonly"/></td> 
									<td colspan="3">
										<textarea rows="100" cols="50" class="txt_area" name="md_dscrptn"></textarea> 		<!-- MD_DSCRPTN 으로 / 보낼값 13  -->
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 끝 -->
						<!-- 첨부자료 부분 -->
						<div class="rvn_txt"> 첨부자료 (0)
							<input type=file name='file1' style='display: none;'> 
							<img class="plus_btn" alt="더하기버튼" src="resources/images/sales/plus.png" border='0' onclick="document.all.file1.click();" > 
						</div>
						<div class="cntrct_box_in"></div> 
					</div>
				</div>	
			</div>
		</form>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>