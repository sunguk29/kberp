<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cardView</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
.popup_bg {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	background-color: #444444;
	opacity: 0.7;
	z-index: 50;
}

.popup {
	display: inline-block;
	width: 650px;
	height: 300px;
	box-shadow: 0px 0px 4px 0px #b7b7b7;
	position: absolute;
	top: calc(50% - 300px);
	left: calc(50% - 300px);
	z-index: 100;
	background-color: #f4f4f4;
	border-radius: 2px;
	line-height: 45px;
    font-size:10.5pt;
}

.popup_title {
	height: 40px;
	line-height: 40px;
	font-size: 11pt;
	font-weight: bold;
	text-indent: 10px;
	background-color: #f2cb05;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}

.popup_cont {
	width: calc(100% - 20px);
	height: calc(100% - 100px);
	padding: 10px;
	/* 표준 폰트 크기 */
	/* font-size: 10.5pt; */
	 background-color: #fff;
}

.popup_btn_area {
	width: 100%;
	height: 35px;
	text-align: right;
	padding-top: 5px;
	box-shadow: inset 0px 0px 2px 0px #b7b7b7;
}
/* 개인 작업 영역 */
.cmn_btn{
	margin-left:8px;
}
.int_list{
   width: 180px;
   height: 30px;
   vertical-align: top;
   margin: 15px 0 0 5px;
   padding: 3px;
   text-align: center;
}

.popup_table {
   text-align: center;
   border-collapse: collapse;
}
.popup_table td {
   border-top: 1px solid #222222;
}
.check{
	width: 189px;
   height: 40px;
   vertical-align: top;
   margin: 15px 0 0 5px;
   padding: 3px;
   text-align: center;
}

.use_issue_cont{
	text-align:left;
	margin-left: 25px;
}
.card_sep_cont{
	text-align:left;
	margin-left: 25px;
}
.card_co_cont{
	text-align:left;

	margin-left: 25px;
}
.card_code_cont,.card_name_cont,.use_name_cont{
	margin-left: 25px;
	margin-right: 25px;
}
.del_cont{
	width:485px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	reloadList();
	
	$("#listBtn").on("click",function(){
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#backForm").submit();
	});
	$("#cancelBtn").on("click", function(){
		$("#backForm").submit();
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
	
	$("#updateBtn").on("click", function() {
		if(checkEmpty("#card_code")) {
			alert("카드번호를 입력하세요.")
			$("#card_code").focus();
		} else if(checkEmpty("#card_name")) {
			alert("카드명을 입력하세요.")
			$("#card_name").focus();
		} else if(checkEmpty("#use_num")) {
			alert("카드명의를 입력하세요.")
			$("#use_num").focus();
		} else {
			$("#updateForm").submit();
			
			var updateForm = $("#updateForm");
			
			updateForm.ajaxForm({
				success : function(res) {
					// 물리파일명 보관
					if(res.fileName.length > 0) {
						$("#attFile").val(res.fileName[0]);						
					}
					
					// 글 저장
					var params = $("#updateForm").serialize();
					
					$.ajax({
						type : "post", // 전송 형태
						url : "cardMngAction/update", // 통신 주소
						dataType : "json", // 받을 데이터 형태
						data : params, // 보낼 데이터. 보낼 것이 없으면 안 씀
						success : function(res) { // 성공 시 실행 함수. 인자는 받아온 데이터
							if(res.res == "success") {
								$("#backForm").submit();
							} else {
								alert("작성 중 문제가 발생했습니다.");
							}
						},
						error : function(request, status, error) { // 문제 발생 시 실행 함수
							console.log(request.responseText); // 결과 텍스트
						}
					});
				},
				error : function(req) {
					console.log(req.responseText);
					
				}
			});
			updateForm.submit(); // ajaxForm 실행	
		}
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
	<form action="cardList" id="backForm" method="post">
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchMon" value="${param.searchMon}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">카드 관리</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
<form action="cardUpdate" id="updateForm" method="post">
<input type="hidden" name="no" value="${param.no}" />
<input type="hidden" name="page" value="${param.page}" />
<input type="hidden" name="searchMon" value="${param.searchMon}" />
<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
			<table class="board_table">
				<colgroup>
               <col width="110"/>
               <col width="220"/>
               <col width="110"/>
               <col width="220"/>
            </colgroup>
      <tbody>
      	<tr>
            <td> 관리 번호 </td>
            <td><input type = "text" id ="mng_num" name ="mng_num" class ="mng_num" readonly value="${data.MNG_NUM}"></td>   
            <td> </td>
            <td></td>
        </tr>
      	<tr>
            <td> 카드 번호 </td>
               <td><input type = "text" id ="card_code" name ="card_code" class ="card_code_cont" value="${data.CARD_NUM}">
               </td>   
            <td> 카드구분 </td>
			<td class="card_sep_cont"><select class="card_sep_cont" id ="card_sep" name ="card_sep">
			<option>${data.CARD_DVSN}</option>
			<option value="0">신용</option>
			<option value="1">체크</option>
             </select></td>
        </tr>
         <tr>
            <td> 카드명 </td>
               <td><input type ="text" class = "card_name_cont" id ="card_name" name ="card_name" value="${data.CARD_NAME}"></td>
            <td> 카드사 </td>
            <td class="card_sep_cont">
            	<select id ="card_co" name ="card_co" class="card_co_cont">
				<option >${data.CARD_CMPNY_NAME}</option>
				<option value="1">농협</option>
				<option value="2">기업</option>
				<option value="3">신한</option>
				<option value="4">현대</option>
				<option value="5">카카오뱅크</option>
				</select></td>
         </tr>
         <tr>
            <td> 카드명의 </td>
               <td><input type = "text" class ="use_name_cont"  id ="use_num" name ="use_num" value="${data.MNG_EMP_NM}"></td>
            <td> 사용자 </td>
               <td><input type = "text" class ="use_name_cont"  id ="card_user" name ="card_user" value="${data.USE_EMP_NM}"></td>

         </tr>
         <tr>
            <td> 발급일자 </td>
            <td class = "use_date_cont"><input type ="date" class ="use_date_cont" id ="issue_dt" name ="issue_dt" value="${data.ISSUE_DT}">
            </td>
            <td> 종료일자 </td>
            <td class = "use_date_cont"><input type ="date" class ="use_date_cont" id ="end_dt" name ="end_dt" value="${data.END_DT}">
            </td>
         </tr>
         <tr>
            <td> 사용시작일자 </td>
            <td class = "use_start_cont"><input type ="date" class ="use_start_cont" id ="use_start_dt" name ="use_start_dt" value="${data.ISSUE_DT}">
            </td>
            <td> 사용종료일자 </td>
            <td class = "use_end_cont"><input type ="date" class ="use_end_cont" id ="use_end_dt" name ="use_end_dt" value="${data.END_DT}">
            </td>
         </tr>
 		<tr>
            <td> 폐기일자 </td>
               <td colspan=3><input type = "date" id ="del_dt" name ="del_dt" class ="del_dt" value="${data.DSCRD_DT}"></td>

         </tr>
         </tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area">
				</div>
				<div class="cmn_btn" id="updateBtn">수정</div>
				<div class="cmn_btn" id="delBtn">폐기</div>
				<div class="cmn_btn" id="cancelBtn">취소</div>
			</div>
		</form>
		</div>
	</div>

	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>