/* 값이 null인 경우 '' 리턴 */
function nullCheckFunc(obj){
	if (typeof obj == "undefined" || obj == null || obj == '') {
		return '';
	}else {
		alert("else" + obj);
		return obj;
	}
}


/* 값이 null인 경우 returnObj리턴 */
function nullCheckFuncToRtnObj(obj, returnObj){
	if (typeof obj == "undefined" || obj == null || obj == '') {
		return returnObj;
	}else {
		return obj;
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
