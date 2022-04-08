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

.board_a{
	display: flex;
	justify-content: flex-end;
}

#writeBtn {
	width: 100px;
	height: 30px;
	font-size: 14px;
	border: 1px solid #000;
	margin-right: 10px;
	line-height: 2;
	text-align: center;
	background-color: #f2b705;
	
}

#cancelBtn {
	width: 100px;
	height: 30px;
	font-size: 14px;
	border: 1px solid #000;
	line-height: 2;
	text-align: center;
	background-color: #f2b705;
}

span {
	font-size: 14px;
}

.aprvl_num {
	margin-left: 100px;
}

#aprvl_num_1 {
	height: 30px;
	font-size: 14px;
	margin-left: 40px;
}

.draft {
	margin-left: 100px;
}

#draft_1 {
	height: 30px;
	font-size: 14px;
	margin-left: 55px;
	margin-top: 20px;
}

.draft_day {
	margin-left: 100px;
}

#draft_day_1 {
	height: 30px;
	font-size: 14px;
	margin-left : 40px;
	margin-top: 20px;
	width: 178px;
}

.srch {
	width: 50px;
	height: 30px;
	position: relative;
	top: 10px;
	
}

.srch_1 {
	width: 50px;
	height: 30px;
	position: relative;
	top: 10px;
	
}

.dcmnt_tlte {
	margin-left: 100px;
}

#dcmnt_tlte_1 {
	height: 50px;
	font-size: 14px;
	margin-left : 40px;
	margin-top: 20px;
	width: 500px;
}

.aprvl_line {
	margin-left: 100px;
}

#aprvl_line_1 {
	height: 50px;
	font-size: 14px;
	margin-left : 40px;
	margin-top: 20px;
	width: 300px;
}

.rfrnc {
	margin-left: 100px;
}

#aprvl_line_emp_name {
	margin-left: 40px;
	height: 50px;
	margin-top: 20px;
	width: 300px;
}

#rfrnc_emp_name{
	height: 50px;
	font-size: 14px;
	margin-left : 55px;
	margin-top: 20px;
	width: 300px;
	
}

.atchd_file {
	margin-left: 100px;
}

#atchd_file_1 {
	height: 30px;
	font-size: 14px;
	margin-left : 40px;
	margin-top: 20px;
}


.cont{
	margin-left: 100px;
}

#tmplt_cont {
	
	font-size: 14px;
	margin-left : 170px;
	margin-top: 20px;
	width: 500px;
	height: 200px;
}

.orgnzt_chart {
	display:inline-block;
	width: 400px;
	height: 400px;
	border: 1px solid #000;
	margin-top: 10px;
	vertical-align: top;
	text-align: center;

}

.orgnzt_chart1 {
	border-collapse: collapse;
		
}

.orgnzt_chart1 th {
	border-top: 1px solid #000;
	border-bottom: 1px solid #000;
	text-align: center;
}

.user_aprvl_line {
	border-collapse: collapse;
	margin-top: 50px;

}

.user_aprvl_line td {
	border-top: 1px solid #000;
	text-align: center;
	border-right: 1px solid #000;
}

.user_aprvl_line th {
	border-right: 1px solid #000;
}


.page_next {
	background-image: url('resources/images/GW/cmn/next_icon.png'); 
	background-repeat: no-repeat;
	background-size: 15px;
	font-size: 14px;
	border: 1px solid #000;	
	width: 100px;
}

.page_prev {
	background-image: url('resources/images/GW/cmn/prev_icon.png');
	background-repeat: no-repeat;
	border: 1px solid #000;
	background-size: 15px;
	font-size: 14px;
	width: 100px;
}


/* 개인 작업 영역 */

