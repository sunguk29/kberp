/* 값이 null인 경우 '' 리턴 */
function nullCheckFunc(obj){
	if (typeof obj == "undefined" || obj == null || obj == '') {
		return '';
	}else {
		alert("else" + obj);
		return obj;
	}
}


/* 값이 null인 경우 returnObj 리턴 */
function nullCheckFuncToRtnObj(obj, returnObj){
	if (typeof obj == "undefined" || obj == null || obj == '') {
		return returnObj;
	}else {
		return obj;
	}
}

/* 필수항목이 있는지 없는지 확인하는 함수. 값이 있는 경우 true, 없는 경우 false 리턴 */
function checkEmpty(sel){
	if($.trim($(sel).val()) == "") {
		return true;
	}else{
		return false;
	}
}


/* 날짜 포맷 yyyy-mm-dd 형식으로 변환하는 함수 */
function dateFormatter(targetDate){
	
	var year = targetDate.getFullYear();
	var month = ('0' + (targetDate.getMonth() + 1)).slice(-2);
	var day = ('0' + targetDate.getDate()).slice(-2);
	var dateString = year + '-' + month + '-' + day;
	
	return dateString;
}
