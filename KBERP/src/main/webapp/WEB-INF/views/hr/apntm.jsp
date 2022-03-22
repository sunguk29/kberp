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
   width: 1100px;
}

.apntm_add_btn_area {
    height: 30px;
    margin-bottom: 15px;
}

.apntm_add_btn_area {
   text-align: right;
}

.apntm_add_btn {
    background-color: #4B94F2;
    color: #fff;
    display: inline-block;
    vertical-align: bottom;
    width: 93px;
    height: 37px;
    border: 1px solid #00000022;
    border-radius: 4px;
    font-size: 11pt;
    font-weight: 600;
    text-align: center;
    line-height: 26px;
    user-select: none;
    cursor: pointer;
}

.apntm_add_btn:active {
   background-color: #74abf5;
}

.srch_wrap {
   height: 80px;
   border: solid 1px #b7b7b7;
    padding: 10px;
    border-radius: 4px;
    margin-bottom: 20px;
    user-select: none;
}

.srch_top_area {
    display: inline-block;
    vertical-align: top;
    text-align: left;
    width: 100%;
    height: 30px;
    line-height: 30px;
}

.srch_select {
   border: solid 1px #b7b7b7;
    border-radius: 3px;
    min-width: 100px;
    height: 30px;
}

.srch_input {
   display: inline-block;
    vertical-align: top;
    width: calc(100% - 174px);
    height: 28px;
    margin-left: 10px;
    margin-right: 10px;
    text-align: left;
    border: 1px solid #d7d7d7;
    line-height: 28px;
   
}

.srch_input input {
    width: 99%;
    height: 28px;
  	padding: 0px 0px 0px 10px;
    vertical-align: middle;
    border: none;
}

.srch_bottom_area {
   height: 60px;
    margin-top: 18px;   
}
.aprvl_radio_wrap {
   display: inline-block;
   vertical-align:top;
   width: 375px;
   height: 30px;
}

.aprvl_radio_area{
	display: inline-block;
	font-size: 13px;
	font-weight: 500;
}
.aprvl_radio_title {
   display: inline-block;
   vertical-align:top;
   color: #222222;
    font-size: 10.5pt;
    font-weight: 600;
    margin-bottom: 0px;
	margin: 0px 15px 0px 10px;
}

.aprvl_radio_area input {
    margin: 3px 7px 0px 10px;
}


.srch_prd_wrap{
   display: inline-block;
   vertical-align:top;
   width: 700px;
   height: 30px;
}

.prd_radio_title {
    margin-right: 15px;
   display: inline-block;
   color: #222222;
    font-size: 10.5pt;
    font-weight: 600;
    margin-bottom: 5px;
}

.prd_radio_area{
	display: inline-block;
	font-size: 13px;
	font-weight: 500;
}

.prd_radio_form > * {
    width: 19px;
   color: #222222;
   font-size:10pt;
   font-weight: 500;
   margin-right: 5px;
}

.prd_wrap{
    display: inline-block;
    vertical-align: top;
    width: 402px;
    height: 30px;
    margin-left: 21px;
}

.prd_wrap > input {
   width: 120px;
}

.prd_radio_area input {
    margin: 4px 8px 0px 10px;
}

.prd_text_wrap {
    display: inline-block;
    vertical-align: top;
    height: 30px;
    width: 127px;
}

.prd_text {
   border: solid 1px #b7b7b7;
    border-radius: 3px;
   display: inline-block;
    vertical-align: top;
    height: 18px;
    width: 115px;
    font-size: 9pt;
    text-align: center;
}

.prd_btn {
    display: inline-block;
    vertical-align: top;
    height: 24px;
    width: 24px;
    margin-left: 7px;
    background-image: url("../images/cmn/calendar_icon.png");
    background-size: 100%;
    cursor: pointer;
}

.prd_clsftn {
    display: inline-block;
    vertical-align: top;
    height: 30px;
    width: 35px;
    font-size: 10pt;
    text-align: center;
    margin-right: 7px;
}
/*             왼쪽         */

.apntm_cont_left_area{
    display: inline-block;
    vertical-align: top;
    height: 480px;
    width: 520px;
   
}  
.apntm_list_area {
    display: inline-block;
    vertical-align: top;
    height: 450px;
    width: 520px;
    border: solid 1px #d7d7d7;
    overflow-y: scroll; 
}  

