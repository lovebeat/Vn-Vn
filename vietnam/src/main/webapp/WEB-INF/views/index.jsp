<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="img" value="/resources/images" />

<!DOCTYPE html>
<html>
<head>

<title>Vn-Vn-${title }</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token }">
<meta name="_csrf_header" content="${_csrf.headerName }">
<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${css }/style.css">
<%-- <link rel="stylesheet" type="text/css" href="${css }/myapp.css"> --%>
<link rel="stylesheet" type="text/css" href="${css }/bootstrap-theme.min.css">
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Handlee"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nixie+One" rel="stylesheet"> 

<!-- new css for provider -->
 	 <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="${css }/bootstrap-datepicker.min.css">
  <!-- Theme style -->
  <%-- <link rel="stylesheet" href="${css }/AdminLTE.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="${css }/bootstrap-timepicker.min.css"> --%>
  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<!-- end -->

</head>
<body onscroll="stickyFunction()">


	<!-- HOME IS HERE -->
	<c:if test="${userClickHome==true }">
		<%@include file="home.jsp"%>
		<!-- Contact session -->
	<%@include file="./shared/contact.jsp"%>
	
	</c:if>
	
	
	
	<!-- Food page is here -->
	<c:if test="${userClickDetailFood==true }">
		<%@include file="detailFood.jsp"%>
	</c:if>
	
	<!-- Place page is here -->
	<c:if test="${userClickDetailPlace==true }">
		<%@include file="detailPlace.jsp"%>
	</c:if>
	
	<!-- City page is here -->
	<c:if test="${userClickDetailCity==true }">
		<%@include file="detailCity.jsp"%>
	</c:if>
	<c:if test="${userClickSearchHotel==true }">
		<%@include file="searchHotel.jsp"%>
	</c:if>
	
	<c:if test="${userAllFood==true }">
		<%@include file="allFood.jsp"%>
	</c:if>
	
	<c:if test="${userClickResultSearchHotel==true }">
		<%@include file="resultSearchHotel.jsp"%>
	</c:if>
	<c:if test="${userClickDetailHotel==true }">
		<%@include file="detailHotel.jsp"%>
	</c:if>
	

	<!-- FOOTER -->
	<%@include file="./shared/footer.jsp" %>
	
	
	<script type="text/javascript" src="${js }/jquery.min.js"></script>
	<script type="text/javascript" src="${js }/bootstrap.min.js"></script>
	<script type="text/javascript" src="${js }/script.js"></script>
	<%--<script type="text/javascript" src="${js }/myapp.js"></script> --%>
	<!-- bootstrap time picker -->
	<%-- <script src="${js }/bootstrap-timepicker.min.js"></script> --%>
	<!-- bootstrap datepicker -->
	<script src="${js }/bootstrap-datepicker.min.js"></script>
	<script>
		$(function(){
			//Date picker
		    $('#datepicker').datepicker({
		      autoclose: true
		    })
		    
		    	    $('#datepicker2').datepicker({
		      autoclose: true
		    })
				});
	</script>
</body>
</html>