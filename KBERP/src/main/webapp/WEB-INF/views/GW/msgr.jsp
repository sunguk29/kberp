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

.main_box {

}
.left_box {
	width : 350px;
	display : inline-block;
	margin-right: 10px;
}

.right_box {
	width : 300px;
	vertical-align : top;
	display : inline-block;
	
}
.rank_box {
	display :inline-block;
	border : 1px solid;
	width : 330px;
	height : 54px;
	margin-bottom: 10px;
	padding: 8px 0px 8px 20px;
	background-color: #f2cb05;
}

#user_rank {
	display : inline-block;
	vertical-align: top;
	display : inline-block;
	border : 0px solid;
	font-size : 13pt;
	margin-top: 17px;
	margin-right: 80px;
	background-color: #f2cb05;
	font-weight: bold;
	
}

.srch_img {
	vertical-align: bottom;
	display : inline-block;
	width : 30px;
	height : 30px;
	background-image: url("/images/write.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 20pt;
	margin-top: 17px;
	cursor: pointer;
}


.chat_box {
	display : inline-block;
	width : 350px;
	height : 610px;
	border : 1px solid;
	overflow: hidden auto;
	background-color: #f4f4f4;
}

.chat_list1 {
	display : block;
	width: 329px;
	height: 60px;
	border : 1px solid #85898F;
	padding: 8px 20px;
	font-size : 12pt;
	background-image: url("../images/profile.png");
	background-position: 250px 7px;
	background-repeat: no-repeat;
	background-size: 20pt;
	background-color: white;
}

.chat_list1 input:focus {
	outline:none;	
}

.chat_list2 input:focus {
	outline:none;	
}

.rank_box input:focus {
	outline:none;
}

.chat_list1_1 {
	display : inline-block;
	width: 40px;
	height: 40px;
	background-image: url("../images/alarm.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 25pt;
	cursor: pointer;
	margin-left: 120px;
}
.chat_list2 {
	display : inline-block;
	width: 329px;
	height: 60px;
	border : 1px solid #85898F;
	padding: 8px 20px;
	font-size : 12pt;
	background-image: url("./images/profile.png");
	background-position: 250px 7px;
	background-repeat: no-repeat;
	background-size: 20pt;
	background-color: white;
}

.chat_list2_1 {
	display : inline-block;
	width: 40px;
	height: 40px;
	border : 0px solid;
	padding : 2px;
	font-size : 14pt;
	background-image: url("../images/alarm.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 25pt;
	cursor: pointer;
	margin-left: 120px;
}

#chat_group {	
	display : inline-block;
	border: 0px solid;
	font-size : 13pt;
	text-overflow: ellipsis;
	margin-right: 28px;	
}

#head_count {
	vertical-align: bottom;
	display : inline-block;
	width: 20px;
	height: 20px;
	border: 0px solid;
	font-size : 13pt;

}

#chat_view {
	vertical-align : top;
	display : inline-block;
	border: 0px solid;
	font-size : 13pt;
	text-overflow: ellipsis;
	line-height : 14px;
	padding: 2px;
}

.msgr_main {
	vertical-align : top;
	display : inline-block;
	width: 570px;
	height: 692px;
	padding: 0px;
	border : 1px solid;
}

.msgr_logo {
	width: 210px;
	height: 200px;
	background-image: url("resources/images/msgr_logo_img.png");
	background-position: center;
	background-repeat: no-repeat;
	background-size: 140pt;
	margin-top: 100px;
	margin-left: 150px;
}

#main_msgr_btn {
	display: inline-block;
	vertical-align: top ;
	padding: 0px 10px;
	min-width: 30px;
	height: 50px;
	line-height: 30px;
	font-size: 20pt;
	font-weight: bold;
	text-align: center;
	border-radius: 2px;
	background-color : #F2B705;
	color: #222222;
	cursor: pointer;
	margin-top : 200px;
	margin-left : 10px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}

.srch_mid {
	display : inline-block;
	width: 480px;
	height: 60px;
	margin-top: 10px; 


}
.srch_rcpnt {
	font-size: 11pt;
	text-indent: 10pt;
	font-weight: bold;
	
}
.srch_srch {
	margin-top: 10pt;
	margin-left: 9pt;
	font-size: 11pt;
	border: none;
}

table {
	border-collapse: collapse;
	width: auto;
	margin-top: 15px;
	border-top: 1px solid #5555; 
}

thead {
	display : inline-block;
	font-size: 14px;
	border-collapse: collapse;
	border-bottom: 1px solid #5555;
}

tbody {
	display :inline-block;
	height: 40px;
	font-size: 13px;
	color: black;
}