</style>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
var aprvlEmpNumList = new Array();
var aprvlEmpNameList = new Array();
var rfrncEmpNumList = new Array();
var rfrncEmpNameList = new Array();
$(document).ready(function() {
	
	
	
	$(".srch").on("click", function() {
		
		var html = "";
		
		
			html+= "	<div>																																	";
			html+= "	<div style= \"border:1px solid #000; width:50px;\" >";
			html+= "<input type=\"text\" id=\"checkEmpNum\" />";
			html+= "<div style = \"border: 1px solid #000; width: 300px;\" id=\"checkEmpName\"></div>";
			html+= "</div>";
			html+= "	</div>                                                                                                                                  ";
			html+= "	<div style=\"display:inline-block; height: 400px; margin-top: 1opx;\">                                                                  ";
			html+= "	<div class=\"orgnzt_chart\"> ";
			
			html+= "	<table class=\"orgnzt_chart1\">";
			html+= "	<colgroup>                                                                                                                      		";
			html+= "	<col width=\"100\">                                                                                                           		    ";
			html+= "	<col width=\"100\">                                                                                                            			";
			html+= "	<col width=\"100\">                                                                                                         		    ";
			html+= "	<col width=\"100\">                                                                                                         		    ";
			html+= "	</colgroup>                                                                                                                    		    ";
			html+= "	<thead>";
			html+= "	<tr>";
			html+= "	<th>부서</th>";
			html+= "	<th>직급</th>";
			html+= "	<th>성명</th>";
			html+= "	<th>확인</th>";
			
			
			html+= "	</tr>";
			html+= "	</thead>";
			html+= "	<tbody class=\"og\">";
			
			html+= "	</tbody>";
			
			html+= "	</table>";
			
			html+= "	</div>";
			html+= "	</div>                                                                                                                            	    ";
			
		makePopup({
			bg : false,
			bgClose : false,
			width : 600,
			height : 600,
			title : "결재라인",
			contents : html,
			contentsEvent : function() {
				if($("#aprvl_line_emp_num").val() != "") {
					aprvlEmpNumList = $("#aprvl_line_emp_num").val().split(",");
					aprvlEmpNameList = $("#aprvl_line_emp_name").val().split(",");
					$("#checkEmpNum").val(aprvlEmpNumList.toString());
					$("#checkEmpName").html(aprvlEmpNameList.toString());
				}
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
				$(".orgnzt_chart").slimScroll({height: "450px"});
				
				$(".og").on("click", "input[type='checkbox']", function() {
					if($(this).is(":checked")) {
						aprvlEmpNumList.push($(this).val());
						aprvlEmpNameList.push($(this).attr("emp_name"));
					} else {
						removeValToArray(aprvlEmpNumList, $(this).val());
						removeValToArray(aprvlEmpNameList, $(this).attr("emp_name"));
					}
					$("#checkEmpNum").val(aprvlEmpNumList.toString());
					$("#checkEmpName").html(aprvlEmpNameList.toString());
				});
 			},
			buttons : [{
				name : "저장",
				func:function() {
					
					/* 여기에 넣기 */
					$("#aprvl_line_emp_num").val(aprvlEmpNumList.toString());
					$("#aprvl_line_emp_name").val(aprvlEmpNameList.toString());
					
					closePopup();
				}
			}, {
				name : "닫기"
			}]
		});
	});
	
	
	
	$(".srch_1").on("click", function() {
		
		
		var html = "";
		
		html+= "	<div>																																	";
		html+= "	<div style= \"border:1px solid #000; width:50px;\" >";
		html+= "<input type=\"text\" id=\"checkEmpNums\" />";
		html+= "<div style = \"border: 1px solid #000; width: 300px;\" id=\"checkEmpNames\"></div>";
		html+= "</div>";
		html+= "	</div>                                                                                                                                  ";
		html+= "	<div style=\"display:inline-block; height: 400px; margin-top: 1opx;\">                                                                  ";
		html+= "	<div class=\"orgnzt_chart\"> ";
		
		html+= "	<table class=\"orgnzt_chart1\">";
		html+= "	<colgroup>                                                                                                                      		";
		html+= "	<col width=\"100\">                                                                                                           		    ";
		html+= "	<col width=\"100\">                                                                                                            			";
		html+= "	<col width=\"100\">                                                                                                         		    ";
		html+= "	<col width=\"100\">                                                                                                         		    ";
		html+= "	</colgroup>                                                                                                                    		    ";
		html+= "	<thead>";
		html+= "	<tr>";
		html+= "	<th>부서</th>";
		html+= "	<th>직급</th>";
		html+= "	<th>성명</th>";
		html+= "	<th>확인</th>";
		
		
		html+= "	</tr>";
		html+= "	</thead>";
		html+= "	<tbody class=\"og\">";
		
		html+= "	</tbody>";
		
		html+= "	</table>";
		
		html+= "	</div>";
		html+= "	</div>                                                                                                                            	    ";
		
		
		makePopup({
			bg : false,
			bgClose : false,
			width : 600,
			height : 600,
			title : "참조자",
			contents : html,
			contentsEvent : function() {
				if($("#rfrnc_emp_num").val() != "") {
					console.log()
					
					rfrncEmpNumList = $("#rfrnc_emp_num").val().split(",");
					rfrncEmpNameList = $("#rfrnc_emp_name").val().split(",");
					$("#checkEmpNums").val(rfrncEmpNumList.toString());
					$("#checkEmpNames").html(rfrncEmpNameList.toString());
				}
				// Ajax태우고
				// list받아서 팝업 테이블에 내용 추가 id추가
				$.ajax({
					type : "post",
					url : "addListChatAjax",
					dataType : "json",
					success : function(res) {
						drawEmp(res.list);
					},
					error : function(req) {
						console.log(req.responseText)	
					}
				});
				$(".orgnzt_chart").slimScroll({height: "450px"});
				
				$(".og").on("click", "input[type='checkbox']", function() {
					if($(this).is(":checked")) {
						rfrncEmpNumList.push($(this).val());
						rfrncEmpNameList.push($(this).attr("emp_name"));
					} else {
						removeValToArray(rfrncEmpNumList, $(this).val());
						removeValToArray(rfrncEmpNameList, $(this).attr("emp_name"));
					}
					$("#checkEmpNums").val(rfrncEmpNumList.toString());
					$("#checkEmpNames").html(rfrncEmpNameList.toString());
				});
 			},
			buttons : [{
				name : "저장",
				func:function() {
					
					/* 여기에 넣기 */
					$("#rfrnc_emp_num").val(rfrncEmpNumList.toString());
					$("#rfrnc_emp_name").val(rfrncEmpNameList.toString());
					
					closePopup();
				}
			}, {
				name : "닫기"
			}]
		});
	});

	
	CKEDITOR.replace("tmplt_cont", {
		//옵션
		resize_enabled : false, // 크기변경
		language : "ko", //언어
		enterMode : 2, //엔터 <br/>처리
		width : "700", //가로
		height : "300" //세로
	});
	
	$("#writeBtn").on("click", function(){
		$("#tmplt_cont").val(CKEDITOR.instances['tmplt_cont'].getData());
		if(checkEmpty("#dcmnt_tlte_1")){
			alert("문서제목을 입력하세요.");
			$("#dcmnt_tlte_1").focus();
		} else if(checkEmpty("#aprvl_line_emp_name")){
			alert("결재라인을 입력하세요.");
			$("#aprvl_line_emp_name").focus();
		}
		else if(checkEmpty("#tmplt_cont")){
			alert("내용을 입력하세요.");
			$("#cont_1").focus();
		}
		
		
	})
	
function drawList(list) {
	
	var html = "";
	
		for(var data of list) {
			html +=	"				<tr id = \"srchEmpNum\" no = " + data.EMP_NUM + "\>";  
			html +=	"					<td id = \"srchDept\"> " + data.DEPT_NAME + "\</td>";
			html +=	"					<td id = \"srchRank\"> " + data.RANK_NAME + "\</td>";
			html +=	"					<td id = \"srchName\"> " + data.EMP_NAME + "\</td>";
			html +=	"					<td><input type =\"checkbox\" id = \"srch_check\" name=\"humans\" value=\"" + data.EMP_NUM + "\" emp_name=\"" + data.EMP_NAME + " " + data.RANK_NAME + "\" /></td> ";
			html +=	"				</tr>                                                       ";
		}	
	$("tbody.og").html(html);
	
	$(".og input[type='checkbox']").each(function() {
		if(aprvlEmpNumList.indexOf($(this).val()) >= 0) {
			$(this).prop("checked", true);
		}
	});
}	
	
	
	function drawEmp(list) {
		
		var html = "";
		
			for(var data of list) {
				html +=	"				<tr id = \"srchEmpNum\" no = " + data.EMP_NUM + "\>";  
				html +=	"					<td id = \"srchDept\"> " + data.DEPT_NAME + "\</td>";
				html +=	"					<td id = \"srchRank\"> " + data.RANK_NAME + "\</td>";
				html +=	"					<td id = \"srchName\"> " + data.EMP_NAME + "\</td>";
				html +=	"					<td><input type =\"checkbox\" id = \"srch_check\" name=\"humans\" value=\"" + data.EMP_NUM + "\" emp_name=\"" + data.EMP_NAME + " " + data.RANK_NAME + "\" /></td> ";
				html +=	"				</tr>                                                       ";
			}	
		$("tbody.og").html(html);
		
		$(".og input[type='checkbox']").each(function() {
			if(rfrncEmpNumList.indexOf($(this).val()) >= 0) {
				$(this).prop("checked", true);
			}
		});
	}	
	
	
	

});

