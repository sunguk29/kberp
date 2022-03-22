<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */

.cont_area {
	display: inline-block;
	margin-left:100px;
	margin-top: 20px;
}

.top .cate, .top .wrt_title, .top .wrt_wrter {
	display: inline-block;
	margin-right:10px;
	height: 50px;
}

.top .cate select {
	width: 160px;
	height: 45px;
} 
.top .wrt_title {
	margin-right:210px;
	width: 220px;
	height: 40px;
}
.wrt_wrter {
	margin-left: 20px;
}
.top .wrt_title input {
	width: 400px;
	height: 40px;
}
.top .wrt_wrter input {
	width: 160px;
	height: 40px;
}

.wrt_con {
	resize: none;
}
.bottom {
	margin-top: 35px;
}

.bottom input[type="text"] {
	width: 450px;
	height: 40px;
}

.cmn_btn {
	margin-left:200px;	
}
</style>
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
			
			<!-- 해당 내용에 작업을 진행하시오. -->
				<div class="cont_area">
					<!-- 여기부터 쓰면 됨 -->
					<div class="top">
						<div class="cate">
							<select>
						 	<option>입출금/예적금</option>
							<option>대출</option>
							<option>외환</option>
							<option>카드</option>
							<option>ATM</option>
							<option>제휴서비스</option>
							<option>인증/보안</option>
							<option>알림</option>
							<option>앱이용</option>
							<option>기타</option>
							</select>
						</div>
							<div class="wrt_title">
								<input type="text" placeholder="제목(질문글)">
							</div>
							<div class="wrt_wrter">
								<input type="text" placeholder="작성자">
							</div>
					</div>
					<div class="middle">
						<textarea class="wrt_con" rows="20" cols="98" placeholder="내용(답변글)"></textarea>
					</div>
					<div class="bottom">
					<div class="cmn_btn">취소</div>
					<div class="cmn_btn">등록</div>
					</div>
				</div>
			</div>
		</div>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>