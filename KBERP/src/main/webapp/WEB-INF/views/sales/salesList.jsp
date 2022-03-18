<!-- 
	영업기회 목록
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP : 영업관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
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
/* ------- 영업기회 진행단계 선택박스 --------  */
.stageM { /* 영업기회별 단계 박스 */
	width: 927px;
	height: 35px;
	display: block;
}
.stage { /* 영업기회 이름  */
	width: 134.5px;
	margin: 0px 43px;
	padding: 8px 5px;
	background-color: #F2F2F2;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	font-size: 10pt;
	text-align: center;
	display: inline-block;
	vertical-align: middle;
}
.stage:hover {
   font-weight: bold;
   background-color: #F2B705;
   cursor: pointer;
}
.stage:active {
   width: 134.5px;
   margin: 0px 43px;
   padding: 8px 5px;
   background-color: #F2CB05;
   cursor: pointer;
   font-weight: bold;
}
.tLine{
	background-color: #4B94F2;
	width: 927px;
	height: 3px;
	margin: 10px auto;
}
/********** srch_table **********/
.srch_table {
	border-collapse: collapse;
	background-color: #f2f2f2;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px;
}

.srch_table tr {
	height: 40px;
}

.srch_table tr:nth-child(5) {
	height: 41.5px;
	border-top: 1.5px solid #d7d7d7;
}

.asc_btn {
	width: 30px;
	height: 25px;
}

