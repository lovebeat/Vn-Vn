<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="img" value="/resources/images" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Vn-Vn-${title }</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${css }/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${css }/style.css">
<link rel="stylesheet" type="text/css"
	href="${css }/bootstrap-theme.min.css">
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Handlee"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nixie+One"
	rel="stylesheet">
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath }/home">Home</a>
			</div>
		</div>
		<!-- /.container -->
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="jumbotron">
					<h1>${errorTitle}</h1>
					<hr />
					<blockquote style="word-wrap: break-word;">
						${errorDescription}</blockquote>
				</div>
			</div>

		</div>
	</div>


	<script type="text/javascript" src="${js }/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${js }/bootstrap.min.js"></script>
	<script type="text/javascript" src="${js }/script.js"></script>

</body>
</html>