th:nth-child(1), th:nth-child(2) {
	width: 120px;
	height: 39.5px;
	text-align: center;
	border-right: 1px solid #5555; 
}
th:nth-child(3) {
	width: 120px;
	text-align: center; 
	border-right: 1px solid #5555;
}
th:nth-child(4) {
	width: 120px;
	text-align: center; 
}
td:nth-child(1), td:nth-child(2) {
	text-align: center;
	font-size: 12pt; 
}

td:nth-child(5) {
	height : 30px;
	border-bottom : 1px solid #5555;
}

#srch_check {

}

.chart {
	width: 45px;
	height: 45px;
	background-image: url("../images/chart.png");
	background-position: center;
	background-repeat: no-repeat;
	background-size: 38pt;
	position: absolute;
	margin-left: 420px;
	cursor: pointer;
}

.rcpnt_rank_box {
	vertical-align : top;
	display : inline-block;
	width : 530px;
	height : 54px;
	border : 1px solid;
	padding: 8px 20px 8px 20px;
	margin-bottom: 10px;
	background-color: #f2cb05;
}

#rcpnt_rank {
	width : 300px;
	display : inline-block;
	vertical-align: top;
	display : inline-block;
 	border : 0px solid;
	font-size : 13pt;
	margin-top: 17px;
	margin-left : 120px;
	text-align: left;
	background-color: #f2cb05;
	font-weight: bold; 
}

.chat_room {
	vertical-align : top;
	display : inline-block;
	width : 550px;
	height : 590px;
	border : 1px solid;
	padding: 10px;
}

.chat_dtl {
	width : 550px;
	height : 540px;
	border-radius: 8px;
	
}


.chat_input {
	display : inline-block;
	width : 540px;
	height : 40px;
	position: relative;
}

.chat_write {
	display: inline-block;
	width : 540px;
	height : 40px;
	font-size: 13pt;
	border-radius: 8px;
	text-indent: 10pt;
	position : relative;
}

