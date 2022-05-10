<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

</script>
<form action="#" id="locationForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
</form>
<!-- Top Bar -->
<div class="top_area">
	<div class="logo"></div>
	<div class="menu_depth1_wrap">
		<c:forEach var="menu" items="${topMenu}">
			<c:choose>
				<c:when test="${menu.MENU_NUM eq param.top}">
					<%-- _on 달린 것이 활성화 상태 --%>
					<div class="top_menu_on" topnum="${menu.MENU_NUM}" menunum="${menu.ADD_PRMTR}" adrs="sample">
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
</div>
	<!-- Contents -->
	<div class="main_area">
		<div class="main_area_wrap">
		<div class="navi_bar"></div>