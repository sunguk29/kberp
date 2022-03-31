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
    padding: 20px 20px 0 20px;
    display: inline-block;
    vertical-align: top;
    width: 258px;
    height: 506px;
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


</style>
<script type="text/javascript">
$(document).ready(function() {
	reloadTree();
	$(".orgnzt_area").on("click", ".orgnzt_depth1, .orgnzt_depth2, .orgnzt_depth3", function(e) {
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
			}); // 토글 show/hide
			
		} else {
			e.stopPropagation(); // 버블업 방지
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
			}); // 토글 show/hide
			
		}
		
		
	});
});

// 조직도 리로드
function reloadTree() {
    $.ajax({
       type : "post",
       url : "orgnztChartAjax",
       dataType : "json",
       success : function(res) {
    	   drawTree(res.dept,res.emp);
    	   drawTree2(res.dept);
       },
       error : function(req) {
          console.log(req.responseText);
       }
    });
 } 

// 조직도 html 그리기
function drawTree(dept){
	var html = "";
	
	for(var data of dept) {                              
		if(data.SUPER_DEPT_NUM == null) {
			console.log("1뎁스(번호,레벨) : " + data.DEPT_NAME, data.DEPT_NUM, data.DEPT_LEVEL )
			html += "<div class=\"orgnzt_depth2\" >          ";
			html += "<div class=\"orgnzt_depth2_area\">      ";
			html += "	<div class=\"depth_slc_icon\"></div> ";
			html += "	<div class=\"folder_icon\"></div>    ";
			html += "	<div class=\"depth_txt\">" + data.DEPT_NAME + "</div>";
			html += "</div>                                  ";
			html += "<div class=\"orgnzt_depth3_wrap\" id=\"" + data.DEPT_NUM + "\"></div>";
			html += "</div>                                  ";
			$("#depth2").html(html);
/* 			for(var data2 of emp) {
				if(data.DEPT_NUM == data2.DEPT_NUM) {
					html += "<div class=\"orgnzt_depth3\">                             ";
					html += "	<div class=\"orgnzt_depth3_area\">                     ";
					html += "		<div class=\"depth_slc_icon\"></div>               ";
					html += "		<div class=\"profile_icon\"></div>                 ";
					html += "		<div class=\"depth_txt\">" + data2.EMP_NAME + "</div>";
					html += "	</div>                                                 ";
					html += "</div>                                                    ";
					$("#" + data.DEPT_NUM).html(html);
				}
			} */
		} /* else if(data.DEPT_LEVEL == 2) {
			$("#" + data.SUPER_DEPT_NUM).html(html);
			html += "<div class=\"orgnzt_depth3\">                             ";
			html += "	<div class=\"orgnzt_depth3_area\">                     ";
			html += "		<div class=\"depth_slc_icon\"></div>               ";
			html += "		<div class=\"folder_icon\"></div>                 ";
			html += "		<div class=\"depth_txt\">" + data.DEPT_NAME + "</div>";
			html += "	</div>                                                 ";
			html += "</div>                                                    ";
		} */
	}
	
/* 	for(var data of dept){
		if(data.SUPER_DEPT_NUM != null) {
			console.log("2뎁스(부서명,번호,레벨) : " + data.DEPT_NAME, data.DEPT_LEVEL, data.DEPT_LEVEL )
			html += "<div class=\"orgnzt_depth3\">                             ";
			html += "	<div class=\"orgnzt_depth3_area\">                     ";
			html += "		<div class=\"depth_slc_icon\"></div>               ";
			html += "		<div class=\"folder_icon\"></div>                 ";
			html += "		<div class=\"depth_txt\">" + data.DEPT_NAME + "</div>";
			html += "	</div>                                                 ";
			html += "</div>                                                    ";
			$("#" + data.SUPER_DEPT_NUM).html(html);
		}
	} */
	console.log("1뎁스 끝")
}

function drawTree2(dept) {
	var html = "";
	for(var data of dept){
		if(data.SUPER_DEPT_NUM != null) {
			console.log("2뎁스(번호,레벨) : " + data.DEPT_NAME, data.DEPT_NUM, data.DEPT_LEVEL )
			html += "<div class=\"orgnzt_depth3\">                             ";
			html += "	<div class=\"orgnzt_depth3_area\">                     ";
			html += "		<div class=\"depth_slc_icon\"></div>               ";
			html += "		<div class=\"folder_icon\"></div>                 ";
			html += "		<div class=\"depth_txt\">" + data.DEPT_NAME + "</div>";
			html += "	</div>                                                 ";
			html += "</div>                                                    ";
			$("#" + data.SUPER_DEPT_NUM).html(html);
		}
	} 
	console.log("2뎁스 끝")
}

