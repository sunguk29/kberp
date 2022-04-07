<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 로그인</title>
<link rel="icon" href="images/favicon/favi.gif" />
<style type="text/css">
html, body {
    height: 100%;
    min-height: 100%;
}

body {
    background-color: #ececee;
    margin: 0;
    padding: 0;
    font-size: 12px;
    font-family: '맑은 고딕';
}

.login_bg {
	width: 100%;
	height: 100%;
}

.kabang_wrap {
	max-width: 700px;
    min-height: 100%;
    margin: 0 auto;
    background: #fff;
    text-align: center;
}

.login_logo {
    padding-top: 250px;
}

.kabang_icon {
	display: inline-block;
}

.kabang_icon img {
	display: block;
	margin: 0 auto;
	width: 50px;
	height: 50px;
	
}

.kabang_black{
	display: inline-block;
}

.kabang_black img {
	display: block;
	margin: 0 auto;
	width: 160px;
	height: 50px;
	margin-left: 5px;
}

.login_area {
	max-width: 420px;
    padding-top: 40px;
    margin: 0 auto;
}

.input_id input {
	display: block;
    width: 420px;
    height: 42px;
    border: 1px solid #d6d6d6;
    border-radius: 2px;
    text-indent: 15px;
    margin-top: 10px;
    font-size: 12pt;
    outline-color: #F2CB05;
    letter-spacing: -1px;
}

.input_id input::placeholder {
	color: #BDBDBD;
}

.login_Btn {
	display: block;
    width: 425px;
    height: 50px;
    border: 1px solid #F2B705;
    border-radius: 2px;
    background-color: #F2B705;
    line-height: 55px;
    font-size: 11pt;
    font-weight: bold;
    margin-top: 15px;
    cursor: pointer;
    -ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}


.login_bottom, .login_foot {
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}

.login_bottom div, .login_foot div {
	display: inline-block;
	padding: 30px 0 35px;
	font-size: 11pt;
	color: #8c8c8c;
	margin-right: 10px;
	margin-left: 10px;
	letter-spacing: -2px;
	cursor: pointer;
    
}

.login_foot {
	padding-top: 50px;
}

.login_foot div {
	font-size: 10.5pt;
	letter-spacing: 0px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
});
</script>
</head>
<body>
	<div class="login_bg">
	<div class="kabang_wrap">
		<div class="login_logo">
			<div class="kabang_icon">
				<img alt="카뱅아이콘" src="resources/images/CS/icon_logo.png"/>
			</div>
			<div class="kabang_black">
				<img alt="카뱅로고" src="resources/images/CS/logo_black.svg"/>
			</div>
		</div>
		<div class="login_middle">
			<div class="login_area">
				<div class="input_id">
					<input type="text" id="loginId" name="id" placeholder="아이디">
					<input type="password" id="loginPw" name="pw" placeholder="비밀번호">
				</div>
				<div class="login_Btn">로그인</div>
			</div>
		</div>
		<div class="login_bottom">
			<div>아이디 찾기</div>
			<span class="txt_bar">|</span>
			<div>비밀번호 찾기</div>
			<span class="txt_bar">|</span>
			<div>회원가입</div>
		</div>
		<div class="login_foot">
			<div>GDJ43</div>
			<span class="txt_bar">|</span>
			<div>고객센터</div>
		</div>
	</div>
</div>
</body>
</html>