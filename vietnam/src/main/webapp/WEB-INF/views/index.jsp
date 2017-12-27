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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token }">
<meta name="_csrf_header" content="${_csrf.headerName }">
<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${css }/style.css">
<%-- <link rel="stylesheet" type="text/css" href="${css }/myapp.css"> --%>
<link rel="stylesheet" type="text/css"
	href="${css }/bootstrap-theme.min.css">
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Handlee"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nixie+One"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:700"
	rel="stylesheet">
<!--This is icon for about us  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- new css for provider -->

<link href="${css }/datepicker.css" rel="stylesheet" />

<!-- Bootstrap time Picker -->
<link rel="stylesheet" href="${css }/bootstrap-timepicker.min.css"> 
<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
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
	<c:if test="${userClickDetailHotel==true }">
		<%@include file="detailHotel.jsp"%>
	</c:if>
	
	<c:if test="${userClickBookingRoom==true }">
		<%@include file="booking.jsp"%>
	</c:if>
	<c:if test="${userClickResultSearchHotel==true }">
		<%@include file="resultSearch.jsp"%>
	</c:if>
	<!--This is for about us page  -->
	<c:if test="${userClickAbout==true }">
		<%@include file="about.jsp"%>
	</c:if>
	<!-- FOOTER -->
	<%@include file="./shared/footer.jsp"%>
	<!--To top button  -->
	<%@include file="./shared/toTop.jsp"%>
	<script type="text/javascript" src="${js }/jquery.min.js"></script>
	<script type="text/javascript" src="${js }/bootstrap.min.js"></script>
	<script type="text/javascript" src="${js }/script.js"></script>
	<script src="${js }/bootstrap-datepicker.js"></script>
	
	<script>
		//thí is script for navigation bar, create fixed nav when scroll body
		var navbar = document.getElementById("navbar");
		var sticky = navbar.offsetTop;
		window.onscroll = function() {
			scrollFunction()
		};
		function scrollFunction() {
			
			//for navigation bar
			if (window.pageYOffset >= sticky) {
				navbar.classList.add("sticky");
			} else {
				navbar.classList.remove("sticky");
			}
			// When the user scrolls down 20px from the top of the document, show the button
			if (document.body.scrollTop > 200
					|| document.documentElement.scrollTop > 200) {
				document.getElementById("btnToTop").style.display = "block";
				
			} else {
				document.getElementById("btnToTop").style.display = "none";
			} 
		}
		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>
	<script>
    $(function () {
        'use strict';
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var checkin = $('#timeCheckIn').datepicker({
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            if (ev.date.valueOf() > checkout.date.valueOf()) {
                var newDate = new Date(ev.date)
                newDate.setDate(newDate.getDate() + 1);
                checkout.setValue(newDate);
            }
            checkin.hide();
            $('#timeCheckOut')[0].focus();
        }).data('datepicker');
        var checkout = $('#timeCheckOut').datepicker({
            onRender: function (date) {
                return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            checkout.hide();
        }).data('datepicker');
    });
</script>

</body>
</html>