.apntm_list_title {
    display: inline-block;
    vertical-align: top;
      color: #7b7b7b;
   font-size: 11pt;
    height: 30px;
    width: 522px;
    font-weight: 600;
    border-bottom: solid 1px #222222;
}

.apntm_list {
   display: inline-table;
   border-collapse: collapse;
   width: 100%;
   margin-bottom: 15px;
}

.apntm_list thead tr {
   background-color: #f1f1f1;
   border-bottom: 1px solid #d7d7d7;
   height: 40px;
   font-size: 10pt;
   position: sticky;
   top: 0;
}

.apntm_list tbody tr {
   border-bottom: 1px solid #d7d7d7;
   height: 40px;
   text-align: center;
   color: #7b7b7b;
   font-size: 9.5pt;
}


.apntm_list tbody tr:hover {
   background-color: rgb(200,218,248);
}

/* ================ 오른쪽 ========== */
.apntm_cont_right_area{
    display: inline-block;
    vertical-align: top;
    height: 480px;
    width: 520px;
    margin-left: 45px;
}

.apntm_add_title_area{
   height: 35px;
   width: 530px;
}

.apnmt_add_top_area {
    height: 200px;
}

.apntm_add_title{
    display: inline-block;
   vertical-align: top;
    color: #4B94F2;
    font-size: 11pt;
    height: 30px;
    width: 455px;
    font-weight: 600;
}

.apntm_add_btn_area_2 {
    display: inline-block;
   vertical-align: top;
   text-align: right;
   width: 130px;
}

.apntm_add_btn_2 {
    background-color: #dadce1;
    color: #000;
    display: inline-block;
    vertical-align: bottom;
    width: 75px;
    height: 28px;
    border: 1px solid #dadce1;
    border-radius: 4px;
    font-size: 9pt;
    font-weight: 600;
    text-align: center;
    line-height: 26px;
    user-select: none;
    cursor: pointer;
}

.apntm_add_btn_2:active {
    background-color: #EEEEEE;
}

.apnmt_add_area{
   display: inline-block;
    vertical-align: top;
    height: 440px;
    width: 520px;
    border: solid 1px #b7b7b7;
    padding: 5px;
    border-radius: 5px;
}

.apnmt_add_top_area {
    height: 165px;
    width: 530px;
}

.apnmt_prfl_img {
    display: inline-block;
   vertical-align: top;
   margin: 11px;
    height: 135px;
    width: 115px;
    border: solid 1px #d7d7d7;
    background-image: url("../images/cmn/profile_icon.png");
    background-size: 100%;
    background-repeat: none;
    background-position: center;
}

.apnmt_prfl_info_wrap {
    display: inline-block;
    vertical-align: top;
    width: 359px;
    height: 135px;
    margin: 12px;
}

.apnmt_prfl_info {
    display: inline-block;
    vertical-align: top;
    width: 359px;
    height: 30px;
    margin: 2px 0;
    font-size: 9pt;
    font-weight: 600;
    color: #595959;
}

.prfl_info_input {
   border: solid 1px #b7b7b7;
    border-radius: 3px;
   width: 98px;
    height: 17px;
    margin-left: 20px;
}

.prfl_srch_btn {
   display: inline-block;
    vertical-align: top;
    height: 24px;
    width: 24px;
    margin-left: 7px;
    cursor: pointer;
}

.prfl_info_text {
   display: inline-block;
    vertical-align: top;
    width: 67px;
    height: 17px;
    line-height: 24px;
    margin-left: 23px;
}

.apnmt_add_mid_area {
   height: 158px;
    width: 530px;
}

.apnmt_info_wrap {
    width: 530px;
    height: 30px;
    margin: 2px 0;
    font-size: 9pt;
    font-weight: 600;
    color: #4B94F2;
    margin: 18px;
}

.apnmt_info {
    display: inline-block;
    vertical-align: top;
    width: 250px;
    height: 30px;
}

.apnmt_info_text {
   display: inline-block;
   vertical-align: top;
   width: 70px;
   height: 30px;
}

.apnmt_info_text_end {
   display: inline-block;
   vertical-align: top;
   width: 70px;
   height: 30px;
   color: black;
   font-weight:500;
}

