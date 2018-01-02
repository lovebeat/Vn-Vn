<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-default navbar-static-top" id="navbar">
	<div class="container-fluid" style="background-color: #ffffff;">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Viet Nam</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="#top-experiences">Top
					Experiences</a></li>
			<li><a href="#food">Food</a></li>
			<li><a href="#contact">Contact</a></li>
			<li><a href="${contextRoot }/about">About us</a></li>

		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-user"></span>
					Sign Up</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul>
	</div>
</nav>

<script>
	window.userRole = '${userModel.role}';
	window.userName = '${userModel.fullName}';
</script>