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
    height: 250px;
    padding: 10px 0px;
}

.crtfct_rqst_title {
height: 25px;
    font-size: 13pt;
    color: #333333;
    font-weight: 600;
    padding: 0 0 20px 0px;
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
    width: 882px;
    height: 250px;
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
    width: 882px;
    height: 270px;
    padding: 0px 0 10px 0;
    border-top: solid 1px #d7d7d7;
    overflow-y: scroll;
    border-bottom: solid 1px #d7d7d7;
}

.rqst_list_cont {
    display: inline-block;
    vertical-align: top;
    width: 882px;
    height: 210px;
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

.crtfct_table thead tr{
	color: #333333;
	font-size: 13px;
}
/* 증명서 발급 팝업 */

.r_info_wrap {	
	display: inline-block;
    vertical-align: top;
    height: 143px;
    border-bottom: solid 1px #d7d7d7;
    margin-bottom: 12px;
}

.r_info_row {
    line-height: 26px;
    height: 30px;
    line-height: 26px;
    height: 30px;
    padding: 7px 18px;
}

.r_info{
    display: inline-block;
    vertical-align: top;
    width: 195px;
    height: 31px;
}

.r_use_info{
    display: inline-block;
    vertical-align: top;
    width: 400px;
    height: 31px;
}

.r_info_txt {	
    display: inline-block;
    vertical-align: top;
    width: 65px;
    height: 31px;
    color: #222222;
    font-size: 13px;	
    text-align: right;
    padding-right: 5px;
}

.r_input {		
	display: inline-block;
    vertical-align: top;
    width: 100px;
    height: 24px;
    border: solid 1px #d7d7d7;
    border-radius: 4px;
    padding-left: 10px;
}

.use_input {		
	display: inline-block;
    vertical-align: top;
    width: 300px;
    height: 24px;
    border: solid 1px #d7d7d7;
    border-radius: 4px;
    padding-left: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
   $(".rqst_list_cont").slimScroll({height: "200px"}); // 슬림스크롤
   $(".crtfct_list_cont").slimScroll({height: "200px"}); // 슬림스크롤
   
   // 신청목록 클릭 시 
   $(".crtfct_table tbody tr").on("click", function() {
	   $("#rCrtfctNum").val($(this).attr("crtfctNum")); // 선택한 tr의 증명서번호 값 보관
	   console.log("증명서번호 : " +  $("#rCrtfctNum").val())
	  
	   var params = $("#crtfctAdminForm").serialize(); // 해당 증명서발급 정보 가져오기
	   $.ajax({
	       type : "post",
	       url : "crtfctAdminAjax/cont",
	       data : params,
	       dataType : "json",
	       success : function(res) {
	    	   if(res.res == "success") {
	    		   console.log(res)
	    		   var html = '';
	    		   $("#rcEmpNum").val(res.cont.EMP_NUM);
	    		   
	    			html += "	<div class=\"aprvl_popup_area\">                        ";
	    			html += "	<div class=\"r_info_wrap\">                             ";
	    			html += "		<div class=\"r_info_row\">                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">사원번호</div>    ";
	    			html += "				<input type=\"text\" class=\"r_input\" id=\"rcEmpNum\" readonly=\"readonly\"/> ";
	    			html += "			</div>                                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">재직여부</div>    ";
	    			html += "				<input type=\"text\" class=\"r_input\"/>    ";
	    			html += "			</div>                                          ";
	    			html += "		</div>                                              ";
	    			html += "		<div class=\"r_info_row\">                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">부서</div>        ";
	    			html += "				<input type=\"text\" class=\"r_input\"/>    ";
	    			html += "			</div>                                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">직급</div>        ";
	    			html += "				<input type=\"text\" class=\"r_input\"/>    ";
	    			html += "			</div>                                          ";
	    			html += "		</div>                                              ";
	    			html += "		<div class=\"r_info_row\">                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">입사일</div>      ";
	    			html += "				<input type=\"text\" class=\"r_input\"/>    ";
	    			html += "			</div>                                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">퇴사일</div>      ";
	    			html += "				<input type=\"text\" class=\"r_input\"/>    ";
	    			html += "			</div>                                          ";
	    			html += "		</div>                                              ";
	    			html += "	</div>                                                  ";
	    			html += "	<div class=\"r_crtfct_info_wrap\">                      ";
	    			html += "		<div class=\"r_info_row\">                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">증명서종류</div>  ";
	    			html += "				<input type=\"text\" class=\"r_input\"/>    ";
	    			html += "			</div>                                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">발급유형</div>    ";
	    			html += "				<input type=\"text\" class=\"r_input\"/>    ";
	    			html += "			</div>                                          ";
	    			html += "		</div>                                              ";
	    			html += "		<div class=\"r_info_row\">                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">발급매수</div>    ";
	    			html += "				<input type=\"text\" class=\"r_input\"/>    ";
	    			html += "			</div>                                          ";
	    			html += "			<div class=\"r_info\">                          ";
	    			html += "				<div class=\"r_info_txt\">발급요청일</div>  ";
	    			html += "				<input type=\"text\" class=\"r_input\"/>    ";
	    			html += "			</div>                                          ";
	    			html += "		</div>                                              ";
	    			html += "		<div class=\"r_info_row\">                          ";
	    			html += "			<div class=\"r_use_info\">                      ";
	    			html += "				<div class=\"r_info_txt\">용도</div>        ";
	    			html += "			   	<input type=\"text\" class=\"use_input\"/>  ";
	    			html += "			</div>                                          ";
	    			html += "		</div>                                              ";
	    			html += "	</div>                                                  ";
	    			html += "</div>                                                     ";
	    			   // 팝업
	    				makePopup({
	    					bg : false,
	    					bgClose : false,
	    					title : "발급상세",
	    					width: 500,
	    					height: 400,
	    					contents : html,
	    					buttons : [{
	    						name : "승인",
	    						func:function() {
	    							var params = $("#crtfctAdminForm").serialize();
	    							$.ajax({
	    							       type : "post",
	    							       url : "apntmListAjax/deleteApntm",
	    							       data : params,
	    							       dataType : "json",
	    							       success : function(res) {
	    									   closePopup();
	    									   makeAlert("알림", "발령이 취소되었습니다.", function(){
	    										   location.reload();
	    									   });
	    							       }, 
	    							       error : function(req) {
	    							          console.log(req.responseText);
	    							       }
	    							    });
	    							console.log("One!");
	    							closePopup();
	    						}
	    					}, {
	    						name : "반려"
	    					}, {
	    						name : "닫기"
	    					}]
	    				}); // 팝업 끝
	    	   } else {
	    		   console.log(res)
	    	   }
	       }, 
	       error : function(req) {
	          console.log(req.responseText);
	       }
	    });
	   

	});
   
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
		<form action="#" id="crtfctAdminForm" method="post">
			<input type="hidden" id=rCrtfctNum name="rCrtfctNum"/>
		</form>
		<div class="page_title_bar">
			<div class="page_title_text">증명서발급(관리자)</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<form action="#" id="addForm" method="post">
			<input type="hidden" id="sEmpNum" name="sEmpNum" value="${sEmpNum}" />
				<div class="crtfct_rqst">
					<div class="crtfct_rqst_title">신청목록</div>
				<div class="rqst_list_cont">
					<table class="crtfct_table">
						<colgroup>
							<col width="40">      
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
						</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th>사원번호</th>
								<th>사원명</th>
								<th>증명서종류</th>
								<th>용도</th>
								<th>발급요청일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${rList}">
						         <tr crtfctNum="${data.CRTFCT_NUM}">
						            <td>${data.ROWNUM}</td> <!-- no -->
						            <td>${data.RQST_EMP_NUM}</td>
						            <td>${data.EMP_NAME}</td>
						         	<c:choose>
						         		<c:when test="${data.CRTFCT_KIND==0}">
						         			<td>재직증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==1}">
						         			<td>경력증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==2}">
						         			<td>퇴직증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==3}">
						         			<td>기타</td> 
						         		</c:when>
						         	</c:choose>
						            <td>${data.USE}</td>
						            <td>${data.RQST_DATE}</td>
						         </tr>
					      	</c:forEach>
						</tbody>
					</table>
				</div>
				</div>
			</form>
			<div class="crtfct_list">
				<div class="crtfct_list_title">발급목록</div>
				<div class="crtfct_list_cont">
					<table class="crtfct_table">
						<colgroup>
						<col width="30">      
							<col width="80">      
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
						</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th>증명서번호</th>
								<th>증명서종류</th>
								<th>발급용도</th>
								<th>발급요청일</th>
								<th>발급완료일</th>
								<th>발급현황</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${iList}">
						         <tr>
						            <td>${data.ROWNUM}</td>
						            <c:choose>
							            <c:when test="${data.ISSUE_STS_NUM==1}">
								            <td >${data.CRTFCT_NUM}</td>
							            </c:when>
							            <c:when test="${data.ISSUE_STS_NUM!=1}">
								            <td >-</td>
							            </c:when>
						            </c:choose>
						         	<c:choose>
						         		<c:when test="${data.CRTFCT_KIND==0}">
						         			<td>재직증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==1}">
						         			<td>경력증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==2}">
						         			<td>퇴직증명서</td> 
						         		</c:when>
						         		<c:when test="${data.CRTFCT_KIND==3}">
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
						         			<td style="color:#ff6f60;">발급불가: ${data.RSN}</td> 
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