.asc_btn:hover {
	cursor: pointer;
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
.srch_name_noMgn {
	margin: 0px 0px;
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
	width: 147px;
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

/*---------  영업기회 검색결과 : n건 --------- */
.SearchResult { /* 영업기회 검색결과 */
	width: 927px;
	font-size: 11pt;
	text-align: left;
	margin-top: 30px;
}
/*---------- 영업기회 박스 ------------  */
.salesOpportunityName { /* 영업기회명 */
	width: 725px;
	height: 25px;
	line-height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	margin: 13px 5px;
	display: inline-block;
	vertical-align: top;
}
.salesOpportunityName:hover { /* 영업기회명-hover */
	color: #2E83F2;
	cursor: pointer;
}
.opt { /* 영업기회 버튼 */
	display: inline-block;
	width: 25px;
	height: 25px;
	background-image: url("../../images/sales/option.png");
	background-size: 100%;
	background-repeat: no-repeat;
	margin: 10px 5px;
	cursor: pointer;
}
.salesOpportunity { /* 영업기회박스 */
	width: 925px;
	height: 140px;
	border: 1px solid #F2F2F2;
	display: block;	
	background-color: #F2F2F2;
	margin-bottom: 10px;
}
.lastSalesOpportunity{
 margin-bottom: 40px;
}
.sledding { /* 진행상태 */
	width: 130px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	text-align: center;
	line-height: 25px;
	color: #2E83F2;
	margin: 13px 5px;
	display: inline-block;
	vertical-align: top;
	border: 1px solid #2E83F2;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}
.cliimg { /* 고객사 이미지 */
	display: inline-block;
	width: 20px;
	height: 25px;
	background-image: url("../../images/sales/client.png");
	background-size: 100%;
	background-repeat: no-repeat;
 	margin: 13px 0px 13px 10px;
}
.client { /* 고객사/고객  */
	width: 180px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin: 13px 5px 13px 0px;
	padding-left: 3px;
	display: inline-block;
	vertical-align: top;
}
.fs { /* 예상매출액 */
	width: 250px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin: 13px 5px 13px 0px;
	display: inline-block;
	vertical-align: top;
}
.pic { /* 담당자 */
	width: 150px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin: 13px 5px 13px 0px;
	display: inline-block;
	vertical-align: top;
}
/* ------ 영업기회 파이프라인 테이블 ------ */
table { 
	font-size: 10pt;
	text-align: center;
	border: none;
	padding-left: 70px;
}
.colNum1, .colNum2, .colNum3, .colNum4, .colNum5, .colNum6 {
	width: 200px;
	background-color: #F2CB05;
	border: none;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	cursor: pointer;
}
.colNum1 { /* 단계별 파이프라인 그라데이션 */
 	background: linear-gradient(90deg, #FFE65A, #FFE150); 
}
.colNum2 {
	background: linear-gradient(100deg, #FFE150, #FFDC46); 
}
.colNum3 {
	background: linear-gradient(100deg, #FFDC46, #FFD232); 
}
.colNum4 {
	background: linear-gradient(100deg, #FFD232, #FFC81E); 
}
.colNum5 {
	background: linear-gradient(100deg, #FFC81E, #FFC314); 
}
.colNum6 {
	background: linear-gradient(100deg, #FFC314, #F2B705); 
}
.colNum1:active, .colNum2:active, .colNum3:active, 
.colNum4:active, .colNum5:active, .colNum6:active {
	font-weight: bold;
	color: #2E83F2;
	cursor: pointer;
}
.colNum1:hover, .colNum2:hover, .colNum3:hover, 
.colNum4:hover, .colNum5:hover, .colNum6:hover {
	font-weight: bold;
	cursor: pointer;
}
.stick1, .stick2, .stick3, .stick4, .stick5, .stick6 { /* 막대기 color */
	width: 38px;
	border: none;
}
.stick1 {
	background-color: #FFE150;
}
.stick2 {
	background-color: #FFDC46;
}
.stick3 {
	background-color: #FFD232;
}
.stick4 {
	background-color: #FFC81E;
}
.stick5 {
	background-color: #FFC314;
}
.stick6 {
	background-color: #F2B705;
}
.a {
	width: 38px;
	border: none;
	background-color: #F2F2F2;
}
</style>
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
			<div class="page_title_text">영업관리 목록</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<div class="body">
				<div class="bodyWrap">
					<div class="stageM">
					<div class="stage">영업기회 : 10건</div>
					<div class="stage">제안 : 184건</div>
					<div class="stage">견적 : 240건</div>
					<div class="stage">계약 : 1101건</div>
					</div>
						<div class="tLine"></div>
						<table class="srch_table">

							<colgroup>
								<col width="100" />
								<col width="180" />
								<col width="70" />
								<col width="270" />
								<col width="190" />
								
							</colgroup>
							<tbody>
								<!-- col=5 -->
								<tr>
									<td>
										<span class="srch_name">팀 분류</span>
									</td>
									<td>
										<select>
											<option>선택안함</option>
											<option>영업 1팀</option>
											<option>영업 2팀</option>
											<option>영업 3팀</option>
											<option>영업 4팀</option>
											<option>영업 지원팀</option>
										</select>
									</td>
								
									<td>
										<span class="srch_name_noMgn">담당자</span>
									</td>
									<td colspan="2">
										<div class="findEmp_box">
											<img class="userIcon" src="../../images/sales/usericon.png">
										</div>										
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">진행 단계</span>
									</td>
									<td>
										<select>
											<option>선택안함</option>
											<option>영업기회</option>
											<option>제안</option>
											<option>견적</option>
											<option>계약</option>
										</select>
									</td>
								
									<td>
										<span class="srch_name_noMgn">완료 여부</span>
									</td>
									<td colspan="2">
										<select>
											<option>선택안함</option>
											<option>진행중</option>
											<option>종료(성공)</option>
											<option>종료(실패)</option>
										</select>									
									</td>
								</tr>
								
								<tr>
									<td>
										<span class="srch_name">기간</span>
									</td>
									<td>
										<select>
											<option selected="selected">영업기회등록일</option>
										</select>
									</td>
									<td colspan="3">
										<input type="button" value="어제" />
										<input type="button" value="오늘" />
										<input type="button" value="일주일 전" />
										<input type="button" value="1개월 전" />
										<input type="button" value="3개월 전" />
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td colspan="3">
										<input type="date" />
										~
										<input type="date" />
									</td>
									
								</tr>
								<tr>
									<td>
										<span class="srch_name">검색어</span>
									</td>
									<td>
										<select>
											<option>선택안함</option>
											<option>고객사명</option>
											<option>영업명</option>
											<option>영업기회번호</option>
										</select>
									</td>
									<td colspan="2">
										<input type="text" class="srch_msg" placeholder="검색 조건을 선택한 후 입력해주세요." />
									</td>
									<td>
										<span class="cmn_btn">검색</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">정렬</span>
									</td>
									<td>
										<select>
											<option selected="selected">상품등급</option>
											<option>영업명</option>
											<option>고객사명</option>
											<option>예상매출</option>
											<option>시작일</option>
										</select>
									</td>
									<td>
										<img class="asc_btn cmn_btn" alt="등록버튼" src="../../images/sales/asc.png" />
									</td>
									<td colspan="3"></td>
								</tr>
							</tbody>
						</table>
					<div class="SearchResult"><h3>영업관리 (검색결과: 83건)</h3></div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="salesOpportunity">
						<div class="sledding">진행 중</div>
						<div class="salesOpportunityName">카카오 부자되세요 28주 대출 연이자 2.3%</div>
						<div class="opt"></div>
					<table cellspacing="0">
						<colgroup>
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />
							<col width="120" />
							<col width="25" />							
							<col width="120" />							
							</colgroup>
						<tbody>
							<tr height="10">
								<td class="colNum2" rowspan="3">영업기회</td>
								<td class="a"></td>
								<td class="colNum3" rowspan="3">제안</td>
								<td class="a"></td>
								<td class="colNum4" rowspan="3">견적</td>
								<td class="a"></td>
								<td class="colNum6" rowspan="3">계약</td>
							</tr>
							<tr height="10">
								<td class="stick1"></td>
								<td class="stick2"></td>
								<td class="stick3"></td>
							</tr>
							<tr height="10">
								<td class="a"></td>
								<td class="a"></td>
								<td class="a"></td>
							</tr>
						</tbody>
					</table>
						<div class="cliimg"></div>
						<div class="client">구디아카데미 / gd43</div>
 						<div class="fs">예상매출: 12,000,000원</div>
						<div class="pic">유은정 사원</div>
					</div>
					<div class="body_bottom">
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
								<div class="cmn_btn">등록</div>
							</div>
						</div>
				</div>
			</div>
		</div> <!-- cont_area end -->
	</div><!-- cont_wrap end -->
</div> <!-- right_area end  -->
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>