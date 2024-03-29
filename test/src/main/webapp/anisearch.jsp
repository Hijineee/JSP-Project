<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시로이네코</title>
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
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <link rel="stylesheet" href="css/signup.css" type="text/css">
    
   
   
   <style type="text/css">
       #recom-main{
    	margin: 0 auto;
    	height: 450px;
    	width: 1200px;
   	 }
   	 #row{
   	 	width: 1200px;
   	 }
   	 
   
   </style>
   <script type="text/javascript">
   function search(){
	   let search = $("#search").val(); 
	   
	   if(search == ""){
	   		alert("만화제목을 입력해주세요.");
	   		$("#search").focus();
	   }else{
		   location.href="./anisearch?a_title=" + search; 
	   }
   }
   
   </script>
   
   
</head>
<body>
	<jsp:include page="./header.jsp"/>
	
		   <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                       	 <span>애니리뷰</span>
                       	  <c:if test="${sessionScope.u_email eq 'admin@a.com' }">
                                     <button type="button" onclick="location.href='./aniwrite'" style="position: absolute;left: 550px; width: 150px; font-size: 11px; color: #ffffff;font-weight: 700;letter-spacing: 2px;text-transform: uppercase;background: #e53637; border: none; padding: 10px 15px; border-radius: 2px;"><i class="fa fa-location-arrow">Write</i></button>
						  	 </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
     
       <!-- Product Section Begin -->
    <section class="product-page spad"> 
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                
                                    <div class="section-title">
                                        <h4>Review</h4>
                                    </div>
                          
							 		 <div class="product__page__filter">

									 </div>
                            </div>
                        </div>
                        
                         <div class="row">
                         <c:forEach items="${list }" var="i">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="./img/upload/${i.a_file }">
                             
                                        <div class="ep">${i.a_epi }부작</div>
                                        <div class="comment"><i class="fa fa-comments"></i>${i.commentcount }</div>
                                        <div class="view"><i class="fa fa-eye"></i>${i.a_count }</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>${i.a_category }</li>
                                        </ul>
                                        <h5><a href="./anidetail?a_no=${i.a_no }">${i.a_title }</a></h5>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                          </div>
                     </div>
                     
<%--                 <!-- 페이징 아이콘 -->
                     <fmt:parseNumber integerOnly="true" var="totalpage" value="${totalcount / 9 }"/>
                     <c:if test="${(totalcount % 9) > 0 }">
         				<c:set var="totalpage" value="${totalpage + 1}"/>
      				</c:if>
      				<c:if test="${pageNo % 9 ne 0 }">
            			<fmt:parseNumber integerOnly="true" var="startpage" value="${pageNo / 9 }"/>
            			<c:set var="startpage" value="${startpage * 9+ 1 }"/>         
      				</c:if> 
      				
      				
      				<c:if test="${pageNo % 9 eq 0 }">
         				<c:set var="startpage" value="${pageNo - 8 }"/>
      				</c:if>
      				
      				<c:set var="endpage" value="${startpage + 4 }"/>
     				<c:if test="${startpage + 4 gt totalpage }">
      					<c:set var="endpage" value="${totalpage }"/>
     		 		</c:if>
     		 		 --%>
     		 		
                    <div class="product__pagination">
                    	<a href="#"><i class="fa fa-angle-double-left"></i></a>
                     <c:forEach begin="${startpage }" end="${endpage }" var="n">
                     
                       	<a href="./anireview?pageNo=${n }" class="current-page">${n }</a>
                     
                     </c:forEach>   
                        <a href="#"><i class="fa fa-angle-double-right"></i></a>
                    </div>
                  </div>
                
                 <!-- 오른쪽 top5 구역 -->
                 <div class="col-lg-4 col-md-4">
                        <div class="anime__details__sidebar">
                            <div class="section-title">
                                <h5>Top 5</h5>
                            </div>
                            <c:forEach items="${top }" var="c">
                            <div class="product__sidebar__view__item set-bg" data-setbg="img/upload/${c.a_file }">
                                <div class="view"><i class="fa fa-eye"></i> ${c.a_count }</div>
                                <h5><a href="./anidetail?a_no=${c.a_no }">${c.a_title }</a></h5>
                            </div>
                            </c:forEach>
                        </div>
                        <input type="search" id="search" name="search" class="form-control" placeholder="만화제목" style="width: 250px; float: left;"> &nbsp; <button class="btn btn-danger" style="width: 100px" onclick="search()">search</button>
           		</div>
              </div>
           </div>
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
</body>
</html>