.apnmt_select {
   display: inline-block;
   vertical-align: top;
    width: 123px;
    height: 23px;
    border: solid 1px #b7b7b7;
    border-radius: 3px;
}

.apnmt_add_bottom_area {
    height: 110px;
    width: 530px;
}

.apnmt_add_cont_wrap {
   font-size: 9pt;
    font-weight: 600;
    color: #595959;
    height: 94px;
    width: 505px;
    border: solid 1px #d7d7d7;
    border-radius: 10px;
    text-align: center;
    margin-left: 6px;
}

.apnmt_add_cont_title {
    height: 30px;
    font-size: 9pt;
    font-weight: 600;
    color: #595959;
}

.apnmt_add_cont_input {
    height: 55px;
    width: 490px;
    border: solid 1px #ffffff;
}

#apntm_cont {
   display: inline-block;
    vertical-align: top;
    height: 480px;
    width: 520px;
}

/* 개인 작업 영역 */

</style>
<script type="text/javascript">
$(document).ready(function() {
   // 조회 필터 기본 세팅
   if ("${param.searchGbn}" != "") {
      $("#searchGbn").val("${param.searchGbn}");
   } else {
      $("#oldSearchGbn").val("0");
   }
   
   // 인사발령 메인화면
   reloadList();

   
   // 발령 상세보기 
   $("tbody").on("click", "tr", function() {
      $("#no").val($(this).attr("no"));

      reloadCont();
   });
   
   // 발령 조회
   $("#searchBtn").on("click", function() {
      $("#oldSearchGbn").val($("#searchGbn").val());
      $("#oldSearchTxt").val($("#searchTxt").val());      

      reloadList();
   });
   
   // 발령 추가
   $("#apntm_add_btn").on("click", function() {
      $("#oldSearchGbn").val($("#searchGbn").val());
      $("#oldSearchTxt").val($("#searchTxt").val());      

      drawNewApntm();
   });

// 발령 리스트 리로드
function reloadList() {
   var params = $("#actionForm").serialize();
   
   $.ajax({
      type : "post",
      url : "apntmListAjax",
      data : params,
      dataType : "json",
      success : function(res) {
         drawList(res.list);
      },
      error : function(req) {
         console.log(req.responseText);
      }
   });
   
}

// 발령 상세정보 리로드
function reloadCont() {
   var params = $("#actionForm").serialize();
   
   $.ajax({
      type : "post",
      url : "apntmListAjax",
      data : params,
      dataType : "json",
      success : function(res) {
         drawCont(res.cont);
      },
      error : function(req) {
         console.log(req.responseText);
      }
   });
   
}


// 발령 리스트 생성
function drawList(list) {
   var html = "";
   
   for(var data of list) {                                 
      html += "<tr no=\"" + data.APNTM_NUM + "\">"        ;
      html += "<td>" + data.APNTM_NUM + "</td>"           ;
      html += "<td>" + data.APNTM_DVSN_NUM + "</td>"      ;
      html += "<td>" + data.EMP_NAME + "</td>"            ;
      html += "<td>" + data.DEPT_NAME + "</td>"           ;
      html += "<td>" + data.RANK_NAME + "</td>"           ;
      html += "<td>" + data.START_DATE + "</td>"          ;
      html += "<td>" + data.APRVL_STS + "</td>"           ;
      html += "</tr>"                                     ;
   }
   $("tbody").html(html);
}   

//발령 상세정보 생성
function drawCont(cont){
   var html = "";
   
   html += "<div class=\"apntm_cont_right_area\">                                                     ";
   html += "   <div class=\"apntm_add_title_area\">                                                   ";
   html += "      <div class=\"apntm_add_title\">발령내용</div>                                      ";
   html += "   </div>                                                                                 ";
   html += "   <div class=\"apnmt_add_area\">                                                         ";
   html += "      <div class=\"apnmt_add_top_area\">                                                 ";
   html += "         <div class=\"apnmt_prfl_img\"></div>                                           ";
   html += "         <div class=\"apnmt_prfl_info_wrap\">                                           ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_emp_num\">                                      ";
   html += "                  <div class=\"prfl_info_text\">사원번호</div>                       ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" value=\"" + cont.APNTM_NUM + "\" />  ";
   html += "                  <div class=\"prfl_srch_btn\"></div>                                ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_emp_name\">                                     ";
   html += "                  <div class=\"prfl_info_text\">사원명</div>                         ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" value=\"" + cont.EMP_NAME + "\" /> ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_dept\">                                         ";
   html += "                  <div class=\"prfl_info_text\">부서명</div>                         ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" value=\"" + cont.DEPT_NAME + "\" /> ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_team\">                                         ";
   html += "                  <div class=\"prfl_info_text\">팀명</div>                           ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" value=\"" + cont.DEPT_NAME + "\" />";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "      <div class=\"apnmt_add_mid_area\">                                                 ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령구분*</div>                         ";
   html += "               <select class=\"apnmt_select\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령부서*</div>                         ";
   html += "               <select class=\"apnmt_select\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령팀*</div>                           ";
   html += "               <select class=\"apnmt_select\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령직급*</div>                         ";
   html += "               <select class=\"apnmt_select\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령시작*</div>                         ";
   html += "               <div class=\"prd_text_wrap\">                                          ";
   html += "                  <input type=\"date\" class=\"prd_text\" id=\"prd_start\"/>         ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text_end\">발령종료</div>                      ";
   html += "               <div class=\"prd_text_wrap\">                                          ";
   html += "                  <input type=\"date\" class=\"prd_text\" id=\"prd_end\"/>           ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "      <div class=\"apnmt_add_bottom_area\">                                              ";
   html += "         <div class=\"apnmt_add_cont_wrap\">                                            ";
   html += "            <div class=\"apnmt_add_cont_title\"> - 세부내용 - </div>                   ";
   html += "            <input type=\"text\" class=\"apnmt_add_cont_input\" />                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "   </div>                                                                                 ";
   html += "</div>                                                                                    ";
   $("#apntm_cont").html(html);
                                                                                                    
}

//발령 등록 생성
function drawNewApntm(){
   var html = "";
   
   html += "<div class=\"apntm_cont_right_area\">                                                     ";
   html += "   <div class=\"apntm_add_title_area\">                                                   ";
   html += "      <div class=\"apntm_add_title\">신규발령</div>                                      ";
   html += "      <input type=\"button\" class=\"apntm_add_btn_2\" value=\"등록\" />                                      ";
   html += "   </div>                                                                                 ";
   html += "   <div class=\"apnmt_add_area\">                                                         ";
   html += "      <div class=\"apnmt_add_top_area\">                                                 ";
   html += "         <div class=\"apnmt_prfl_img\"></div>                                           ";
   html += "         <div class=\"apnmt_prfl_info_wrap\">                                           ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_emp_num\">                                      ";
   html += "                  <div class=\"prfl_info_text\">사원번호</div>                       ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" value=\"\" />  ";
   html += "                  <div class=\"prfl_srch_btn\"></div>                                ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_emp_name\">                                     ";
   html += "                  <div class=\"prfl_info_text\">사원명</div>                         ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" value=\"\" /> ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_dept\">                                         ";
   html += "                  <div class=\"prfl_info_text\">부서명</div>                         ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" value=\"\" /> ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_prfl_info\">                                            ";
   html += "               <div class=\"prfl_info_team\">                                         ";
   html += "                  <div class=\"prfl_info_text\">팀명</div>                           ";
   html += "                  <input type=\"text\" class=\"prfl_info_input\" value=\"\" />";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "      <div class=\"apnmt_add_mid_area\">                                                 ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령구분*</div>                         ";
   html += "               <select class=\"apnmt_select\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령부서*</div>                         ";
   html += "               <select class=\"apnmt_select\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령팀*</div>                           ";
   html += "               <select class=\"apnmt_select\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령직급*</div>                         ";
   html += "               <select class=\"apnmt_select\">                                        ";
   html += "                  <option selected>선택</option>                                     ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "                  <option>test</option>                                              ";
   html += "               </select>                                                              ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "         <div class=\"apnmt_info_wrap\">                                                ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text\">발령시작*</div>                         ";
   html += "               <div class=\"prd_text_wrap\">                                          ";
   html += "                  <input type=\"date\" class=\"prd_text\" id=\"prd_start\"/>         ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "            <div class=\"apnmt_info\">                                                 ";
   html += "               <div class=\"apnmt_info_text_end\">발령종료</div>                      ";
   html += "               <div class=\"prd_text_wrap\">                                          ";
   html += "                  <input type=\"date\" class=\"prd_text\" id=\"prd_end\"/>           ";
   html += "               </div>                                                                 ";
   html += "            </div>                                                                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "      <div class=\"apnmt_add_bottom_area\">                                              ";
   html += "         <div class=\"apnmt_add_cont_wrap\">                                            ";
   html += "            <div class=\"apnmt_add_cont_title\"> - 세부내용 - </div>                   ";
   html += "            <input type=\"text\" class=\"apnmt_add_cont_input\" />                     ";
   html += "         </div>                                                                         ";
   html += "      </div>                                                                             ";
   html += "   </div>                                                                                 ";
   html += "</div>                                                                                    ";
   $("#apntm_cont").html(html);
                                                                                                    
}
   
});
</script>
</head>
<body>
<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}" />
<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />
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
         <div class="page_title_text">인사발령</div>
      </div>
      <div class="apntm_add_btn_area">
         <input type="button" class="apntm_add_btn" id="apntm_add_btn" value="발령추가"/>
      </div>
