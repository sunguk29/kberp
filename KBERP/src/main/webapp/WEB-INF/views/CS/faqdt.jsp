<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqdt</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.buttons_bottom {
    margin-top: 10px;
}

.button_list {
    float: left;
}

.button_up {
    float: right;
    margin-left: 20px;
}

.button_del{
    float: right;
}

.page_title_bar {
    height: 30px;
    margin-bottom: 15px;
    width: 940px;
 }
 
.title-area {
    margin-bottom: 30px;
}

.title {
    font-size: 22px;
    font-weight: bold;
    text-indent: 10px;
    padding: 10px 0px;
    border-top: 3px solid gray;
}
.wrtr_info {
	margin-bottom:10px;
	
}
.date {
	display: inline-block;
    font-size: 16px;
    line-height: 13px;
    color: #909090;
    text-indent: 10px;
}


.cont{

	width: 940px;
	height: 500px;
	border: 1px solid #F0F0F0;
	
	font-size: 15px;
}

</style>
<script type="text/javascript">
	
	$(document).ready(function() {
		$("#listBtn").on("click", function() {
			$("#actionForm").attr("action", "faq");
			$("#actionForm").submit();
		});
		
		$("#updateBtn").on("click", function() {
			$("#actionForm").attr("action", "faqUpdate");
			$("#actionForm").submit();
		});
		
		$("#deleteBtn").on("click", function() {
			if(confirm("삭제하시겠습니까?")) {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					type : "post", 
					url : "faqdtAction/delete", 
					dataType : "json", 
					data : params, 
					success : function(res) { 
						if(res.res == "success") {
							location.href = "faqList";
						} else {
							alert("삭제중 문제가 발생하였습니다.");
						}
					},
					error : function(request, status, error) { 
						console.log(request.responseText);
					}
				});
			}
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
			<div class="page_title_text">FAQ</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<div class="title-area">
			<div class="title">${data.WRTNG_TITLE}</div>
			<div class="wrtr_info">
				<div class="date">${data.WRTNG_DATE}</div>
				<span class="cate">
					<select disabled="disabled" id="ctgry_name" name="ctgry_name">
				 		<option>${data.CTGRY_NAME}</option>
					</select>
				</span>
			</div>
		</div>
			
			<div class="cont">
			${data.WRTNG_CONT}
			</div>
			<div class="buttons_bottom">
				<div class="button_list" id="listBtn">
					<div class="cmn_btn">목록</div>
				</div>
				<div class="button_up" id="updateBtn">
					<div class="cmn_btn">수정</div>
				</div>
				<div class="button_del" id="deleteBtn">
					<div class="cmn_btn">삭제</div>
				</div>
			</div>
		</div>
	</div>
	
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="no" value="${param.no}" />
		<input type="hidden" name="page" value="${param.page}" />
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>