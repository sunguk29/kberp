/**
 * cMain.js
 * create by 2022.05.10
 * top 메뉴 핸들링
 */
$(document).ready(function() {
	$(".right_area_wrap").slimScroll({
		width : $(".right_area").width() + "px",
	    height : $(".right_area").height() + "px",
	    axis : 'both'
	});
	
	$(window).resize(function(){
		$(".right_area_wrap").slimScroll({
			width : $(".right_area").width() + "px",
			height : $(".right_area").height() + "px",
			axis : 'both'
		});
	});
	
	//Logout Button
	$("#logoutBtn").on("click", function() {
		location.href = "cLogout";
	});
	
	//Logo Event
	$(".logo").on("click", function() {
		$("#top").val(68);
		
		$("#menuNum").val(1);
		
		$("#menuType").val("B");
		
		$("#locationForm").attr("action", "board");
		
		$("#locationForm").submit();
	});
	
	//Left Menu Location Event
	$(".left_area").on("click", ".menu_depth2_area, .menu_depth2_single_area,  .menu_depth3", function() {
		if($(this).is("[adrs]")) {
			$("#menuNum").val($(this).attr("menunum"));
			
			if($(this).attr("adrs") == "board") {
				$("#menuType").val("B");
			} else {
				$("#menuType").val("M");
			}
			
			$("#locationForm").attr("action", $(this).attr("adrs"));
			
			$("#locationForm").submit();
		} else {
			$(".menu_depth2_on").attr("class", "menu_depth2");
			
			$(this).parent().attr("class", "menu_depth2_on");
		}
	});
	
	//Top Menu Location Event
	$(".menu_depth1_wrap").on("click", ".top_menu, .top_menu_on", function() {
		$("#top").val($(this).attr("topnum"));
		
		$("#menuNum").val($(this).attr("menunum"));
		
		if($(this).attr("adrs") == "board") {
			$("#menuType").val("B");
		} else {
			$("#menuType").val("M");
		}
		
		$("#locationForm").attr("action", $(this).attr("adrs"));
		
		$("#locationForm").submit();
	});
});
	