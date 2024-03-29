<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시로이네코 - 게시판</title>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
	<link rel="shortcut icon" href="./favicon.ico"/>

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/plyr.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>게시글</title>
<style type="text/css">
#main {
	color: white;
	margin: 0 auto;
	width: 1000px;
	height: 100%;
}

#recom-main {
	margin: 0 auto;
	height: 450px;
	width: 1200px;
}

table {
	width: 100%;
	min-height: 300px;
	border-collapse: collapse;
}

th {
	width: 100px;
}

tr {
	min-height: 50px;
	width: 1200px;
	border-bottom: 1px white solid;
}
</style>

<c:if test="${detail.u_id eq sessionScope.u_email}">
	<script type="text/javascript">
$(document).ready(function(){
	var b_no = ${detail.b_no };
	$("#up").click(function(){
		//alert(ckeck);
		if(confirm("수정하시겠습니까?")){
			location.replace("./update?b_no="+b_no);
		}
	});
	
	$("#del").click(function(){
		if(confirm("해당 글을 삭제하시겠습니까?")){
			location.replace("./delete?b_no="+b_no);
		}
	});
	
	/*   $('#summernote').summernote({
		  'height' : 500
		'color' : white		 
	  }); */
	
});

</script>
</c:if>

<script type="text/javascript">

function commentwrite(u_email){
	if(u_email == null){
		alert("로그인한 사용자만 입력할 수 있습니다.");
	}
}

function cup(bc_no){
	if(confirm("해당 댓글을 수정하시겠습니까?")){
		location.href="./boardcomment_up?b_no=${detail.b_no }&bc_no=" + bc_no;
	}
}
function cdel(bc_no){
	if(confirm("해당 댓글을 삭제하시겠습니까?")){
		location.href="./boardcomment_del?b_no=${detail.b_no }&bc_no=" + bc_no;
	}
}

function like(){
	let b_no = ${detail.b_no};
	$.ajax({
		url : "./boardlike",
		type : "GET",
		dataType : "html",
		data : {"b_no" : b_no}, 
		success : function(data){
			if(data == 1){
				$("#like").attr('src','./img/like2.png');
				 $('#board_like').load(location.href+' #board_like');
			}else if(data == 0){
				$("#like").attr('src','./img/like.png');
				 $('#board_like').load(location.href+' #board_like');
			}
		} ,
		error : function(data){
			alert(data);
		}
	});
}


$(document).ready(function(){
	   let b_no = ${detail.b_no};
	    $.ajax({
			url : "./boardlike",
			type : "post",
			dataType : "html",
			data : {"b_no" : b_no}, 
			success : function(data){
				if(data == 1){
					$("#like").attr('src','./img/like2.png');
				}else {
					$("#like").attr('src','./img/like.png');
				}
			} ,
			error : function(data){
				alert(data);
			}
	 });
});

</script>

</head>
<body>
	<jsp:include page="./header.jsp" />


	<!-- 경로 -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.jsp"><i class="fa fa-home"></i> Home</a> <a
							href="./aniboard">게시판</a> <span>게시글</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 경로 -->

	<div id="anirecom-container">
		<div id="recom-main">
			<img alt="" src="./img/recom-main.png">
		</div>
	</div>

	<!-- Product Section Begin -->
	<section class="product-page spad"
		style="padding-top: 0; height: 100px;">
		<div class="container" style="width: 100%;">
			<div class="row">
				<div class="col-lg-8">
					<div class="product__page__content">
						<div class="product__page__title" style="width: 100%;">
							<div class="row">

								<div class="section-title">
									<h4>게시글</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!--  게시글 -->
<div class= container>
	<div id="main">
		<table border="1">
			<tr>
				<th colspan="2" style="text-align: center;">${detail.b_title } 
				<c:if test="${detail.u_id eq sessionScope.u_email }">
						<img id="up" src="./img/fix.png" title="수정" style="width: 15px; height: 15;">
						<img id="del" src="./img/delete.png" title="삭제" style="width: 15px; height: 15;">
				</c:if>
				</th>
			</tr>
			<tr>
				<th style="text-align: center; height: 20px;">${detail.u_nickname }</th>
				<th style="text-align: center;">${detail.b_date }</th>
			</tr>

			<tr style="height: 500px;">
				<td colspan="3" style="background-color: white"> ${detail.b_content }
				<br>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: right">
				&nbsp;
				<small id = "board_count">조회수 ${detail.b_count }</small>
				&nbsp;
				&nbsp;
				&nbsp;
				<small id="board_like">좋아요 ${detail.b_like }</small>
				&nbsp;
				</td>
				<%-- <td colspan="3" style="text-align: left;">
				<small id = "board_count">조회수 ${detail.b_count }</small>
				</td> --%>
				
			</tr>
		</table>
		
		             <div class="row" style="height: 100%;">
                    <div class="col-lg-8 col-md-8">
                        <div class="anime__details__review">
                            <div class="section-title">
                            <br>
                            <br>
                            <div class="anime__details__btn">
                                <img alt="" src="./img/like.png" id="like" onclick="like()">
                            </div>
							<br>
                            
		<!-- 댓글 -->

		<h5>Reviews</h5>
	</div>
	<div class="anime__review__item">
		<c:forEach items="${list }" var="i">
                          &nbsp; &nbsp; 
                                <div class="anime__review__item__pic">
				<img src="img/anime/review-1.jpg" alt="">
			</div>
			<div class="anime__review__item__text">
				<input type="hidden" name="bc_no" value="${i.bc_no }">
				<h6>${i.u_nickname }
					<small style="color: white"><span>${i.bc_date }</span></small>
					
					
					<c:if test="${sessionScope.u_email eq i.u_id }">
						<img id="cdel" src="./img/delete.png" title="삭제" width="20px" height="20px" align="right" onclick="cdel(${i.bc_no })">
						<img id="cup" src="./img/fix.png" title="수정" width="20px" height="20px" align="right" onclick="cup(${i.bc_no })">&nbsp; &nbsp; &nbsp;  &nbsp; 
                           </c:if>
				</h6>
				<p>${i.bc_comment }</p>
			</div>
		</c:forEach>
	</div>
	</div>
	</div>
	</div>


	<div class="anime__details__form" style="margin: 0 auto;">
			<div class="section-title">
				<h5>Your Comment</h5>
			</div>
			<form action="./boardComment">
				<input type="hidden" name="b_no" value="${detail.b_no }">
				<textarea placeholder="댓글을 작성하려면 로그인을 해주세요." id = "comment" name="comment" onclick="commentwrite(${sessionScope.u_email })" required="required"></textarea>
				<button type="submit" onclick="comment">
					<i class="fa fa-location-arrow"></i> Review </button>
			</form>
		</div>
	</div>
</div>


	<jsp:include page="footer.jsp" />
	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/player.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>