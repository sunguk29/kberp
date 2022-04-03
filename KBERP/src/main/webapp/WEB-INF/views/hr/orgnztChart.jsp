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

$blue: #2E83F2;
$black: #222222;
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.cont_left {
	display: inline-block;
    vertical-align: top;
    width: 304px;
    height: 578px;
    padding: 15px;
}

.orgnzt_btn_area {
	padding: 10px 0 8px 0;
    display: inline-block;
    vertical-align: top;
    width: 300px;
    height: 33px;
}

.orgnzt_btn {
	border: solid 1px #d7d7d7;
    display: inline-block;
    vertical-align: top;
    padding: 0px 7px;
    width: 71px;
    height: 32px;
    line-height: 30px;
    font-size: 10pt;
    font-weight: 600;
    text-align: center;
    background-color: #F2B705;
    margin: 0 2px;
    border-radius: 4px;
    color: #222222;
    cursor: pointer;
}

.orgnzt_btn:active {
	background-color: #F2CB05;
}

.orgnzt_area {
    padding: 20px 0 20px 20px;
    display: inline-block;
    vertical-align: top;
    width: 277px;
    height: 455px;
    border: solid 1px gray;
    border-radius: 6px;
    user-select: none;
}

.orgnzt_area > div{
    cursor: pointer;
}

.orgnzt_depth1 {
	display: inline-block;
    vertical-align: top;
    width: 260px;
    height: 28px;
}


.orgnzt_depth1_area {
    display: inline-block;
    vertical-align: top;
    width: 235px;
   height: 25px;
}

.kb_icon {
	display: inline-block;
    vertical-align: top;
    width: 30px;
    height: 30px;
    background-image: url(resources/images/hr/logo20_icon.png);
    background-repeat: no-repeat;
    background-position: 7px 6px;
    background-size: 16px; 
}

.depth_slc_icon {
	display: inline-block;
    vertical-align: top;
    width: 30px;
    height: 30px;
    background-image: url(resources/images/hr/right_icon.png);
    background-repeat: no-repeat;
    background-position: center;
    background-size: 13px; 
}
.depth_emp_icon {
	display: inline-block;
    vertical-align: top;
    width: 30px;
    height: 30px;
}

.depth_slc_icon_on {
	display: inline-block;
    vertical-align: top;
    width: 30px;
    height: 26px;
    background-image: url(resources/images/hr/down_icon.png);
    background-repeat: no-repeat;
    background-position: center;
    background-size: 13px; 
}

.depth_txt {
	padding-left: 5px;
    display: inline-block;
    vertical-align: top;
    width: 80px;
    height: 25px;
    font-size: 10pt;
    line-height: 29px;
}

.depth_txt_on {
	padding-left: 5px;
    display: inline-block;
    vertical-align: top;
    width: 80px;
    height: 25px;
    color: #2E83F2;
    font-size: 10pt;
    font-weight: 600;
    line-height: 29px;
}

.orgnzt_depth2_wrap{
	display: none;
}


.orgnzt_depth2 {
	padding-left: 15px;
    display: inline-block;
    vertical-align: top;
    width: 235px;
   /* height: 25px;*/
}

.orgnzt_depth2_area {
    display: inline-block;
    vertical-align: top;
    width: 235px;
   height: 25px;
}
.orgnzt_depth3_area {
    display: inline-block;
    vertical-align: top;
    width: 235px;
   height: 25px;
}
.orgnzt_depth4_area {
    display: inline-block;
    vertical-align: top;
    width: 235px;
   height: 25px;
}


.folder_icon {
	display: inline-block;
    vertical-align: top;
    width: 25px;
    height: 25px;
    background-image:url(resources/images/hr/folder_icon.png);
    background-repeat: no-repeat;
    background-position:center;
    background-size: 11px;
}


.orgnzt_depth3_wrap{
	display: none;
}

.orgnzt_depth3 {
	padding-left: 15px;
    display: inline-block;
    vertical-align: top;
    width: 205px;
   /* height: 25px;*/
}

.profile_icon {
	display: inline-block;
    vertical-align: top;
    width: 25px;
    height: 25px;
    background-image: url(resources/images/hr/profile15_icon.png);
    background-repeat: no-repeat;
    background-position: center;
    background-size: 13px;
}

