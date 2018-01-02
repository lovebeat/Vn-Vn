<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="ckeditor" value="/resources/ckeditor" />
<spring:url var="images" value="/resources/images" />
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Vn-Vn  | ${title}</title>
  <script>
    	window.contextRoot = '${contextRoot}';
  </script>
  
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${css }/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${css }/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${css }/ionicons.min.css">
  
  <!-- Theme style -->
  <link rel="stylesheet" href="${css }/AdminLTE.min.css">
  <!-- AdminLTE Skins.-->
  <link rel="stylesheet" href="${css }/_all-skins.min.css">
  
  <!-- DataTables -->
  <link rel="stylesheet" href="${css }/dataTables.bootstrap.min.css">
 <link rel="stylesheet" href="${css }/myapp.css">
 <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="${css }/bootstrap-timepicker.min.css">
 
   <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="${contextRoot}/manage/" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>VN</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>VN</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${images }/vn.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${userModel.fullName}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${images }/vn.jpg" class="img-circle" alt="User Image">

                <p>
                  ${userModel.fullName}
                  
                </p>
              </li>
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Hồ sơ</a>
                </div>
                <div class="pull-right">
                  <a href="${contextRoot }/perform-logout" class="btn btn-default btn-flat">Đăng xuất</a>
                </div>
              </li>
            </ul>
          </li>
          
        </ul>
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${images }/vn.jpg" class="img-circle" alt="User Image" style="height: 50px;">
        </div>
        <div class="pull-left info">
          <p>${userModel.fullName}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                  <i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">DANH MỤC QUẢN LÍ</li>
        <li>
          <a href="${contextRoot}/manage/cities">
            <i class="fa fa-building-o"></i> <span>Tỉnh/T.Phố</span>
          </a>
        </li>
        <li>
          <a href="${contextRoot}/manage/places">
            <i class="fa fa-map-signs"></i> <span>Địa Điểm</span>
          </a>
        </li>
        <li>
          <a href="${contextRoot}/manage/foods">
            <i class="fa fa-heart-o"></i> <span>Ẩm thực</span>
          </a>
        </li>
        <li>
          <a href="${contextRoot}/manage/listHotelApprove">
            <i class="fa fa-check-square-o"></i> <span>Home Stay</span>
          </a>
        </li>
        <li>
          <a href="${contextRoot}/manage/banner">
            <i class="fa fa-file-image-o"></i> <span>Banner</span>
          </a>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Quản lí
        <small>${title }</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${contextRoot}/manage/"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li class="active">${title }</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
		<!-- Content -->
			
			
				<!-- Load only user click cities in manage pages -->
				<c:if test="${userClickManageCities==true }">
					<%@include file="manageCities.jsp"%>
				</c:if>
				
				<!-- Load only user click places in manage pages -->
				<c:if test="${userClickManagePlaces==true }">
					<%@include file="managePlaces.jsp"%>
				</c:if>
	
				<!-- Load only user click foods in manage pages -->
				<c:if test="${userClickManageFoods==true }">
					<%@include file="manageFoods.jsp"%>
				</c:if>
     
     			<c:if test="${userClickListHotelApprove==true }">
					<%@include file="ListHotelApprove.jsp"%>
				</c:if>
     			
     			<c:if test="${userClickViewAndApprove==true }">
					<%@include file="viewHotel.jsp"%>
				</c:if>
				<c:if test="${userClickManageBanner==true }">
					<%@include file="manageBanner.jsp"%>
				</c:if>
     			
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2017 <a href="#">Viet Nam</a>.</strong> All rights
    reserved.
  </footer>


</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${js }/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${js }/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${js }/jquery.dataTables.min.js"></script>
<script src="${js }/dataTables.bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${js }/adminlte.min.js"></script>
<script src="${js }/myapp.js"></script>
<!-- Bootbox -->
<script src="${js }/bootbox.min.js"></script>
<!-- bootstrap time picker -->
<script src="${js }/bootstrap-timepicker.min.js"></script>
<script src="${ckeditor }/ckeditor.js"></script>
<script>
	$(function () {
	    
	    CKEDITOR.replace('content')
	   
	  })
</script>
</body>
</html>
