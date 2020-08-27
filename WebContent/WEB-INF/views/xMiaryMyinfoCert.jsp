<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MiaryMyinfoCert.jsp</title>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">
<link rel="stylesheet" type="text/css" href="css/MiaryTemplate.css">
<link rel="stylesheet" type="text/css" href="css/Modal.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="js/timedropper.js"></script>
<link rel="stylesheet" type="text/css" href="js/timedropper.css">
<style type="text/css">

<style type="text/css">

div .nav-btns
{
	padding: 0px 0px 0px 0%;
	margin: 20px 0px 5px 0px;
}


.nav-tabs
{
	padding: 0px 0px 0px 0px;
	margin: 10px 10px 0px 20px;

}

th, td
{
	text-align: center;                               
}


/* css 파일 안먹어서 중복으로 작성 */
.container
{
	padding: 0px 0px 0px 0px;
	border-radius: 0px 0px 0px 0px;
}

/* 너비 맞춤 */
.content-wrap
{	
	width :100%;
	margin : 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
	border-radius: 0px 0px 0px 0px;
	background-color: var(--blue);
}

.menus
{
	margin: 30px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}

.txt
{
	margin: 10px 0px 0px 70px;
	padding: 0px 0px 0px 0px;
	font-size: 18px;
	font-weight: bold;
	text-align: left;
}

.innerBtn
{
	color: #ffffff;
	background-color: #3F6ABF;
	font-weight: bold;
	border: 0px;
	border-radius: 12px;
	outline: 0;
	letter-spacing: 0.05em;
	/* box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19); */
	font-size: 14px;
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
}

.innerBtn:hover
{
	color: #2B4071;
	background-color: #F0F2E7;
}



/* 메뉴탭(메인, 기록...) 효과 정리 */
  
.flex-column > li > a:hover,
.flex-column > li > a:focus 
{
  text-decoration: none;
  background-color: #fff;
  border-radius: 0 10px 10px 0;
}

 .nav-tabs > li > a 
{
  margin-right: 0px;
  line-height: 1.42857143;
  border: 1px solid transparent;
  border-radius: 10px 10px 0 0;
} 
 

.btn
{
	color: #ffffff;
	background-color: #75C3F8;
	font-weight: bold;
	border: 0px;
	border-radius: 12px;
	outline: 0;
	padding: 0.75em 2.5em 0.75em 2.5em;
	letter-spacing: 0.05em;
	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
	font-size: 14px;
}
 
.password 
{
	width: 250px;
}

.check 
{
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.password 
{
	width: 250px;
}

.check 
{
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.find 
{
	width: 100px;
	height: 25px;
	padding: 0.1em 0.5em 0.1em 0.5em;
	letter-spacing: 0.05em;
	border-radius: 5px;
	box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
		rgba(0, 0, 0, 0.19);
	font-size: 13px;
}

.form-control 
{
	width: 180px;
	height: 25px;
	font-size: 12px;
}

.time 
{
	width: 100px;
}

body 
{
	margin: 0;
	padding: 0;
}

</style>
<script type="text/javascript">
</script>

</head>
<body>
    <c:import url="Header.jsp"></c:import>
    
		<!-- 전체 감싸는 container -->
		<div class="container col-md-12">
		

			<!-- 견주/워커 탭과 content 와 nav-bar 를 감싸는 content-wrap -->
			<div class="content-wrap col-md-12">
		
		
		
		
		
		
				<div class="tabbable" id="tabs-460097">
				
					<!-- 견주/워커 탭 -->
					<ul class="nav nav-tabs col-md-3" style="border-bottom: none;">
						<li class="nav-item">
							<a class="nav-link" href="#tab1" data-toggle="tab">견주</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#tab2" data-toggle="tab">워커</a>
						</li>
					</ul>
					
					
				</div>
				
				<!-- main 감싸는 content -->
				<div class="content col-md-11">
				
					<!-- 메인 영역 -->
					<div class="main col-md-12" style="height: 450px;">						
							
<div id="innerHeader" class="container-fluid" style="margin: 0; top: 0; left: 0; right: 0; height: 70px;">
	<div class="row">
		<div class="col-md-3">
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-weight: bold; font-size: 25px; color: #ABABAB; position: relative;">마이정보</span>
		</div>
		<div class="col-md-9"></div>
	</div>
</div>

<br><br>

<div id="row" style="text-align: center; line-height: 30px; color: #666666;">
	※ 정보 수정 전 본인확인을 위해 비밀번호를 입력해주세요.
</div>

<br>
<div id="inputPwd" class="container-fluid" style="line-height: 30px; background-color: #F0F0F0; text-align: center;
		width: 300px; height: 100px; border: 1px solid gray; border-radius: 5px;">
	<div class="row" style="line-height: 50px;">
		<span style="font-size: 14px; font-weight: bold;">비밀번호 재확인</span>
	</div>
	<div class="row" style="line-height: 30px;" align="center">
		<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
	</div>
</div><br><br>

<div class="row" style="line-height: 30px; text-align: center;">
	<button type="button" class="btn" id="btn pwd-cert" name="btn pwd-cert" 
	style="width:100px; height: 37px; font-size: 13px; border-radius: 5px;">확인</button>
</div>
					
					
					
					
					
					

<br><br>		
							
					</div><!-- end main -->
						
				</div><!-- end content  -->
					
				<!-- 탭들 감싸는 nav-bar -->
				<div class="nav-bar col-md-1"  style="margin-top: 15px; padding-left: 0px;">
					<ul class="nav flex-column" >
						<li class="nav-item"><a class="nav-link active" href="#">메 인</a></li>
						<li class="nav-item"><a class="nav-link" href="#">매 칭</a></li>
						<li class="nav-item"><a class="nav-link" href="#">기 록</a></li>
						<li class="nav-item"><a class="nav-link" href="#">그 룹</a></li>
						<li class="nav-item"><a class="nav-link" href="#">통 계</a></li>
						<li class="nav-item"><a class="nav-link" href="#">정 보</a></li>
					</ul>
				</div><!--  end nav_bar -->
			</div><!-- end content-wrap  -->

		</div><!-- end container -->
		
		
	<c:import url="Footer.jsp"></c:import>
		
</body>
</html>