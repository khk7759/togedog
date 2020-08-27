<%@ page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
%>
<!DOCTYPE html>
<html>
<head>
</head>
<style>
/* 폰트 추가 */
	@font-face 
	{ 
		font-family: 'Handon3gyeopsal300g';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal600g.woff') format('woff'); 
		font-weight: normal; 
		font-style: normal; 
	}
	body 
	{
		font-family: Handon3gyeopsal300g;
	}

	#content{text-align : center; padding-top : 5%; padding-left : 5%; padding-right : 5%; padding-bottom : 2%;}
	.calendar{height : 50px;}
	#year{font-size : 18pt;}
	#month{font-size : 18pt;}
	.tbl{width : 100%;}
	.table{text-align : center;}
	#tabler th{height : 50px; width : 100px; border-bottom : 1px solid gray; vertical-align : middle; text-align : center;}
	#tabler td{height : 100px; width : 100px; text-align : left; vertical-align : top; border : 1px solid #d9d9d9; padding : 10px;}
	.article:hover{cursor : pointer;}
	.sun{color : #F25C69;}
	.sat{color : #3f6abf;}
	.walk
	{
		background-color : #80ffd4;
		margin : 0px;
		padding : 0px;
		width : 100%;
		height : 20px;
	}
	
	.but
	{
		background-color : #DBDBDB;
		margin : 0px;
		padding : 0px;
		width : 100%;
		height : 20px;
	}
	
	.edu
	{
		background-color : #e1ccff;
		margin : 0px;
		padding : 0px;
		width : 100%;
		height : 20px;
	}
	
	.hel
	{
		background-color : #aadbff;
		margin : 0px;
		padding : 0px;
		width : 100%;
		height : 20px;
	}
	
	.sup
	{
		background-color : #ffcabd;
		margin : 0px;
		padding : 0px;
		width : 100%;
		height : 20px;
	}
	
	.etc
	{
		background-color : #ffcef5;
		margin : 0px;
		padding : 0px;
		width : 100%;
		height : 20px;
	}
	
	.shower:hover
	{
		cursor : pointer;
		border: none;
		outline: solid 1px #3F6ABF;
		font-weight : bold;
	}
</style>
<body>
	<div class="col-md-12" id="content">
		<!-- 캘린더 -->
		<div class="calendar">
			<button type="button" class="btn btn-xs yDownBtn" value="-1" >◀</button>
			<button type="button" class="btn btn-xs mDownBtn" value="-1" >◁</button>
		
			<!-- 년월 -->
			<span id="year"><%=year %></span><span style="font-size: 18px;">년</span> 
			<span id="month"><%=month %></span><span style="font-size: 18px;">월</span>
			
			<button type="button" class="btn btn-xs mUpBtn" value="1" >▷</button>
			<button type="button" class="btn btn-xs yUpBtn" value="1" >▶</button>
		</div>
		
		<table id="tabler">
			<thead>
				<tr>
					<th style="color:#F25C69;">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th style="color:#3f6abf;">토</th>
				</tr>
			</thead>
			
			<tbody>
			</tbody>
		</table>
		
		<table id="ownsch" class="table table-condensed"></table>
	</div>
</body>
<script>
	year = $("#year");
	month = $("#month");
	table = $("#tabler > tbody");

	$().ready(function()
	{	
		makeCalendar();
		
		//년 빼기 클릭시 다시 작동
		$(".yDownBtn").click(function()
		{	
			yearDown();
			makeCalendar();
		});
		
		//월 빼기 클릭시 다시 작동
		$(".mDownBtn").click(function()
		{
			monthDown();
			makeCalendar();
		});
		
		//월 더하기 클릭시 다시 작동
		$(".mUpBtn").click(function()
		{
			monthUp();
			makeCalendar();
		});
		
		//년 더하기 클릭시 다시 작동
		$(".yUpBtn").click(function()
		{
			yearUp();
			makeCalendar();
		});
		
		$(document).on("click", ".walk", function()
		{		
			if(document.getElementsByClassName("moveElement")[0] != undefined)
			{
				alert("기록수정중");
				return;
			}
			else
				if(confirm("산책기록을 이동하겠습니까?"))
				{
					MakeDraggable($(this));
					$(this).addClass("moveElement");
				}
				else
					return;
		});
		
		$(document).on("click", ".but", function()
		{
			if(document.getElementsByClassName("moveElement")[0] != undefined)
			{
				alert("기록수정중");
				return;
			}
			else
				if(confirm("미용기록을 이동하겠습니까?"))
				{
					MakeDraggable($(this));
					$(this).addClass("moveElement");
				}
				else
					return;
		});
		
		$(document).on("click", ".edu", function()
		{
			if(document.getElementsByClassName("moveElement")[0] != undefined)
			{
				alert("기록수정중");
				return;
			}
			else
				if(confirm("교육기록을 이동하겠습니까?"))
				{
					MakeDraggable($(this));
					$(this).addClass("moveElement");
				}
				else
					return;
		});
		
		$(document).on("click", ".hel", function()
		{
			if(document.getElementsByClassName("moveElement")[0] != undefined)
			{
				alert("기록수정중");
				return;
			}
			else
				if(confirm("건강기록을 이동하겠습니까?"))
				{
					MakeDraggable($(this));
					$(this).addClass("moveElement");
				}
				else
					return;
		});
		
		$(document).on("click", ".sup", function()
		{
			if(document.getElementsByClassName("moveElement")[0] != undefined)
			{
				alert("기록수정중");
				return;
			}
			else
				if(confirm("용품기록을 이동하겠습니까?"))
				{
					MakeDraggable($(this));
					$(this).addClass("moveElement");
				}
				else
					return;
		});
		
		$(document).on("click", ".etc", function()
		{
			if(document.getElementsByClassName("moveElement")[0] != undefined)
			{
				alert("기록수정중");
				return;
			}
			else
				if(confirm("기타기록을 이동하겠습니까?"))
				{
					MakeDraggable($(this));
					$(this).addClass("moveElement");
				}
				else
					return;
		});
		
		$(document).on("click", ".shower", function()
		{
			makeSchedule($(this).text());
		});
		
		$(document).on("click", "#addRec", function()
		{
			openFrame();
		});
		
		$(document).on("click", ".recInsert", function()
		{
			$("#recForm").attr("action", "walkrecwrite.action");
			$("#recForm").submit();
		});
	});
	
	//년 빼기
	function yearDown()
	{
		if(Number(year.text()) > 2000)
			year.text(Number(year.text()) - 1);
	}
	
	//년 더하기
	function yearUp()
	{
		year.text(Number(year.text()) + 1);
	}
	
	//월 빼기
	function monthDown()
	{
		if(Number(month.text()) == 1)
		{
			yearDown();
			month.text("12");
		}
		else
			month.text(Number(month.text()) - 1);
	}
	
	//월 더하기
	function monthUp()
	{
		if(Number(month.text()) > 11)
		{
			yearUp();
			month.text("1");
		}
		else
			month.text(Number(month.text()) + 1);
	}
	
	//캘린더 구현
	function makeCalendar()
	{
		var Year = Number(year.text());
		var Month = Number(month.text());
		
		$.ajax(
		{		
			type : "POST",
			url : "ownajaxcal.action",
			data : 
			{
				year : Year,
				month : Month
			},
			success : function(data)
			{
				table.empty();
				table.append(data);
			}
		});
	}
	
	//해당날짜 스케쥴
	function makeSchedule(date)
	{
		var Year = year.text();
		var Month = month.text();
		
		if(Month.length == 1)
			Month = "0" + Month;
		if(date.length == 1)
			date = "0" + date;
		
		resultDate = Year + "-" + Month + "-" + date;
		
		$.ajax(
		{
			method : "POST",
			url : "ownacallist.action",
			data : 
			{
				paramDate : resultDate
			},
			success : function(data)
			{
				$("#ownsch").empty();
				$("#ownsch").append(data);
			}
		});
	}
	
	//드래그 앤 드롭 작동
	function MakeDraggable(obj)
	{	
		obj.draggable(
		{
			stack : ".draggable",
			opacity : 0.8,
			containment : "#tabler tbody",
			refreshPositions: true,
			revert : function(event, ui)
			{
				if(event == false)
				{
					isRevert = false;
					return true;
				}
				else
					isRevert = true;
			}
		});
		
		//드랍시 작용
		$(".shower").droppable(
		{
			drop : function(event, ui) 
			{	
				var type = $(".moveElement")[0].className.split(" ")[0];
				var subCd = $(".moveElement > input").val();
				var Year = Number(year.text());
				var Month = Number(month.text());
				var date = $(this).text();
				
				var subDate = Year + "-" + Month + "-" + date;
				
				$.ajax(
				{
					method : "POST",
					url : "ownajaxcalupdate.action",
					data : 
					{
						schCd : subCd,
						walkDate : subDate
					},
					success : function(data)
					{
						alert(subDate + "로 기록이 수정되었습니다.");
					}
				});
				
				if(type == "walk")
					$(this).append("<div class='walk'><input type='hidden' value='" + subCd + "' /></div>");
				else if(type == "but")
					$(this).append("<div class='but'><input type='hidden' value='" + subCd + "' /></div>");
				else if(type == "edu")
					$(this).append("<div class='edu'><input type='hidden' value='" + subCd + "' /></div>");
				else if(type == "hel")
					$(this).append("<div class='hel'><input type='hidden' value='" + subCd + "' /></div>");
				else if(type == "sup")
					$(this).append("<div class='sup'><input type='hidden' value='" + subCd + "' /></div>");
				else if(type == "etc")
					$(this).append("<div class='etc'><input type='hidden' value='" + sub + "' /></div>");
					
				$(".moveElement").remove();
			}
		});
	}
</script>
</html>