<!--------------------- 발령 조회 Form ------------------------->         
         <form action="#" id="actionForm" method="post">
            <input type="hidden" id="no" name="no" />
            <div class="srch_wrap">
               <div class="srch_top_area"> 
                  <select class="srch_select" id="searchGbn" name="searchGbn">
                     <option selected  value="0">전체</option>
                     <option value="1">발령구분</option>
                     <option value="2">사원명</option>
                     <option value="3">발령부서</option>
                     <option value="4">발령직급</option>
                  </select>
                  <div class="srch_input">   
                     <input type="text"  name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
                  </div>
                  <div class="cmn_btn" id="searchBtn">검색</div>
               </div>
               <div class="srch_bottom_area">
                  <div class="aprvl_radio_wrap">
                     <div class="aprvl_radio_title">결재상태</div>
                        <div class="aprvl_radio_area">
                           <input type="radio" name="aprvl" id="aprvl_entr" checked="checked"/><label for="aprvl_entr">전체</label>
                           <input type="radio" name="aprvl" id="aprvl"/><label for="aprvl">승인</label>
                           <input type="radio" name="aprvl" id="aprvl_rjct"/><label for="aprvl_rjct">반려</label>
                           <input type="radio" name="aprvl" id="aprvl_cnsdr"/><label for="aprvl_cnsdr">검토</label>
                        </div>
                  </div>
                  <div class="srch_prd_wrap">
                     <div class="prd_radio_title">발령시작일</div>
                     <div class="prd_radio_area">
                        <input type="radio" name="prd" id="prd_entr" checked="checked"/><label for="prd_entr">전체</label>
                        <input type="radio" name="prd" id="prd"/><label for="prd">기간설정</label>
                     </div>
                     <div class="prd_wrap">
                        <div class="prd_text_wrap">
                           <input type="date" class="prd_text" id="prd_start"/>
                        </div>
                        <div class="prd_clsftn">~</div>
                        <div class="prd_text_wrap">
                           <input type="date" class="prd_text" id="prd_end"/>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </form>
<!--------------------- 발령 리스트 ------------------------->         
      <div class="apntm_cont_left_area">
         <div class="apntm_list_title">발령목록</div>
         <div class="apntm_list_area">
            <table class="apntm_list">
               <colgroup>
                  <col width="80"/>
                  <col width="100"/>
                  <col width="100"/>
                  <col width="100"/>
                  <col width="100"/>
                  <col width="150"/>
                  <col width="100"/>
               </colgroup>
               <thead>
                  <tr>
                     <th>No</th>
                     <th>발령구분</th>
                     <th>사원명</th>
                     <th>발령부서</th>
                     <th>발령직급</th>
                     <th>발령시작일</th>
                     <th>결재현황</th>
                  </tr>
               </thead>
               <tbody></tbody>
            </table>
         </div>
      </div>
      <div id="apntm_cont"></div>
   </div>
   <!-- bottom -->
   <c:import url="/bottom"></c:import>
</body>
</html>