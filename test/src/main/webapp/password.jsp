<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

   <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>씹덕 | 양산소</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
<!--     <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/login.css"> -->
    
    <style type="text/css">
    #main{
       margin: 0 auto;
       height: 100%;
       width: 900px;
    }
    
    
    </style>
</head>
<body>

   <jsp:include page="./header.jsp"/>
   
   <!-- 로그인 -->
   <section calss="login- form">
      <h1 style="color: white; text-align:center"> 비밀번호를 잊으셨나요?</h1>
      <form action="">
         <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
	<img src="data:image/jpeg;base64,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" style="width: 380px;">
    </div>

    <!-- Login Form -->
    <form>
      <input type="text" id="login" class="fadeIn second" name="login" placeholder="email">
      <input type="submit" class="fadeIn fourth" value="비밀번호 재설정 이메일 전송">
    </form>

  </div>
</div>
      </form>
         <div class="caption">
            <a herf="">forget password?</a>
         </div>
         
         <%-- 에러 ${error } --%>
		<br>
		<%-- 파람.에러 ${param.error } --%>
		<%
		String error = request.getParameter("error");
		if (error != null) {
		%>
		<script type="text/javascript">
			alert("아이디와 비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
		</script>
		<%
		}
		%>
         
   </section>
   
   
   <jsp:include page="footer.jsp"/>
   
       <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/player.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script src="jquery-3.4.1.js"></script>
</body>
</html>