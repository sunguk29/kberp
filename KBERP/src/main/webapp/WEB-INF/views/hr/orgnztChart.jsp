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
}

.orgnzt_area > div{
    cursor: pointer;
}

.orgnzt_depth1 {
	display: inline-block;
    vertical-align: top;
    width: 260px;
    height: 25px;
}

.depth1_icon {
	display: inline-block;
    vertical-align: top;
    width: 50px;
    height: 30px;
    background-image: url(resources/images/hr/right_icon.png), url(resources/images/hr/logo20_icon.png);
    background-repeat: no-repeat;
    background-position: 3% center, 80% center;
    background-size: 13px, 16px; 
}

.depth1_icon_on {
	display: inline-block;
    vertical-align: top;
    width: 50px;
    height: 30px;
    background-image: url(resources/images/hr/down_icon.png), url(resources/images/hr/logo20_icon.png);
    background-repeat: no-repeat;
    background-position: 3% center, 80% center;
    background-size: 13px, 16px; 
}


.depth1_txt {
	padding-left: 5px;
    display: inline-block;
    vertical-align: top;
    width: 150px;
    height: 25px;
    color: black;
    font-size: 10pt;
    line-height: 32px;
}

.depth1_txt_on {
	padding-left: 5px;
    display: inline-block;
    vertical-align: top;
    width: 150px;
    height: 25px;
    color: #2E83F2;
    font-size: 10pt;
    font-weight: 600;
    line-height: 32px;
}

.orgnzt_depth2_wrap{
	display: none;
}


.orgnzt_depth2 {
	padding-left: 25px;
    display: inline-block;
    vertical-align: top;
    width: 235px;
    height: 25px;;
}


.depth2_icon {
	display: inline-block;
    vertical-align: top;
    width: 50px;
    height: 30px;
    background-image: url(resources/images/hr/right_icon.png), url(resources/images/hr/folder_icon.png);
    background-repeat: no-repeat;
    background-position: 3% center, 80% center;
    background-size: 13px, 11px;
}


.depth2_txt {
    padding-left: 1px;
    display: inline-block;
    vertical-align: top;
    width: 150px;
    height: 25px;
    color: black;
    font-size: 10pt;
    line-height: 32px;
}

.depth2_icon_on {
	display: inline-block;
    vertical-align: top;
    width: 50px;
    height: 30px;
    background-image: url(resources/images/hr/down_icon.png), url(resources/images/hr/folder_icon.png);
    background-repeat: no-repeat;
    background-position: 3% center, 80% center;
    background-size: 13px, 11px;
}


.depth2_txt_on {
	padding-left: 5px;
    display: inline-block;
    vertical-align: top;
    width: 150px;
    height: 25px;
    color: #2E83F2;
    font-size: 10pt;
    font-weight: 600;
    line-height: 32px;
}

.orgnzt_depth3_wrap{
	display: none;
}

.orgnzt_depth3 {
	padding-left: 30px;
    display: inline-block;
    vertical-align: top;
    width: 205px;
    height: 25px;
}

.depth3_icon {
	display: inline-block;
    vertical-align: top;
    width: 35px;
    height: 30px;
    background-image: url(resources/images/hr/profile15_icon.png);
    background-repeat: no-repeat;
    background-position: center;
    background-size: 13px;
}
.depth3_txt {
 	display: inline-block;
    vertical-align: top;
    width: 150px;
    height: 25px;
    color: black;
    font-size: 10pt;
    line-height: 30px;
}


</style>
<script type="text/javascript">
// 1뎁스
$(document).ready(function() {
   $(".orgnzt_depth1").on("click", function() {
	   console.log("depth1 click");
      if($(".orgnzt_depth2_wrap").is(":visible")){
    	  $(".orgnzt_depth2_wrap").css("display","none");
          $(".depth1_icon_on").removeClass('depth1_icon_on').addClass('depth1_icon');
          $(".depth1_txt_on").removeClass('depth1_txt_on').addClass('depth1_txt');
		  console.log("depth1 접음");
	   console.log(this)
      } else {
    	  $(".orgnzt_depth2_wrap").css("display","block");
          $(".depth1_icon").removeClass('depth1_icon').addClass('depth1_icon_on');
          $(".depth1_txt").removeClass('depth1_txt').addClass('depth1_txt_on');
		  console.log("depth1 펼침");
	   console.log(this)
      }
   });
// 2뎁스  
   $(".orgnzt_depth2").on("click", function() {
	   console.log("depth2 click");
      if($(this).children(".orgnzt_depth3_wrap").is(":visible")){
    	  $(this).children(".orgnzt_depth3_wrap").css("display","none");
          $(this).find(".depth2_icon_on").removeClass('depth2_icon_on').addClass('depth2_icon');
          $(this).find(".depth2_txt_on").removeClass('depth2_txt_on').addClass('depth2_txt');
		  console.log("depth2 접음");
	   console.log(this)
      } else {
    	  $(this).children(".orgnzt_depth3_wrap").css("display","block");
          $(this).find(".depth2_icon").removeClass('depth2_icon').addClass('depth2_icon_on');
          $(this).find(".depth2_txt").removeClass('depth2_txt').addClass('depth2_txt_on');
		  console.log("depth2 펼침");
	   console.log(this)
      }
   });
   
   
});

function drawDept(dept){
	var html = "";
	
	for(var data of list) {
		
	}
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
							<div class="depth1_icon"></div>
							<div class="depth1_txt">카카오뱅크</div>
						</div>
						<div class="orgnzt_depth2_wrap" >
							<div class="orgnzt_depth2">
								<div class="orgnzt_depth2_area">
									<div class="depth2_icon"></div>
									<div class="depth2_txt">전산팀</div>
								</div>
								<div class="orgnzt_depth3_wrap" >
									<div class="orgnzt_depth3">
										<div class="depth3_icon"></div>
										<div class="depth3_txt">유은지</div>
									</div>
									<div class="orgnzt_depth3">
										<div class="depth3_icon"></div>
										<div class="depth3_txt">유은지</div>
									</div>
								</div>
							</div>
							<div class="orgnzt_depth2">
								<div class="orgnzt_depth2_area">
									<div class="depth2_icon"></div>
									<div class="depth2_txt">인사팀</div>
								</div>
								<div class="orgnzt_depth3_wrap" >
									<div class="orgnzt_depth3">
										<div class="depth3_icon"></div>
										<div class="depth3_txt">유은지</div>
									</div>
									<div class="orgnzt_depth3">
										<div class="depth3_icon"></div>
										<div class="depth3_txt">유은지</div>
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