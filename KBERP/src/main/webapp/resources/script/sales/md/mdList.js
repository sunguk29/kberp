
function reloadList() {
	var params = $("#actionForm").serialize(); // name=val&name2=val2
	
	$.ajax({
		type : "post",
		url : "mdListAjax",
		dataType : "json",
		data : params,
		success : function (res) {
			console.log(res);
			drawList(res.list);												//리스트 
			drawPaging(res.pb);												//페이징
			$("#sts_listA").text("전체 : "+ res.totalCnt + " 건");			//상단-전체
			$("#sts_list0").text("판매중 : "+ res.onSaleCnt + " 건");			//상단-판매중
			$("#sts_list1").text("판매중단 : "+ res.offSaleCnt + " 건");		//상단-출시예정
			$("#sts_list2").text("출시예정 : "+ res.rlsExpctdCnt + " 건");		//상단-판매중단
			$("#totalCnt").text("전체:" + res.totalCnt + "건"); 				//검색-판매상태-전체
			$("#onSaleCnt").text("판매중:" + res.onSaleCnt + "건"); 			//검색-판매상태-판매중
			$("#rlsExpctdCnt").text("출시예정:" + res.rlsExpctdCnt + "건"); 	//검색-판매상태-출시예정
			$("#offSaleCnt").text("판매중단:" + res.offSaleCnt + "건"); 		//검색-판매상태-판매중단
			$("#SearchResult").text("상품 (검색결과:" + res.totalCnt + "건)");
		},
		error : function(request, status, error) {
			console.log(request.requestText);
		}
	});
}
/* gradeNum을 문자로 바꿔주는 함수 */
function GradeFormatter(gradeNum){
	switch(gradeNum){
	case 0 :  return 'S 등급' ;
	case 1 :  return 'A 등급' ;
	case 2 :  return "B 등급" ;
	case 3 :  return "C 등급" ;
	case 4 :  return "D 등급" ;
	case 5 :  return "E 등급" ;
	}
}


/* 리스트 그리는 함수 */
function drawList(list){
	
	var html = "";
	
	for(var data of list){
		
		html += "<tr>";
		html += "<td rowspan=\"3\" class='md_num'>" + data.MD_NUM + "</td>"; 	//글번호
		html += "<td>" + data.MD_NUM + "</td>";									//상품번호
		html += "<td>" + GradeFormatter(data.MD_GRADE_NUM) + "</td>";			//등급
		html += "<td></td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + data.INTRST_RATE + "%" + "</td>";						//이자율
		html += "<td class='md_name'>" + data.MD_NAME + "</td>";				//상품명
		html += "<td>" + data.SALES_STS_NUM + "</td>";							//판매상태
		html += "</tr>";
		html += "<tr class='thirdTr'>";
		html += "<td>" + data.LIMIT_AMNT + "원" + "</td>";						//대출한도금액
		html += "<td>" + data.SALES_START_DATE + "~" + nullCheckFunc(data.SALES_END_DATE, 'aaa') + "</td>";				//계약기간
		html += "<td></td>";
		html += "</tr>";
	}
	
	$("#appand_path").html(html); //해당 id값을 가지는 태그에 html을 뿌린다.
}


function drawPaging(pb) {
	var html = "";
	
	html += "<div class='page_btn page_first' page='1'>처음</div>";
	
	if($("#page").val() == "1" ){
		html += "<div class='page_btn page_prev' page='1'>이전</div>";
	}else{
		html += "<div class='page_btn page_prev' page='" + ($("#page").val() * 1 - 1 ) + "'>이전</div>";
	}

	for(var i = pb.startPcount ; i <= pb.endPcount ; i++ ){
		if($("#page").val() == i){
			html += "<div class='page_btn_on' page='" + i + "'><b>" + i + "</b></div>";
		}else {
			html += "<div class='page_btn' page='" + i + "'>" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div class='page_btn page_next' page ='" + pb.maxPcount + "'>다음</div>";
	}else{
		html += "<div class='page_btn page_next' page = '" + ($("#page").val() * 1 +1 ) + "'>다음</div>";
	}

	html += "<div class='page_btn page_last' page='" + pb.maxPcount + "'>마지막</div>";
	
	$("#pgn_area").html(html);
}


/* 판매상태 - 전체 체크시 나머지 체크 없애는 함수  */
function checkboxFunc1() {
	if($("#sales_stsA").is(":checked")){
		$("#sales_sts0").prop("checked", false);
		$("#sales_sts1").prop("checked", false);
		$("#sales_sts2").prop("checked", false);	
	}
}

/* 판매상태 - 나머지 체크시 전체 체크 없애는 함수 */
function checkboxFunc2(){
	if($("#sales_sts0").is(":checked") || $("#sales_sts1").is(":checked") || $("#sales_sts2").is(":checked") ) {
		$("#sales_stsA").prop("checked", false);
	}	
}

/* 검색-기간 에서 오늘,어제.. 버튼 클릭시 해당 날짜를 출력하는 함수 */
function dateChoiceFunc() {
	$("#today_btn").on("click", function() {
		getDate('today');
	}); 
	
	$("#yesterday_btn").on("click", function() {
		getDate('yesterday');
	});
	
	$("#weekAgo_btn").on("click", function() {
		getDate('weekAgo');
	});
	
	$("#monthAgo_btn").on("click", function() {
		getDate('monthAgo');
	});
	$("#threeMonthAgo_btn").on("click", function() {
		getDate('threeMonthAgo');
	});
}
	

/* 버튼 눌렀을 떄 원하는 날짜로 형식을 바꿔 출력하는 함수 */ 
function getDate(keyword) {
	var targetDate;
	var today = new Date(); 
	
	// 타겟날짜 지정
	switch(keyword) {
		case 'today'	 	 : targetDate = today; 
			break;
		case 'yesterday' 	 : targetDate = new Date(today.setDate(today.getDate()-1)); 
			break;
		case 'weekAgo' 	 	 : targetDate = new Date(today.setDate(today.getDate()-7));
			break;
		case 'monthAgo'  	 : targetDate = new Date(today.setDate(today.getMonth()-1));
			break;
		case 'threeMonthAgo' : targetDate = new Date(today.setDate(today.getMonth()-3));
			break;
	}
	
	// 포맷 yyyy-mm-dd로 변경, append
	$("#sales_start_date").val(dateFormatter(targetDate));
	$("#sales_end_date").val(dateFormatter(new Date()));
}