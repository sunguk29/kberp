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

.crbn_copy {
	margin-left: 100px;
}

#crbn_copy_1{
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

#cont_1 {
	
	font-size: 14px;
	margin-left : 170px;
	margin-top: 20px;
	width: 500px;
	height: 200px;
}

.orgnzt_chart {
	display:inline-block;
	width: 300px;
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
$(document).ready(function() {
	
	$(".srch").on("click", function() {
		
		var html = "";
		
		
			html+= "	<form action = \"#\" id = \"addForm\" method = \"post\">";
			html+= "	<input type =\"hidden\" id = \"al\" name = \"al\" value = \"${al}\"/>";
			html+= "	<input type =\"hidden\" id = \"empNum\" name = \"empNum\" value = \"${empNum}\"/>";
			html+= "	<input type =\"hidden\" id = \"title\" name = \"title\" value = \"${title}\"/>";
			html+= "	<input type =\"hidden\" id = \"cont\" name = \"cont\" value = \"${cont}\"/>";
			html+= "	<div>																																	";
			html+= "	<div style= \"border:1px solid #000; width:50px; height: 25px;\" >조직도</div>															";
			html+= "	</div>                                                                                                                                  ";
			html+= "	<div style=\"display:inline-block; height: 400px; margin-top: 1opx;\">                                                                  ";
			html+= "	<div class=\"orgnzt_chart\">                                                                                                        	";
			html+= "	<table class=\"orgnzt_chart1\">";
			html+= "	<colgroup>                                                                                                                      		";
			html+= "	<col width=\"75\">                                                                                                           		    ";
			html+= "	<col width=\"75\">                                                                                                            			";
			html+= "	<col width=\"75\">                                                                                                         		    ";
			html+= "	<col width=\"75\">                                                                                                         		    ";
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
			html+= "	</div>                                                                                                                            	    ";
			html+= "	<div style=\" border: 1px solid #000; width: 100px; display:inline-block; vertical-align: top; margin-top: 150px;\">              	    ";
			html+= "	<span>결재방법</span><br/>                                                                                                      			";	
			html+= "	<input type = \"radio\" name=\"a\" id=\"r1\"/><label for = \"r1\" >결재</label><br/>                                         	     		";
			html+= "	<input type = \"radio\" name=\"a\" id=\"r2\"/><label for = \"r2\" >전결</label><br/>                                                     ";
			html+= "	<input type = \"radio\" name=\"a\" id=\"r3\"/><label for = \"r3\" >후결</label><br/><br/>                                                ";
			html+= "	<input type=\"button\" class=\"page_next\"><br/>                                                                                        ";
			html+= "	<input type=\"button\" class=\"page_prev\">                                                                                       ";
			html+= "	</div>                                                                                                                              	";
			html+= "	<div style=\"display: inline-block; border: 1px solid #000;  width: 300px; height: 400px; vertical-align: top; margin-top: 10px;\">     ";
			html+= "	<div style=\"margin-top:30px; margin-left: 10px;\">결재선 정보</div>                                                             		    ";
			html+= "	<table class=\"user_aprvl_line\">                                                                                                	    ";
			html+= "	<colgroup>                                                                                                                      		";
			html+= "	<col width=\"50\">                                                                                                           		    ";
			html+= "	<col width=\"70\">                                                                                                            			";
			html+= "	<col width=\"180\">                                                                                                         		    ";
			html+= "	</colgroup>                                                                                                                    		    ";
			html+= "	<thead>                                                                                                                     			";
			html+= "	<tr>                                                                                                                  				    ";
			html+= "	<th></th>                                                                                                          					    ";
			html+= "	<th>결재</th>                                                                                                      					    ";
			html+= "	<th>홍길동 기안 그룹웨어팀</th>                                                                                     							";
			html+= "	</tr>                                                                                                                  				    ";
			html+= "	</thead>                                                                                                                  			    ";
			html+= "	<tbody>                                                                                                                   			    ";
			html+= "	<tr>                                                                                                                   				    ";
			html+= "	<td></td>                                                                                                          					    ";
			html+= "	<td>결재</td>                                                                                                     					    ";
			html+= "	<td>길동이 그룹웨어팀 팀장</td>                                                                                     							";
			html+= "	</tr>                                                                                                                 				    ";
			html+= "	<tr>                                                                                                                  				    ";
			html+= "	<td></td>                                                                                                          					    ";
			html+= "	<td>결재</td>                                                                                                      					    ";
			html+= "	<td>아버지 인사팀 팀장</td>                                                                                         							";
			html+= "	</tr>                                                                                                                 				    ";
			html+= "	<tr>                                                                                                                   				    ";
			html+= "	<td>최종</td>                                                                                                      					    ";
			html+= "	<td>결재</td>                                                                                                       						";
			html+= "	<td>나사장 사장</td>                                                                                                						";
			html+= "	</tr>                                                                                                                   				";
			html+= "	</tbody>                                                                                                                    			";
			html+= "	</table>                                                                                                                        		";
			html+= "	</div>                                                                                                                              	";
			html+= "	</div>		                                                                                                                            ";
			html+= "		</form>";
			
		makePopup({
			bg : false,
			bgClose : false,
			width : 800,
			height : 600,
			title : "결재라인",
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
			buttons : [{
				name : "저장",
				func:function() {
					/* 여기에 넣기 */
					var addForm = $("#addForm");
		
					addForm.ajaxForm({
						success : function(res) {
						/* 	// 물리파일명 보관
							if(res.fileName.length > 0) {
								$("#attFile").val(res.fileName[0]);
							} */
							
							// 글 수정
							var params = $("#addForm").serialize();
							
							$.ajax({
								type : "post",
								url : "draftTmpltBoxWriteAjax/insert",
								dataType : "json",
								data : params,
								success : function(res) {
									if(res.res == "success") {
										console.log("@@@@@@@잘갔니")
										closePopup();
									} else {
										alert("등록중 문제가 발생하였습니다.");
									}
								},
								error : function(request, status, error) {
									console.log(request.responseText);
								}
							});
						},
						error : function(req) {
							console.log(req.responseText);
						}
					}); // ajaxForm end
					addForm.submit();
					console.log("One!");
					closePopup();
				}
			}, {
				name : "닫기"
			}]
		});
	});
	
	$(".srch_1").on("click", function() {
		
		var html = "";
		
		html+= "	<div>";
		html+= "	<div style= \"border:1px solid #000; width:50px; height: 25px;\" >조직도</div>		                                                      ";
		html+= "	</div>                                                                                                                                    ";
		html+= "	<div style=\"display:inline-block; height: 400px; margin-top: 1opx;\">                                                                      ";
		html+= "	<div class=\"orgnzt_chart\">                                                                                                                ";
		html+= "	조직도                                                                                                                                    ";
		html+= "	</div>                                                                                                                                    ";
		html+= "	<div style=\" border: 1px solid #000; width: 100px; display:inline-block; vertical-align: top; margin-top: 150px;\">                        ";
		html+= "	<input type=\"button\" class=\"page_next\"><br/>                                                                                                           ";
		html+= "	<input type=\"button\" class=\"page_prev\">				                                                                                              ";
		html+= "	</div>                                                                                                                                    ";
		html+= "	<div style=\"display: inline-block; border: 1px solid #000;  width: 300px; height: 400px; vertical-align: top; margin-top: 10px;\">         "; 
		html+= "	<div style=\"margin-top:20px; margin-left: 10px; border-bottom: 1px solid #000;\">선택(1/100)</div>                                         ";
		html+= "	<div style=\"margin-top:20px;\"> 나사장 사장</div>                                                                                          ";
		html+= "	</div>                                                                                                                                    ";
		html+= "	</div>                                                                                                                                    ";
		
		
		makePopup({
			bg : false,
			bgClose : false,
			width : 800,
			height : 600,
			title : "참조자",
			contents : html,
			buttons : [{
				name : "저장",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "닫기"
			}]
		});
	});

	
	CKEDITOR.replace("cont_1", {
		//옵션
		resize_enabled : false, // 크기변경
		language : "ko", //언어
		enterMode : 2, //엔터 <br/>처리
		width : "700", //가로
		height : "300" //세로
	});
	
	$("#writeBtn").on("click", function(){
		$("#cont_1").val(CKEDITOR.instances['cont_1'].getData());
		if(checkEmpty("#dcmnt_tlte_1")){
			alert("문서제목을 입력하세요.");
			$("#dcmnt_tlte_1").focus();
		} else if(checkEmpty("#aprvl_line_1")){
			alert("결재라인을 입력하세요.");
			$("#aprvl_line_1").focus();
		}
		else if(checkEmpty("#cont_1")){
			alert("내용을 입력하세요.");
			$("#cont_1").focus();
		}
		
		
	})
	
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
	$("tbody.og").html(html);
}	
	
	

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
				<input type= "text" id="aprvl_line_1">
				<img class= "srch" alt="srch_icon.png" src="resources/images/GW/cmn/srch_icon.png"/>
			</div>
			<div class="crbn_copy">
				<span>참조자</span>
				<input type= "text" id="crbn_copy_1">
				<img class= "srch_1" alt="srch_icon.png" src="resources/images/GW/cmn/srch_icon.png"/> 
			</div>
		
			
			<div class="cont">
				
				<textarea rows="20" cols="50" id="cont_1" name="cont_1"></textarea><br/> >
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