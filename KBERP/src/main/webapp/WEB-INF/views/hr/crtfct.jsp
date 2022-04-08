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
.cont_area {
	display: inline-block;
	vertical-align: top;
	width: 1060px;
	height: 650px;
	padding: 10px 25px;
}

.crtfct_rqst {
	display: inline-block;
    vertical-align: top;
    width: 900px;
    height: 200px;
    padding: 10px 0px;
}

.crtfct_rqst_title {
height: 25px;
    font-size: 13pt;
    color: #333333;
    font-weight: 600;
    padding: 20px 0px;
}

.crtfct_rqst_cont {
display: inline-block;
    vertical-align: top;
    width: 859px;
    height: 94px;
    padding: 10px;
    border-radius: 5px;
    border: solid 1px #d7d7d7;
}

.rqst_slct_wrap {
height: 25px;
    display: inline-block;
    width: 276px;
    text-align: center;
    padding: 5px;
}
.rqst_slct_title {
    line-height: 30px;
    display: inline-block;
    vertical-align: top;
    font-size: 10pt;
    width: 100px;
    height: 30px;
    color: #4b94f2;
    font-weight: 600;
	
}
.rqst_slct {
 display: inline-block;
    vertical-align: top;
    width: 130px;
    height: 25px;
    border: solid 1px #b7b7b7;
    border-radius: 3px;
    margin: 3px 0 0 5px;
}

.rqst_input_wrap {
    width: 840px;
    height: 30px;
    margin-top: 20px;
}

.rqst_input_title {
display: inline-block;
    line-height: 23px;
    vertical-align: top;
    font-size: 10pt;
    height: 30px;
    width: 100px;
    color: #4b94f2;
    font-weight: 600;
    padding: 0px 10px;
    margin-left: 6px;
}

.rqst_input{
width: 529px;
    height: 21px;
    border-radius: 3px;
    border: solid 1px #d7d7d7;
    margin-bottom: 12px;
    resize: none;
    padding-left: 10px;
    margin-left: 4px;
}

.rqst_btn_area {
vertical-align: top;
    display: inline-block;
    width: 160px;
    /* height: 50px; */
    text-align: right;
}

.rqst_btn {
    background-color: #4B94F2;
    color: #fff;
    display: inline-block;
    vertical-align: bottom;
    width: 68px;
    height: 31px;
    border: 1px solid #00000022;
    border-radius: 4px;
    font-size: 10pt;
    font-weight: 600;
    text-align: center;
    line-height: 26px;
    user-select: none;
    cursor: pointer;
}

.rqst_btn:active {
	background-color: #74abf5;
}

.crtfct_list {
    display: block;
    width: 900px;
    height: 430px;
    padding: 10px 0px;
}

.crtfct_list_title {
height: 25px;
    font-size: 13pt;
    color: #333333;
    font-weight: 600;
    padding: 20px 0px;
}

.crtfct_list_cont {
    display: inline-block;
    vertical-align: top;
    width: 892px;
    height: 289px;
    padding: 0px 0 10px 0;
    border-top: solid 1px #d7d7d7;
    overflow-y: scroll;
    border-bottom: solid 1px #d7d7d7;
}

.crtfct_table {
	display: inline-table;
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 15px;
}

.crtfct_table thead tr {
   background-color: #f4f4f4;
   border-bottom: 1px solid #d7d7d7;
   height: 35px;
   font-size: 10pt;
   position: sticky;
   top: 0; 
}

.crtfct_table tbody tr {
   border-bottom: 1px solid #d7d7d7;
   height: 30px;
   text-align: center;
   color: #333333;
   font-size: 9.5pt;
}

.crtfct_table tbody tr:hover {
   background-color: rgb(200,218,248);
}


</style>
<script type="text/javascript">
$(document).ready(function() {
   $(".crtfct_list_cont").slimScroll({height: "280px"});

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
<!-- 내용영역 -->
		<div class="page_title_bar">
			<div class="page_title_text">증명서발급</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
				<div class="cont_area">
			<div class="crtfct_rqst">
				<div class="crtfct_rqst_title">발급신청</div>
				<div class="crtfct_rqst_cont">
					<div class="rqst_slct_wrap">
						<div class="rqst_slct_title">증명서종류*</div>
						<select class="rqst_slct">
							<option value="0">선택</option>
							<option value="1">재직증명서</option>
							<option value="2">경력증명서</option>
							<option value="3">퇴직증명서</option>
							<option value="4">기타</option>
						</select>
					</div>
					<div class="rqst_slct_wrap">
						<div class="rqst_slct_title">발급매수*</div>
						<select class="rqst_slct">
							<option value="0">선택</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
					<div class="rqst_slct_wrap">
						<div class="rqst_slct_title">발급유형*</div>
						<select class="rqst_slct">
							<option value="선택">선택</option>
							<option value="1">국문증명서</option>
							<option value="2">영문증명서</option>
						</select>
					</div>
					<div class="rqst_input_wrap">
						<div class="rqst_input_title">용도 및 제출처*</div>
						<textarea class="rqst_input" rows="5" cols="20"></textarea>
						<div class="rqst_btn_area">
							<input type="button" value="신청" class="rqst_btn" />
						</div>
					</div>
				</div>
			</div>
			<div class="crtfct_list">
				<div class="crtfct_list_title">발급목록</div>
				<div class="crtfct_list_cont">
					<table class="crtfct_table">
						<colgroup>
							<col width="50">
							<col width="100">
							<col width="200">
							<col width="100">
							<col width="100">
							<col width="80">
						</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th>증명서종류</th>
								<th>발급용도</th>
								<th>발급요청일</th>
								<th>발급완료일</th>
								<th>발급현황</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${list}">
						         <tr>
						            <td >${data.CRTFCT_NUM}</td>
						         	<c:choose>
						         		<c:when test="${data.CRTFCT_KIND==1}">
						         			<td>재직증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==2}">
						         			<td>경력증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==3}">
						         			<td>퇴직증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==4}">
						         			<td>기타</td> 
						         		</c:when>
						         	</c:choose>
						            <td>${data.USE}</td>
						            <td>${data.RQST_DATE}</td>
						            <td>${data.ISSUE_DATE}</td>
						         	<c:choose>
						         		<c:when test="${data.ISSUE_STS_NUM==0}">
						         			<td>발급요청</td> 
						         		</c:when>
						         		<c:when test="${data.ISSUE_STS_NUM==1}">
						         			<td style="color:#4B94F2;">발급완료</td> 
						         		</c:when>
						         		<c:when test="${data.ISSUE_STS_NUM==2}">
						         			<td style="color:#ff6f60;">발급불가</td> 
						         		</c:when>
						         	</c:choose>
						         </tr>
						      </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>