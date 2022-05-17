<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.menu_depth1_wrap {
    display: inline-block;
    vertical-align: top;
    width: calc(100% - 850px);
    min-width: 850px;
    height: 100px;
}

.top_right_area, .clnt_info {
	display: inline-block;
	width: calc(100% - 1500px);
    min-width: 300px;
	height: 100px;
	font-size: 12pt;
	line-height: 100px;
	text-align: center;
}

.clnt_image_wrap {
	display: inline-block;
 	text-align: center;
 	line-height: 100px;
}

.clnt_image_wrap img {
	vertical-align: middle;
	width: 40px;
	height: 40px;
}

.clnt_name_wrap {
	display: inline-block;
	vertical-align: middle;
	width: 200px;
}

.clnt_name_txt {
	width: 200px;
	font-size: 14pt;
	color: #4B94F2;
	font-weight: bold;
	text-indent: 8px;
	font-family: 나눔스퀘어OTF;
	text-align: left;
	margin-left: 5px;
}

.clnt_opt_btn {
	display: inline-block;
	width: 15px;
	height: 15px;
	background-image: url('resources/images/clnt/sort_down.png');
	background-repeat: no-repeat;
	background-size: 100%;
	margin-left: 15px;
	cursor: pointer;
}
</style>
<script type="text/javascript">

</script>
<form action="#" id="locationForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
</form>
<!-- Top Bar -->
<div class="top_area">
	<div class="logo"><div class="logo_erp_text">고객센터</div></div>
	<div class="menu_depth1_wrap">
		<c:forEach var="menu" items="${topMenu}">
			<c:choose>
				<c:when test="${menu.MENU_NUM eq param.top}">
					<%-- _on 달린 것이 활성화 상태 --%>
					<div class="top_menu_on" topnum="${menu.MENU_NUM}" menunum="${menu.ADD_PRMTR}" adrs="cont">
					<%-- 
					<div class="top_menu_on" topnum="${menu.MENU_NUM}" menunum="${menu.ADD_PRMTR}" adrs="${menu.ADRS}">
					 --%>
						<div class="top_menu_text">${menu.MENU_NAME}</div>
						<div class="top_menu_bar"></div>
					</div>
				</c:when>
				<c:otherwise>
					<%-- 
					<div class="top_menu" topnum="${menu.MENU_NUM}" menunum="${menu.ADD_PRMTR}" adrs="sample">
					 --%>
					<div class="top_menu" topnum="${menu.MENU_NUM}" menunum="${menu.ADD_PRMTR}" adrs="${menu.ADRS}">
						<div class="top_menu_text">${menu.MENU_NAME}</div>
						<div class="top_menu_bar"></div>
					</div>
				</c:otherwise>
			</c:choose>			
		</c:forEach>
	</div>
	<div class="top_right_area">
		<div class="clnt_info">
			<div class="clnt_info_area">
				<div class="clnt_image_wrap">
					<img alt="고객기본이미지" src="resources/images/clnt/account.png"/>
				</div>
				<div class="clnt_name_wrap">
					<div class="clnt_name_txt">${sClntName} 님<div class="clnt_opt_btn"></div></div>
				</div>
				<div class="emp_menu_last" id="cLogoutBtn">로그아웃</div>
			</div>
		</div>
	</div>
</div>
	<!-- Contents -->
	<div class="right_area">
		<div class="right_area_wrap">
		<div class="navi_bar"></div>