function removeValToArray(arr, val) {
	for(var i = 0 ; i < arr.length ; i++) {
		if(arr[i] == val) {
			arr.splice(i, 1);
			break;
		}
	}
}

function removeAllValToArray(arr, val) {
	for(var i = 0 ; i < arr.length ; i++) {
		if(arr[i] == val) {
			arr.splice(i, 1);
			i--;
		}
	}
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
	<form action="#" id="actionForm" method="post">
		<%-- <input type= "hidden" id="tmplt_num" name="tmplt_num" value="${cont.TMPLT_NUM}"> --%>
		
	</form>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">프로젝트 관리</div>
			<!-- 검색영역 선택적 사항 -->
		
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			
			<form action="draftTmpltBox" id="writeForm" method="post">
			<div class="board_a">
				<input type="button" id="writeBtn" value="저장"> 
				<input type="button" id="cancelBtn" value="취소">
				
			</div>
			
			<div class="dcmnt_tlte">
				<span>문서제목</span>
				<input type="text" id="dcmnt_tlte_1">
				<input style="display:none;" type="text" id="type" name="type" value="${type}">
			</div>
			<div class="aprvl_line">
				<span>결재라인</span>
				<input type="hidden" id="aprvl_line_emp_num" name="aprvl_line_emp_num" />
				<input type= "text" id="aprvl_line_emp_name">
				<img class= "srch" alt="srch_icon.png" src="resources/images/GW/cmn/srch_icon.png"/>
			</div>
			<div class="rfrnc">
				<span>참조자</span>
				<input type="hidden" id="rfrnc_emp_num" name="rfrnc_emp_num" />
				<input type= "text" id="rfrnc_emp_name">
				<img class= "srch_1" alt="srch_icon.png" src="resources/images/GW/cmn/srch_icon.png"/> 
			</div>
		
			
			<div class="cont">
				
				<textarea rows="20" cols="50" id="tmplt_cont" name="tmplt_cont">${cont.TMPLT_CONT}</textarea><br/> >
			</div>
			<div class="atchd_file">
				<span>첨부파일</span>
				<input type="file" id="atchd_file_1">
			</div>
			</form>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>