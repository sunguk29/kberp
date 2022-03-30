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
	background-image: url("resources/images/GW/write.png");
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
	background-image: url("resources/images/GW/profile.png");
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
	background-image: url("resources/images/GW/alarm.png");
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
	background-image: url("resources/images/GW/profile.png");
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
	background-image: url("resources/images/GW/alarm.png");
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
	background-image: url("resources/images/GW/msgr_logo_img.png");
	background-position: center;
	background-repeat: no-repeat;
	background-size: 140pt;
	margin-top: 200px;
	margin-left: 180px;
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
	width : 400px;
	height: 25px;
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

tr {
	overflow: auto;
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
td:nth-child(1), td:nth-child(2), td:nth-child(3), td:nth-child(4) {
	text-align: center;
	font-size: 12pt; 
	width: 120px;
	height: 39.5px;
}

#srchEmpNum {
	overflow: auto;
}

#srch_check {

}

.chart {
	width: 45px;
	height: 45px;
	background-image: url("resources/images/GW/chart.png");
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
	width : 550px;
	height : 40px;
	position: relative;
}

.chat_write {
	display: inline-block;
	width : 470px;
	height : 40px;
	font-size: 13pt;
	border-radius: 8px;
	text-indent: 10pt;
	position : relative;
}

.chat_img_file {
 	width : 35px;
	height : 35px;
 	background-image: url("resources/images/GW/file.png");
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
 	background-image: url("resources/images/GW/plus.png");
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

.cmn_btn_ml {
	display : inline-block;	
	border-radius: 5px;
	position: absolute;
	margin-top: 5px;
	margin-left: 0px;
	height : 35px;
	font-size: 14px;
}

.popup_cont {

}

</style>
<script type="text/javascript">

$(document).ready(function() {

	$("#main_msgr_btn, .srch_img").on("click", function() {

		var html = "";
		
		html += "		<form action = \"#\" id = \"addForm\" method = \"post\">";
		html += "			<input type = \"hidden\" id = \"no\" name = \"no\" />";					
/* 		html += "			<input type = \"hidden\" id = \"emp_num\" name = \"EMP_NAME\" />";
		html += "			<input type = \"hidden\" id = \"chat_num\" name = \"DEPT_\"/>";
/* 		html += "			<input type = \"hidden\" id = \"srch_check\" name = \"srch_check\"/>"; */

		html +=	"		<div class = \"srch_mid\">                                          ";
		html +=	"		<div class = \"chart\"></div>                                       ";
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
		
		html +=	"				</tbody>					                                ";
		html +=	"			</table>                                                        ";
		html +=	"		</div>                                                              ";
		html += "		</form>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "검색",
			width : 500,
			height : 500,
			contents : html,
			contentsEvent : function() {
				// Ajax태우고
				// list받아서 팝업 테이블에 내용 추가 id추가
				$.ajax({
					type : "post",
					url : "addListChatAjax",
					dataType : "json",
					success : function(res) {
						drawList(res.list);
					},
					error : function(req) {
						console.log(req.responseText)	
					}
				});
 			},
			width : 500,
			height : 500,
			buttons : [{
				name : "완료",
				func : function() {
					if(checkEmpty("#srch_check")) {
						alert("대화상대를 선택하세요.");
						$("#srch_check").focus();
					} else {
						var params = $("#addForm").serialize();
						console.log(params);
						// 아작스 태우기
						
						$.ajax({
							type : "post",
							url : "actionChat/insert",
							dataType : "json",
							success : function(res) {
								if()
							},
							error : function(req) {
								console.log(req.responseText)	
							}
						});
				}
			}, { 
				name : "취소",
					func : function() {
						closePopup();
					}
				
			}]
			
		});
		
	}); // main msgr btn
	

	
	
	$(".chat_list1").on("click", function() {	
		
		var html = "";
		
		html += "			<div class = \"right_box\">                                                      ";
		html += "			<div class = \"rcpnt_rank_box\">                                                 ";
		html += "				<div id = \"rcpnt_rank\">대화상대 성명 / 부서 / 직급  외 2명</div>          			 ";
		html += "			</div>		                                                                  	 ";
		html += "			                                                                              	 ";
		html += "			<div class = \"chat_room\">                                                      ";
		html += "				<div class = \"chat_dtl\">                                                   ";
		html += "					<div class = \"chat_rcpnt\">반갑습니다.&nbsp;                          	  	 ";
		html += "						<div class= \"chat_time_rcpnt\"><small>오전 11:20</small></div>        ";
		html += "					</div>                                                                	 ";
		html += "					<div class = \"chat_user\">저도요.&nbsp;                                   ";
		html += "						<div class= \"chat_time_user\"><small>오후 12:13</small></div>         ";
		html += "					</div>					                                              	 ";
		html += "				</div>                                                                    	 ";
		html += "				<div class = \"chat_input\">                                            	 ";
		html += "					<form id = \"insertForm\" method = \"post\">								 ";
		html += "						<input type = \"hidden\" name = \"empNum\" value = \"${empNum}\"/>			 ";
		html += "						<input type = \"hidden\" name = \"cont\" id = \"cont\" value = \"${empNum}\"/> ";
		html += "						<div class= \"cmn_btn_ml\" id = \"insertBtn\" style=\"float: left;\">보내기</div>";
		html += "						<div class = \"chat_img_file\"></div>                                ";
		html += "						<div class = \"chat_img_plus\"></div>                                ";
		html += "						<input type= \"text\" placeholder = \"메시지 입력..\" class = \"chat_write\" id = \"chat_wrtie\" onkeydown= \"enterCheck();\" style = \"float: right;\"/>";
		html += "					</form>																	 ";
		html += "				</div>                                                                     	 ";
		html += "			</div>	                                                                         ";
		html += "			</div>	                                                                         ";
		
		$(".msgr_main").remove();
		$(".right_box").html(html);
		
	
		
		$("#insertBtn").on("click", function() {
			if($.trim($("#chat_write").val()) == "") {
				alert("내용을 입력하세요.");
			} else {
				insert();
			}
		});
		
	});
	
}); // ready

