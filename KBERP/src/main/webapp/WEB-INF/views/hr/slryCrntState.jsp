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
.slryCrntState_left_area {
	display: inline-block;
	vertical-align: top;
	height: 490px;
	width: 500px;
	border-bottom: solid 1px #b7b7b7;
}
.slryCrntState_right_area {
	display: inline-block;
	vertical-align: top;
	height: 480px;
	width: 500px;
	margin-left: 45px;
}
.popup_emp_srch_area {
    display: inline-block;
    vertical-align: top;
    width: 464px;
    height: 22px;
    text-align: center;
    margin: 0 5px;
    border-top: solid 1px #b7b7b7;
    padding: 8px;
}

.popup_srch_box {
	display: inline-block;
}

.emp_srch_select {
	border: solid 1px #b7b7b7;
	border-radius: 3px;
	min-width: 90px;
	height: 29px;
}

.popup_srch_input {
	display: inline-block;
	vertical-align: top;
	width: 300px;
	height: 28px;
	margin-left: 10px;
	margin-right: 10px;
	text-align: center;
	border: 1px solid #d7d7d7;
	line-height: 26px;
}

.popup_srch_input input {
width: 283px;
    height: 26px;
    padding-left: 11px;
    border: none;
}

.empinqry_area {
	margin: 12px;
	display: inline-block;
	vertical-align: top;
	height: 250px;
}

.empinqry_list {
	display: inline-table;
	border-collapse: collapse;	
	width: 480px;
	margin-bottom: 15px;
}

.empinqry_list thead tr {
	background-color: #f1f1f1;
	border-bottom: 1px solid #d7d7d7;
	height: 30px;
	font-size: 10pt;
	position: sticky;
	color: #222222;
	top: 0;
}

.empinqry_list tbody tr {
	border-bottom: 1px solid #d7d7d7;
	height: 30px;
	text-align: center;
	color: #222222;
	font-size: 9.5pt;
}

.empinqry_list tbody tr:hover {
	background-color: rgb(200, 218, 248);
}

/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
  
	$(".empinqry_area").slimScroll({height: "450px"});
	   

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
			<div class="page_title_text">급여 현황</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="slryCrntState_left_area">
				<div class="popup_emp_srch_area">       
					<select class="emp_srch_select" id="inqryGbn" name="inqryGbn">
						<option value="0" selected>전체</option>
						<option value="1">부서명</option>      
						<option value="2">사원명</option>      
						<option value="3">직급명</option>     
					</select>                                   
					<div class="popup_srch_input">	                 
						<input type="text" id="inqryTxt" name="inqryTxt"/>        
					</div>                                      
					<div class="cmn_btn" id="inqryBtn">검색</div>           
					</div>                                      
					<div class="empinqry_area">        
		             <table class="empinqry_list">  
		               <colgroup>                     
		                  <col width="80"/>        
		                  <col width="100"/>        
		                  <col width="100"/>        
		                  <col width="100"/>        
		                  <col width="100"/>        
		               </colgroup>                    
		               <thead>                        
		                  <tr>                        
		                     <th>no</th>            
		                     <th>부서</th>            
		                     <th>직급</th>            
		                     <th>사원명</th>         
		                     <th>사원번호</th>        
		                  </tr>                       
		               </thead>                       
		               <tbody id="aprvlerInqry_tbody">  
               			  <c:forEach var="data" items="${list}">
					         <tr>
					            <td>${data.ROWNUM}</td>
					            <td>${data.DEPT_NAME}</td>
					            <td>${data.RANK_NAME}</td>
					            <td>${data.EMP_NAME}</td>
					            <td>${data.EMP_NUM}</td>
					         </tr>
					      </c:forEach>
		               </tbody>                       
		              </table>                        
		            </div>       
	            </div>
			<div class="slryCrntState_right_area">
				<div class=""
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>