.chat_img_file {
 	width : 35px;
	height : 35px;
 	background-image: url("../images/file.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 24pt;
	position: absolute;
	z-index: 100;
	cursor: pointer;
	margin-left: 505px;
	margin-top: 6px;
}

.chat_img_plus {
 	width : 35px;
	height : 35px;
 	background-image: url("../images/plus.png");
	background-position: 0px 0px;
	background-repeat: no-repeat;
	background-size: 24pt;
	position: absolute;
	z-index: 100;
	cursor: pointer;
	margin-left: 465px;
	margin-top: 6px;
}

.chat_rcpnt {
	display: block;
	height: 40px;
	width: 120px;
	border : 1px solid;
	font-size: 14pt;
	text-indent: 5pt;
	border-radius: 8px;
	position: relative;
	top: 425px;
	background-color: white;
}
.chat_user {
	display: block;
	height: 40px;
	width: 80px;
	border : 1px solid;
	font-size: 14pt;
	text-align : center;
	border-radius: 8px;
	position: relative;
	top: 440px;
	left : 465px;
	background-color: white;
}

.chat_time_rcpnt {
	display: inline-block;
	position: relative;
	left: 120px;
	bottom : 5px;
}

.chat_time_user {
	width : 150;
	display: inline-block;
	position: relative;
	right: 90px;
	bottom : 10px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	
	$("#main_msgr_btn").on("click", function() {
				
		var html = "";
		
		html +=	"		<div class = \"srch_mid\">                                          ";
		html +=	"		<div class = \"chart\"></div>                                         ";
		html +=	"			<div class = \"srch_rcpnt\">받는 사람:</div>                      	";
		html +=	"			<input type=\"text\" placeholder = \"검색...\" class = \"srch_srch\"> 	";
		html +=	"			<table>                                                         ";
		html +=	"				<thead>                                                     ";
		html +=	"					<tr>                                                    ";
		html +=	"					<th>부서</th>                                           	";
		html +=	"					<th>직급</th>                                           	";
		html +=	"					<th>성명</th>                                           	";
		html +=	"					<th>확인</th>                                           	";
		html +=	"				</tr>                                                       ";
		html +=	"				</thead>                                                    ";
		html +=	"				<tbody>                                                     ";
		html +=	"					<tr>                                                    ";
		html +=	"					<th>개발 1팀</th>                                       	";
		html +=	"					<th>대리</th>                                           	";
		html +=	"					<th>곽다훈</th>                                         	";
		html +=	"					<th><input type =\"checkbox\" id = \"srch_check\"></th>                                ";
		html +=	"				</tr>                                                       ";
		html +=	"				<tr>                                                        ";
		html +=	"					<th>영업 1팀</th>                                       	";
		html +=	"					<th>대리</th>                                          	";
		html +=	"					<th>이감자</th>                                         	";
		html +=	"					<th><input type =\"checkbox\" id = \"srch_check\"></th>                                ";
		html +=	"				</tr>		                                                ";
		html +=	"				<tr>                                                        ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"				</tr>                                                       ";
		html +=	"				<tr>                                                        ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"				</tr>		                                                ";
		html +=	"				<tr>                                                        ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"				</tr>                                                       ";
		html +=	"				<tr>                                                        ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"				</tr>                                                       ";
		html +=	"				<tr>                                                        ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"					<th></th>                                               ";
		html +=	"				</tr>								                        ";
		html +=	"				</tbody>					                                ";
		html +=	"			</table>                                                        ";
		html +=	"		</div>                                                              ";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "검색",
			contents : html,
			width : 500,
			height : 500,
			buttons : [{
				name : "완료",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	}); // main msgr btn
	
	$(".chat_list1").on("click", function() {
		
		var html = "";
		
		html += "			<div class = \"right_box\">                                                      ";
		html += "			<div class = \"rcpnt_rank_box\">                                                 ";
		html += "				<div id = \"rcpnt_rank\">대화상대 성명 / 부서 / 직급  외 2명 </div>          			   ";
		html += "			</div>		                                                                   ";
		html += "			                                                                               ";
		html += "			<div class = \"chat_room\">                                                      ";
		html += "				<div class = \"chat_dtl\">                                                   ";
		html += "					<div class = \"chat_rcpnt\">반갑습니다.&nbsp;                          	   ";
		html += "						<div class= \"chat_time_rcpnt\"><small>오전 11:20</small></div>        ";
		html += "					</div>                                                                 ";
		html += "					<div class = \"chat_user\">저도요.&nbsp;                                   ";
		html += "						<div class= \"chat_time_user\"><small>오후 12:13</small></div>         ";
		html += "					</div>					                                               ";
		html += "				</div>                                                                     ";
		html += "				<div class = \"chat_input\">                                                 ";
		html += "					<div class = \"chat_img_file\"></div>                                    ";
		html += "					<div class = \"chat_img_plus\"></div>                                    ";
		html += "					<input type= \"text\" placeholder = \"메시지 입력..\" class = \"chat_write\" />   ";		
		html += "				</div>                                                                     ";
		html += "			                                                                               ";
		html += "			</div>	                                                                       ";
		html += "			</div>	                                                                       ";
		
		
		$(".right_box").html(html);
		$(".msgr_main").remove();
		
		$.ajax({
			type : "post",
			url : "chatRoomAjax",
			dataType : "json",
			success : function(res) {
				console.log(res);
				
			},
			error : function(request, status, error) { 
				console(request.responseText);
			}
		});
	});
	
/*  	function reloadList() { //목록 조회용 + 페이징 조회용
		var params = $("#actionForm").serialize();
				
		$.ajax({
			type : "post",
			url : "chatRoomAjax",
			dataType : "json",
			data : params,
			success : function(res) { 
				console.log(res);
				drawList(res.list);
			},
			error : function(request, status, error) { 
				console(request.responseText); 
			}
		});
	}  */
	
}); // ready
</script>
</head>
<body>
<!-- <form action = "#" id = "actionForm" method = "post">
	<input type = hidden id = "chatList"/>
	<input type = "checkbox" id = "autoScroll" checked = "checked" />자동스크롤
</form> -->


	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<!-- 내용영역 -->
		<div class="page_title_bar">
			<div class="page_title_text">메신저</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
				<div class = "main_box">
	<div class = "left_box">
		<div class = "rank_box">
		<div id = "user_rank">사용자 성명 / 부서 / 직급</div>
		<div class = "srch_img"></div>	
		</div>
		
		<div class = "chat_box">
			<div class = "chat_list">
				<div class = "chat_list1">
					<input type="text" value = "대화상대1, 대화상대2, 대화상대 3" id = "chat_group" readonly="readonly" />
					<input type="text" value = "3" id = "head_count" readonly="readonly"/>
					<input type="text" value = "방가방가" id = "chat_view" readonly="readonly" style = "width:150px; color: #85898F" />
					<div class = "chat_list1_1"></div>
				</div>
				
				<div class = "chat_list2">
				<input type="text" value = "대화상대1, 대화상대2, 대화상대 3" id = "chat_group" readonly="readonly" />
				<input type="text" value = "3" id = "head_count" readonly="readonly"/>
				<input type="text" value = "하이루" id = "chat_view" readonly="readonly" style = "width:150px; color: #85898F" />
				<div class = "chat_list2_1"></div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class = "right_box">
		<div class = "msgr_main">
		<div class = "msgr_logo">
			<input type="button" value = "메시지 보내기" id = "main_msgr_btn" />	
		</div>
		</div>
	</div>
</div>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>