.orgnzt_depth4_wrap{
	display: none;
}
.orgnzt_depth4 {
	padding-left: 15px;
    display: inline-block;
    vertical-align: top;
    width: 205px;
}
.scroll_area{
	overflow-y: scroll; 
}


.super_orgnzt_area {
	line-height: 55px;
    text-align: center;
} 

.super_orgnzt_text {
	display: inline-block;
	width: 60px;
}

.super_orgnzt_area > select {
	display: inline-block;
    width: 161px;
    height: 26px;
    text-align: center;
    margin-left: 10px;
}


.add_orgnzt_area {
	line-height: 35px;
    text-align: center;
}

.add_orgnzt_text {
	display: inline-block;
   	width: 60px;
}

.popup_cont input[type="text"] {
	display: inline-block;
    width: 153px;
    height: 20px;
    text-align: center;
    margin-left: 10px;
}

.orgnzt_del_popup{
	display: inline-block;
	height: 100%;
	width: 100%;
	text-align: center;
	line-height: 100px;
}

.del_dept{
	display: inline-block;
	/*text-align: center;*/
	font-size: 14px;
	font-weight: bold;
}

.del_txt{
	display: inline-block;
	/*text-align: center;*/
}



</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 조직도 생성
	reloadTree();
    
	// 슬림스크롤
	$(".scroll_area").slimScroll({height: "460px"},{width: "275px"});
	
	// 조직추가
	$("#orgnzt_add_btn").on("click", function() {
		var html = "";
		html += "	<div class=\"super_orgnzt_area\">                           ";
		html += "		<div class=\"super_orgnzt_text\">상위부서</div>         ";
		console.log("sdeptNum : " + $(sdeptNum).val())
		// sdeptNum : 마지막 선택 부서 == 상위조직 부서 
		// 미선택 시 카카오뱅크를 상위조직으로 함
		if($(sdeptNum).val() == null || $(sdeptNum).val() == ''){
			$("#deptLevel").val($("#default").attr("deptLevel"));
			html += "		<input type=\"text\" readonly=\"readonly\" value=\"카카오뱅크\" />";
		} else {
			html += "		<input type=\"text\" readonly=\"readonly\" value = \"" + $(dname).val() + "\" />";
		}
		html += "   </div>                                                      ";
		html += "	<div class=\"add_orgnzt_area\">                             ";
		html += "		<div class=\"add_orgnzt_text\">부서명</div>             ";
		html += "		<input type=\"text\" id=\"deptInput\" />";
		html += "	</div>                                                      ";
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "등록",
			contents : html, 
			draggable : true,
			buttons : [{
				name : "확인",
				func:function() {
						if (checkEmpty("#deptInput")) {
							alert("부서명을 입력하세요.");
							$("#deptInput").focus();
						} else {
							$("#deptName").val($("#deptInput").val());
							var params = $("#actionForm").serialize();
							$.ajax({
							       type : "post",
							       url : "orgnztChartActionAjax/insert",
							       data : params,
							       dataType : "json",
							       success : function(res) {
									   closePopup();
									   makeAlert("알림", "부서가 추가되었습니다");
									   /* window.opener.location.reload();
									   window.close(); 알럿창 닫고 새로고침 어떻게 하는지? */
							       }, 
							       error : function(req) {
							          console.log(req.responseText);
							       }
							    });
							console.log("등록!");
						}
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	// 조직수정
	$("#orgnzt_mdfy_btn").on("click", function() {
		if($(sdeptNum).val() == null || $(sdeptNum).val() == ''){
			 makeAlert("알림", "수정할 부서를 선택하세요."); 
		} else {
			$.ajax({
			       type : "post",
			       url : "orgnztChartAjax",
			       dataType : "json",
			       success : function(res) {
						var html = "";
						
						html += "	<div class=\"super_orgnzt_area\">                           ";
						html += "		<div class=\"super_orgnzt_text\">상위부서</div>         ";
						html += "		<select id=\"superDeptSelect\">                                           ";
				/* 				    	    for(var data of res.dept ) { 
								    	    	console.log(data)
								    	    	console.log("조직수정 for문 데이터(선택부서번호) : " +  $("#sdeptNum").val())
								    	    	if($("#superDeptNum").val() == "" || $("#superDeptNum").val()  == null) {
								    	    		console.log("if문 1 : 선택부서 null check" ,true)
				    	html += "		            <option odeptNum=\"\" odeptLevel=\"\">카카오뱅크</option> ";
					    html += "		   			<option odeptNum=\"" + data.DEPT_NUM + "\"odeptLevel=\"" + (data.DEPT_LEVEL * 1 + 1 ) + "\">" + data.DEPT_NAME + "</option> ";
								    	    		console.log("if문 3 : 나머지 부서 출력" ,true)
								    	    	} else if(data.DEPT_NUM == $("#superDeptNum").val()){
								    	    		console.log("if문 2 : data.부서번호 == 선택부서 상위부서번호 " ,true)
								    	    		console.log("선택부서 상위부서번호 " + $("#superDeptNum").val())
					    html += "		   			<option odeptNum=\"" + data.DEPT_NUM + "\"odeptLevel=\"" + (data.DEPT_LEVEL * 1 + 1 ) + "\">" + data.DEPT_NAME + "</option> ";
				    	html += "		            <option odeptNum=\"\" odeptLevel=\"\">카카오뱅크</option> ";
								    	    	} else {
								    	    	}
								    	    } */
								    	    
								    	    if($("#superDeptNum").val() == "" || $("#superDeptNum").val()  == null || $("#superDeptNum").val()  == "undefined") {
								    	    	 console.log("상위부서 null임")
								    	    	 console.log($("#superDeptNum").val())
								    	    	 console.log($("#superDeptNum").val())
				    	html += "		            <option odeptNum=\"\" odeptLevel=\"\">카카오뱅크</option> ";
				    								for(var data of res.dept ) { 
				    									if(data.DEPT_NUM != $("#sdeptNum").val()) {
					    html += "		   					<option odeptNum=\"" + data.DEPT_NUM + "\"odeptLevel=\"" + (data.DEPT_LEVEL * 1 + 1 ) + "\">" + data.DEPT_NAME + "</option> ";
				    									}
			    									}
								    	     } else {
								    	    	 console.log("상위부서 null 아님")
								    	    	 for(var data of res.dept ) { 
								    	    		 if(data.DEPT_NUM == $("#superDeptNum").val()) {
					    html += "		   					<option odeptNum=\"" + data.DEPT_NUM + "\"odeptLevel=\"" + (data.DEPT_LEVEL * 1 + 1 ) + "\">" + data.DEPT_NAME + "</option> ";
								    	    		 }
								    	    	 }
								    	    	 for(var data of res.dept ) { 
								    	    		 if(data.DEPT_NUM != $("#superDeptNum").val()) {
					    html += "		   					<option odeptNum=\"" + data.DEPT_NUM + "\"odeptLevel=\"" + (data.DEPT_LEVEL * 1 + 1 ) + "\">" + data.DEPT_NAME + "</option> ";
								    	    		 }
								    	    	 }
								    	    	 
								    	     }
								   
								    	    
								    	
						html += "		</select>                                           ";
						html += "   </div>                                                      ";
						html += "	<div class=\"add_orgnzt_area\">                             ";
						html += "		<div class=\"add_orgnzt_text\">부서명</div>             ";
						html += "		<input type=\"text\" id=\"deptInput\" value=\"" +$(dname).val() + "\" />";
						html += "	</div>                                                      ";
						
						makePopup({
							bg : false,
							bgClose : false,
							title : "삭제",
							contents : html, 
							draggable : true,
							buttons : [{
								name : "확인",
								func:function() {
									if (checkEmpty("#deptInput")) {
										alert("부서명을 입력하세요.");
										$("#deptInput").focus();
									} else {
									$("#deptName").val($("#deptInput").val());
									$("#mdfySuperDeptNum").val($("#superDeptSelect option:selected").attr("odeptNum"));
									$("#mdfyDeptLevel").val($("#superDeptSelect option:selected").attr("odeptLevel"));
									console.log("부서명input : " + $("#deptName").val())
									console.log("부서레벨 : " + $("#mdfyDeptLevel").val())
									var params = $("#actionForm").serialize();
									$.ajax({
									       type : "post",
									       url : "orgnztChartActionAjax/update",
									       data : params,
									       dataType : "json",
									       success : function(res) {
											   closePopup();
											   makeAlert("알림", "부서가 수정되었습니다.");
											   /* window.opener.location.reload();
											   window.close(); 알럿창 닫기 새로고침 해야함 */
									       }, 
									       error : function(req) {
									          console.log(req.responseText);
									       }
									    });
									}
									console.log("수정!");
								}
							}, {
								name : "취소"
							}]
						});
			       },
			       error : function(req) {
			          console.log(req.responseText);
			       }
			    });
		}
		
	});
	
	// 조직삭제
	$("#orgnzt_del_btn").on("click", function() {
		if($(sdeptNum).val() == null || $(sdeptNum).val() == ''){
			 makeAlert("알림", "삭제하실 부서를 선택하세요."); 
		} else {
			var html = "";
			
			html += "<div class=\"orgnzt_del_popup\">  ";
			html += "	<div class=\"del_dept\"> [ " +$(dname).val() + " ]</div> ";
			html += "	<div class=\"del_txt\">부서를 삭제하시겠습니까?<\/div>";
			html += "</div>  ";
			
			makePopup({
				bg : false,
				bgClose : false,
				title : "삭제",
				contents : html, 
				draggable : true,
				buttons : [{
					name : "확인",
					func:function() {
						var params = $("#actionForm").serialize();
						$.ajax({
						       type : "post",
						       url : "orgnztChartActionAjax/delete",
						       data : params,
						       dataType : "json",
						       success : function(res) {
								   closePopup();
								   makeAlert("알림", "부서가 삭제되었습니다.");
								   /* window.opener.location.reload();
								   window.close(); 알럿창 닫기 새로고침 해야함 */
						       }, 
						       error : function(req) {
						          console.log(req.responseText);
						       }
						    });
						console.log("삭제!");
					}
				}, {
					name : "취소"
				}]
			});
		}
		
	});
	
	// 조직도 토글
	$(".orgnzt_area").on("click", ".orgnzt_depth1, .orgnzt_depth2, .orgnzt_depth3", function(e) {
		$("#sdeptNum").val($(this).attr("sdeptNum"));
		$("#dname").val($(this).attr("dname"));
		$("#deptLevel").val($(this).attr("deptLevel"));
		$("#superDeptNum").val($(this).attr("superDeptNum"));
		console.log(this)
		var depth = $(this).attr("class").substring(12);
		var obj = $(this);
		console.log(depth == "1");
		if(depth == "1") {
			$(".orgnzt_depth2_wrap").toggle("fast", function() { 
				if($(".orgnzt_depth2_wrap").is(":visible")) {
					$(".orgnzt_depth1").css({"color":"#2E83F2", "font-weight":"bold"});
				} else {
					$(".orgnzt_depth1").css({"color":"black", "font-weight":""});
				}
			}); 
			
		} else {
			e.stopPropagation(); // 버블링 방지
			$(this).children(".orgnzt_depth" + (depth * 1 + 1) + "_wrap").toggle("fast", function() { 
				if(obj.children(".orgnzt_depth" + (depth * 1 + 1) + "_wrap").is(":visible")) {
					if(depth == "2") {
						$(".orgnzt_area .orgnzt_depth3_area").css({"color":"black", "font-weight":""});
					} else if(depth == "3") {
						$(".orgnzt_area .orgnzt_depth2_area").css({"color":"black", "font-weight":""});
						
						obj.parent().parent().children(".orgnzt_depth2_area").css({"color":"#2E83F2", "font-weight":"bold"});
					}
					
					$(".orgnzt_area .orgnzt_depth" + depth + "_area").css({"color":"black", "font-weight":""});
					
					obj.children(".orgnzt_depth" + depth + "_area").css({"color":"#2E83F2", "font-weight":"bold"});
				} else {
					$(".orgnzt_area .orgnzt_depth" + depth + "_area").css({"color":"black", "font-weight":""});
				}
			}); 
		}
		
	});
});

//팝업 부모창 리프레시 (작동 안됨)
function parentRefresh() {
	opener.location.reload();
}

// 조직도 리로드
function reloadTree() {
    $.ajax({
       type : "post",
       url : "orgnztChartAjax",
       dataType : "json",
       success : function(res) {
    	   drawTree(res.dept);
    	   drawTree2(res.dept);
    	   drawTree3(res.emp);
       },
       error : function(req) {
          console.log(req.responseText);
       }
    });
 } 

// 1뎁스 부서 생성
function drawTree(dept){
	
	for(var data of dept) {                              
		if(data.SUPER_DEPT_NUM == null) {
			var html = "";
			html += "<div class=\"orgnzt_depth2\" deptLevel=\"" 
			+ (data.DEPT_LEVEL * 1 + 1) + "\"  sdeptNum=\"" + data.DEPT_NUM + "\" dname=\"" + data.DEPT_NAME + "\" superDeptNum=\"" + data.SUPER_DEPT_NUM +  "\"> ";
			html += "<div class=\"orgnzt_depth2_area\">      ";
			html += "	<div class=\"depth_slc_icon\"></div> ";
			html += "	<div class=\"folder_icon\"></div>    ";
			html += "	<div class=\"depth_txt\">" + data.DEPT_NAME + "</div>";
			html += "</div>                                  ";
			html += "<div class=\"orgnzt_depth3_wrap\" id=\"" + data.DEPT_NUM + "\"></div>";
			html += "</div>                                  ";
			$("#depth2").append(html);
		} 
	}
}

// 1뎁스 외 부서 생성
function drawTree2(dept) {
	for(var data of dept){
		if(data.SUPER_DEPT_NUM != null) {
			var html = "";
			html += "<div class=\"orgnzt_depth3\" deptLevel=\"" 
			+ (data.DEPT_LEVEL * 1 + 1) + "\" sdeptNum=\"" + data.DEPT_NUM + "\"  dname=\"" + data.DEPT_NAME + "\" superDeptNum=\"" + data.SUPER_DEPT_NUM +  "\" >   ";
			html += "	<div class=\"orgnzt_depth3_area \">                      ";
			html += "		<div class=\"depth_slc_icon\"></div>               ";
			html += "		<div class=\"folder_icon\"></div>                 ";
			html += "		<div class=\"depth_txt\">" + data.DEPT_NAME + "</div>";
			html += "	</div>                                                 ";
			html += "<div class=\"orgnzt_depth4_wrap\" id=\"" + data.DEPT_NUM + "\"></div>";
			html += "</div>                                                    ";
			$("#" + data.SUPER_DEPT_NUM).append(html);
		}
	} 
}

// 사원 생성
function drawTree3(emp) {
	for(var data of emp){
		var html = "";
			html += "<div class=\"orgnzt_depth3\" deptLevel=\"" 
			+ (data.DEPT_LEVEL * 1 + 1) +  "\" sdeptNum=\"" + data.DEPT_NUM + "\" dname=\"" + data.DEPT_NAME + "\" superDeptNum=\"" + data.SUPER_DEPT_NUM + "\">  ";
			html += "	<div class=\"orgnzt_depth3_area\">                     ";
			html += "		<div class=\"depth_emp_icon\"></div>               ";
			html += "		<div class=\"profile_icon\"></div>                 ";
			html += "		<div class=\"depth_txt\">" + data.EMP_NAME + "</div>";
			html += "	</div>                                                 ";
			html += "</div>                                                    ";
			$("#" + data.DEPT_NUM).append(html);
	}
}

</script>
</head>
<body>
		<input type="hidden" id="dname" /> 
	<form action="#" id="actionForm">
		<input type="hidden" id="sdeptNum" name="sdeptNum" value="${sdeptNum}" /> 
		<input type="hidden" id="deptName" name="deptName" /> 
		<input type="hidden" id="deptLevel" name="deptLevel" value="${deptLevel}" /> 
		<input type="hidden" id="mdfySuperDeptNum" name="mdfySuperDeptNum"  /> 
		<input type="hidden" id="mdfyDeptLevel" name="mdfyDeptLevel"  /> 
		<input type="hidden" id="superDeptNum" name="superDeptNum"  /> 
	</form>
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
			<div class="page_title_text">조직도</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="cont_left">
				<div class="orgnzt_btn_area">
					<input type="button" class="orgnzt_btn" id="emp_edit_btn" value="사원편집" />
					<input type="button" class="orgnzt_btn" id="orgnzt_add_btn" value="조직추가" />
					<input type="button" class="orgnzt_btn" id="orgnzt_mdfy_btn" value="조직수정" />
				    <input type="button" class="orgnzt_btn" id="orgnzt_del_btn" value="조직삭제" />
				</div>
				<div class="orgnzt_area">
					<div class="scroll_area">
						<div class="orgnzt_depth1_wrap">
							<div class="orgnzt_depth1" id="default" dname="카카오뱅크"  deptLevel="1" superDeptNum="" >
								<div class="depth_slc_icon"></div>
								<div class="kb_icon"></div>
								<div class="depth_txt">카카오뱅크</div>
							</div>
							<div class="orgnzt_depth2_wrap" id="depth2">
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>