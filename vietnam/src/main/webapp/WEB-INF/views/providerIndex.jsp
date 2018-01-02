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
  
  <meta name="_csrf" content="${_csrf.token }">
<meta name="_csrf_header" content="${_csrf.headerName }">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${css }/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${css }/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${css }/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="${css }/jquery-jvectormap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${css }/AdminLTE.min.css">
  <!-- AdminLTE Skins.-->
  <link rel="stylesheet" href="${css }/_all-skins.min.css">
   <!-- bootstrap datepicker -->
<%--   <link rel="stylesheet" href="${css }/bootstrap-datepicker.min.css"> --%>
  <link href="${css }/datepicker.css" rel="stylesheet" />
  <!-- DataTables -->
  <link rel="stylesheet" href="${css }/dataTables.bootstrap.min.css">
 <link rel="stylesheet" href="${css }/myapp.css">
 <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="${css }/bootstrap-timepicker.min.css">
 
   <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="${contextRoot}/provider/" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>P</b>VN</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Provider</b>VN</span>
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
                  <small>Member since Nov. 2012</small>
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
          <p> ${userModel.fullName}</p>
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
          <a href="${contextRoot}/provider/new">
            <i class="fa fa-pencil-square-o"></i> <span>Đăng kí Home Stay mới</span>
          </a>
        </li>
        <li>
          <a href="${contextRoot}/provider/waitApprove">
            <i class="fa fa-spinner"></i> <span>DS Home Stay đợi duyệt</span>
          </a>
        </li>
        <li>
          <a href="${contextRoot}/provider/available">
            <i class="fa fa-check-square-o"></i> <span>DS Home Stay đã ĐK</span>
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
        Provider
        <small>${title }</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${contextRoot}/provider/"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li class="active">${title }</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
		<!-- Content -->
			
			
				<!-- -->
				<c:if test="${userClickCreateNew==true }">
					<%@include file="newHotel.jsp"%>
				</c:if>
				
				<!--  -->
				<c:if test="${userClickAvailable==true }">
					<%@include file="availableProvider.jsp"%>
				</c:if>
				
				<!-- Room page -->
				<c:if test="${userClickDeatailRooms==true }">
					<%@include file="roomOfHotels.jsp"%>
				</c:if>
				<!--  -->
				<c:if test="${userClickWaitApprove==true }">
					<%@include file="waitApprove.jsp"%>
				</c:if>
				<c:if test="${userClickEditBooking==true }">
					<%@include file="editInfBooking.jsp"%>
				</c:if>
				<c:if test="${userClickDeleteBooking==true }">
					<%@include file="delBooking.jsp"%>
				</c:if>
				<c:if test="${userClickEditRoom==true }">
					<%@include file="editRoom.jsp"%>
				</c:if>
				<c:if test="${userClickSearchDateBooking==true }">
					<%@include file="bookingDirect.jsp"%>
				</c:if>
				<%-- <c:if test="${userClickResultSearchRoom==true }">
					<%@include file="resultSearchRoomDirect.jsp"%>
				</c:if> --%>
				<c:if test="${userClickBookingRoomcc==true }">
					<%@include file="formBookingDirect.jsp"%>
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
<!-- FastClick -->
<script src="${js }/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${js }/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="${js }/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="${js }/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${js }/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="${js }/jquery.slimscroll.min.js"></script>
<script src="${js }/myapp.js"></script>
<!-- Bootbox -->
<script src="${js }/bootbox.min.js"></script>
<!-- bootstrap time picker -->
<script src="${js }/bootstrap-timepicker.min.js"></script>
<!-- bootstrap datepicker -->
<%-- <script src="${js }/bootstrap-datepicker.min.js"></script> --%>
<script src="${js }/bootstrap-datepicker.js"></script>
<script src="${ckeditor }/ckeditor.js"></script>
<script>
	$(function () {
	    
	    CKEDITOR.replace('content')
	   
	  })
</script>
<!-- <script>
		$(function(){
			$('.datepicker').datepicker({
			      autoclose: true
			    })
		    })
		   
	</script> -->
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
