<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 고객센터 > 이벤트 > 진행중 이벤트 글 상세보기</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/CS/content.css" />
<link rel="stylesheet" type="text/css" href="resources/css/CS/event.css" />
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1000px;
}

/* 개인 작업 영역 */

#wrap {

	width: 1000px;
	height: 720px;
	
	font-size: 20px;
	
	margin-top: 20px;
	margin-left: 80px;
	
}

#header{

	width: 1000px;
	height: 50px;
	border: 1px solid gray;	
	
	font-size: 20px;
	font-weight: bold;
	
	text-indent: 20px;

	padding-top: 20px;

}

#header2{

	width: 1000px;
	height: 50px;
	border: 1px solid gray;

	text-indent: 20px;

	padding-top: 20px;
}

#header2_writer{

	font-size: 20px;
	font-weight: bold;

}

#header2_date {

	font-size: 15px;
}

.contents{

	width: 1000px;
	height: 500px;
	border: 1px solid gray;
	
	font-size: 20px;
	
	text-indent: 20px;
		
}

#img_rac{

	width: 400px;
	height: 300px;
	
	margin-top: 20px;

}

#footer{

	width: 1000px;
	height: 600px;
	
}

#btn_list {

	width: 50px;
	height: 35px;

	padding: 5px;
	padding-bottom: -5px;
	vertical-align: top;
	
	margin-top: 20px;
	
	border-style: 1px solid #F2CB05;
	background-color: #F2CB05;
	font-size: 15px;
	font-weight:bold;

}

#btn_correct {

	width: 50px;
	height: 35px;
	font-size: 15px;
	font-weight:bold;
	padding: 5px;
	padding-bottom: -5px;
	vertical-align: top;
	
	margin-top: -35px;
	margin-left: 890px;
	
	border-style: 1px solid #F2CB05;
	background-color: #F2CB05;
	
	
}

#btn_cancle {

	width: 50px;
	height: 35px;
	font-size: 15px;
	font-weight:bold;
	padding: 5px;
	padding-bottom: -5px;
	vertical-align: top;
	
	border-style: 1px solid #F2CB05;
	background-color: #F2CB05;

	margin-top: -61px;
	margin-left: 950px;

}

#wrap_comment {

	width: 1000px;
	height: 500px;
					
	font-size: 20px;
	
	margin-top: 10px;
	margin-left: 80px;

}

#comment_header {
	
	font-size: 20px;
	font-weight: bold;
	
	text-indent: 20px;
	
	width: 1000px;
	height: 50px;
		
}

#comment_header2 {

	font-size: 20px;
	font-weight: bold;
	
	width: 1000px;
	height: 50px;

}

#more_Btn {

	display: inline-block;
	border-style: 1px solid #F2CB05;
	background-color: #F2CB05;

	width: 1000px;
	height: 50px;

	font-size: 15px;
	font-weight: bold;
	text-align: center;
	color: black;
}

#comment_content {
	
	width: 1000px;
	height: 150px;
	
	border: 1px solid gray;

	margin-top: 20px;
}

#commnet_writer {

	display: inline-block;
	width: 1000px;
	height: 50px;
	
	font-size: 15px;
	font-weight: bold;
	
	text-indent: 20px;
	
	padding-top: 15px;

}

#com_writer_date {

	font-size: 12px;

}

#com_correct {

	width: 50px;
	height: 35px;
	font-size: 15px;
	font-weight:bold;
	padding: 5px;
	padding-bottom: -5px;
	vertical-align: top;
	
	border-style: 1px solid #F2CB05;
	background-color: #F2CB05;
	
	margin-top: -10px;
	margin-left: 860px;
	
}

#com_cancle {

	width: 50px;
	height: 35px;
	font-size: 15px;
	font-weight:bold;
	padding: 5px;
	padding-bottom: -5px;
	vertical-align: top;
	
	border-style: 1px solid #F2CB05;
	background-color: #F2CB05;
	
	margin-top: -20px;
	margin-left: 920px;
		
}

#comment_cont {
	
	font-size: 15px;
	text-indent: 20px;
}

#comment_write {

	width: 1000px;
	height: 200px;
	
	border: 1px solid #F2CB05;

	margin-top: 20px;
}

#co_writer{

	width: 1000px;
	height: 50px;
	
	font-weight:bold;
	font-size: 20px;
	text-indent: 20px;
	
	border: 1px solid #F2CB05;
	
	padding-top: 15px;
	
}

#co_content {
	
	width: 1000px;
	height: 100px;

}

#co_cont {

	width: 995px;
	height: 100px;
	
	border: 1px solid #F2CB05;

}

#btn_cowrite {

	display: inline-block;
	border-style: 1px solid #F2CB05;
	background-color: #F2CB05;

	width: 1000px;
	height: 50px;
	
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	color: black;

}


</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 300,
			title : "버튼하나팝업",
			contents : "내용임",
			buttons : {
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
	});
	$("#btn2Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "버튼두개팝업",
			contents : "내용임",
			buttons : [{
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "둘닫기"
			}]
		});
	});
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
			<div class="page_title_text">진행중 이벤트</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="title-area">
				<div class="title">${data.EVENT_TITLE}</div>
				<div class="writer_area">
					<div class="write_info">
						<div class="writer">${data.EMP_NUM}</div>
						<div class="date">${data.WRITE_DATE}</div>
					</div>
				</div>
			</div>
			<div class="contents">
			${data.EVENT_CONT}
			</div>
			<div class="content_footer">
				<div class="list"><input type="submit" value="목록" class="btn"></div>
				<div class="correct"><input type="submit" value="수정" class="btn"></div>
				<div class="delete"><input type="submit" value="삭제" class="btn"></div>
			</div>
			<div class="wrap_comment">
				<div id="comment_header">
					댓글 20개
				</div>
					
				<div id="comment_header2">
					<div><input type="button" id="more_Btn" value="댓글 더 보기" ></div>
				</div>
				
				<div id="comment_content">
					<div id="commnet_writer">
					랫서판다 <span id="com_writer_date">2022-01-01 17:10</span>
					<!-- <div><input type="submit" value="수정" id="com_correct"></div> -->
					<div><input type="submit" value="삭제" id="com_cancle"></div>
					</div>
					<div id="comment_cont">
					<div>너굴맨 오류가 생겨요</div>
					</div>
				</div>
				
				<div id="comment_write">
					<div id="co_writer">
					관리자
					</div>
					<div id="co_content"><textarea id="co_cont"></textarea></div>
					<div><input type="submit" value="댓글 쓰기" id="btn_cowrite"></div>		
				</div>
			</div>
		</div><!-- cont_area end -->
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>