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

        table{
                border-collapse: collapse;
                border-spacing: 1px;
                text-align:left;
                border-top: 1px solid #b7b7b7;
                margin : 20px 10px;
        }
         tr {
                 width: 100%;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #b7b7b7;
                font-size:15pt;
        }
         td {
                 width: 100%;
                 padding: 10px;
                 vertical-align: top;
                 border-bottom: 1px solid #b7b7b7;
        }
       
 textarea{
 resize:none;
 }
  tr:nth-child(3){
 	height: 250px;
 }
 .cmn_btn_ml{
 	float:right;
 }
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : true,
			title : "등록",
			width: 400,
			height: 220,
			contents : "등록이 완료 되었습니다",
			buttons : {
				name : "확인",
				func:function() {
					console.log("One!");
					closePopup();
				}
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
		<div class="page_title_bar">
			<div class="page_title_text">안내글 등록</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		
			   <table>
                        <tr>
                        <td>작성자</td>
                        <td><input type = text name = name size=20> </td>
                        </tr>
 
                        <tr>
                        <td>제목</td>
                        <td><input type = text name = title size=60 ></td>
                        </tr>
 
                        <tr>
                        <td>내용</td>
                        <td><textarea name = content cols=85 rows=20 placeholder="내용을 입력하세요"></textarea></td>
                        </tr>
                        </table>
					<div class="cmn_btn_ml" id="btn1Btn">등록</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>