</script>
</head>
<body>
	<form>
		<input type="hidden" id="deptGbn" name="deptGbn" />
		<input type="hidden" id="empGbn" name="deptGbn" />
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
					<input type="button" class="orgnzt_btn" value="사원편집" />
					<input type="button" class="orgnzt_btn" value="조직추가" />
					<input type="button" class="orgnzt_btn" value="조직수정" />
					<input type="button" class="orgnzt_btn" value="조직삭제" />
				</div>
				<div class="orgnzt_area">
					<div class="orgnzt_depth1_wrap">
						<div class="orgnzt_depth1" >
							<input type="hidden" class="item_selected" value="false" />
							<div class="depth_slc_icon"></div>
							<div class="kb_icon"></div>
							<div class="depth_txt">카카오뱅크</div>
						</div>
						<div class="orgnzt_depth2_wrap" id="depth2">
							<div class="orgnzt_depth2" >
								<div class="orgnzt_depth2_area">
								<input type="hidden" class="dept_num" value="false" />
									<div class="depth_slc_icon"></div>
									<div class="folder_icon"></div>
									<div class="depth_txt">영업부</div>
								</div>
								<div class="orgnzt_depth3_wrap" >
									<div class="orgnzt_depth3">
									<input type="hidden" class="item_selected" value="false" />
										<div class="orgnzt_depth3_area">
											<div class="depth_slc_icon"></div>
											<div class="folder_icon"></div>
											<div class="depth_txt">영업1팀</div>
										</div>
										<div class="orgnzt_depth4_wrap" >
											<div class="orgnzt_depth4" >
											<input type="hidden" class="item_selected" value="false" />
												<div class="orgnzt_depth4_area">
													<div class="depth_slc_icon"></div>
													<div class="profile_icon"></div>
													<div class="depth_txt">유은지</div>
												</div>
											</div>
											<div class="orgnzt_depth4">
											<input type="hidden" class="item_selected" value="false" />
												<div class="orgnzt_depth4_area">
													<div class="depth_slc_icon"></div>
													<div class="profile_icon"></div>
													<div class="depth_txt">유은지</div>
												</div>
											</div>
										</div>
									</div>
									<div class="orgnzt_depth3">
											<input type="hidden" class="item_selected" value="false" />
										<div class="orgnzt_depth3_area">
											<div class="depth_slc_icon"></div>
											<div class="folder_icon"></div>
											<div class="depth_txt">영업2팀</div>
										</div>
										<div class="orgnzt_depth4_wrap" >
											<div class="orgnzt_depth4" >
											<input type="hidden" class="item_selected" value="false" />
												<div class="orgnzt_depth4_area">
													<div class="depth_slc_icon"></div>
													<div class="profile_icon"></div>
													<div class="depth_txt">유은지</div>
												</div>
											</div>
											<div class="orgnzt_depth4">
											<input type="hidden" class="item_selected" value="false" />
												<div class="orgnzt_depth4_area">
													<div class="depth_slc_icon"></div>
													<div class="profile_icon"></div>
													<div class="depth_txt">유은지</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="orgnzt_depth2" >
								<input type="hidden" class="item_selected" value="false" />
								<div class="orgnzt_depth2_area">
									<div class="depth_slc_icon"></div>
									<div class="folder_icon"></div>
									<div class="depth_txt">인사팀</div>
								</div>
								<div class="orgnzt_depth3_wrap" >
									<div class="orgnzt_depth3">
									<input type="hidden" class="item_selected" value="false" />
										<div class="orgnzt_depth3_area">
											<div class="depth_slc_icon"></div>
											<div class="folder_icon"></div>
											<div class="depth_txt">인사1팀</div>
										</div>
										<div class="orgnzt_depth4_wrap" >
											<div class="orgnzt_depth4">
											<input type="hidden" class="item_selected" value="false" />
												<div class="orgnzt_depth4_area">
													<div class="depth_slc_icon"></div>
													<div class="profile_icon"></div>
													<div class="depth_txt">유은지</div>
												</div>
											</div>
											<div class="orgnzt_depth4">
											<input type="hidden" class="item_selected" value="false" />
												<div class="orgnzt_depth4_area">
													<div class="depth_slc_icon"></div>
													<div class="profile_icon"></div>
													<div class="depth_txt">유은지</div>
												</div>
											</div>
										</div>
									</div>
									<div class="orgnzt_depth3">
									<input type="hidden" class="item_selected" value="false" />
										<div class="orgnzt_depth3_area">
											<div class="depth_slc_icon"></div>
											<div class="folder_icon"></div>
											<div class="depth_txt">영업2팀</div>
										</div>
										<div class="orgnzt_depth4_wrap" >
											<div class="orgnzt_depth4" >
											<input type="hidden" class="item_selected" value="false" />
												<div class="orgnzt_depth4_area">
													<div class="depth_slc_icon"></div>
													<div class="profile_icon"></div>
													<div class="depth_txt">유은지</div>
												</div>
											</div>
											<div class="orgnzt_depth4">
											<input type="hidden" class="item_selected" value="false" />
												<div class="orgnzt_depth4_area">
													<div class="depth_slc_icon"></div>
													<div class="profile_icon"></div>
													<div class="depth_txt">유은지</div>
												</div>
											</div>
										</div>
									</div>
								</div>
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