function enterCheck() {
	if(event.keyCode == 13) {
		if($.trim($("#chat_write").val()) == "") {
			alert("내용을 입력해 주세요.");
		} else {
			insert();
		}
		return;
	}
}

function insert() {
	$(".chat_dtl").val($(".chat_write").val());
	
	var params = $("#insertForm").serialize();
	
 		$.ajax({
			type : "post",
			url : "insertContAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log(res);
				$(".chat_dtl").val("");
				$(".chat_write").val("");
			},
			error : function(res) { 
				alert(res.errorMessage);
				$(".chat_dtl").val("");
				$(".chat_write").val("");
			}
		}); 
	}

function checkEmpty(sel) {
	if($.trim($(sel).val()) == ""){
		return true;
	} else {
		return false;
	}
}

function drawList(list) {
	
	var html = "";
	
		for(var data of list) {
			html +=	"				<tr id = \"srchEmpNum\" no = \"" + data.EMP_NUM + "\">";  
			html +=	"					<td id = \"srchDept\"> \"" + data.DEPT_NAME + "\"</td>";
			html +=	"					<td id = \"srchRank\"> \"" + data.RANK_NAME + "\"</td>";
			html +=	"					<td id = \"srchName\"> \"" + data.EMP_NAME + "\"</td>";
			html +=	"					<td><input type =\"checkbox\" id = \"srch_check\"></td> ";
			html +=	"				</tr>                                                       ";
		}	
	$("tbody").html(html);
}
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
<!-- 		<div class="page_title_bar">
			<div class="page_title_text">메신저</div>
		</div> -->
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
					<input type="text" value = "대화상대명" id = "chat_group" readonly="readonly" />
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