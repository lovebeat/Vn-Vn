<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div class="topnav container-fluid" id="myTopnav">
	<div class="row nav">
			
				<a href="#Welcome">Welcome</a>
	  			<a href="#top-experiences">Top Experiences</a>
	  			<a href="#food">Food</a>
	  			<a href="#contact">Contact</a>
	  			<a href="#about">About</a>
	  			<div class="nav-dropdown">
	  				<div class="nav-dropbtn">Dopdown <span class="glyphicon glyphicon-chevron-down" style="font-size: 10px;"></span></div>
	  				<div class="nav-dropdown-content">
	  					<a href="#">Link1</a>
	  					<a href="#">Link2</a>
	  					<a href="#">Link3</a>
	  				</div>
	  			</div>
  			<security:authorize access="hasAuthority('admin')">
  				<%-- <a href="${contextRoot }/manage">Go to manage</a> --%>
  				<script type="text/javascript">
					window.location.href = "${contextRoot }/manage";
				</script>
  			</security:authorize>
  			<security:authorize access="hasAuthority('provider')">
  				<a href="${contextRoot }/provider">Create Hotel For Provider</a>
  			</security:authorize>
  			<security:authorize access="isAnonymous()">
  				<a href="${contextRoot }/login">Login</a>
  			</security:authorize>
  			<a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="showNavMenuInSmall()">&#9776;</a>
	</div>
</div>
<div class="container">
	<div class="row">
		<hr>
	</div>
</div>
<script>
	window.userRole = '${userModel.role}';
	window.userName = '${userModel.fullName}';
</script>