<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

	
<div class="box box-primary">


	<div class="box-body">
		<div class="box-header with-border">
			<h3 class="box-title">Thông tin Home Stay</h3>
		</div>
		<br>
		<div class="form-group">
			<p>
				Tên Name Stay: ${hotel.name }<br> Loại: ${hotel.star }<br>
				Thông tin liên hệ: ${hotel.phone }<br>

			</p>
		</div>

	</div>
</div>
<div class="box">

	<!-- /.box-header -->
	<!-- form start -->

	<div class="row">
		<div class="col-lg-10">
			<div class="box-body">
				<div class="box-header with-border">
					<h3 class="box-title">Danh sách phòng của Home Stay</h3>
				</div>
				<br>
				<c:forEach items="${ listRoom}" var="room">
					<div class="col-lg-2"
						style="border: 1px solid; margin-left: 20px; margin-bottom: 20px; float: left">
						<div class="room" id="" style="padding-left: 20px;">
							<div class="row">
								<p>Phòng ${room.name }</p>
							</div>
							
						</div>
					

					</div>

				</c:forEach>
			</div>
		</div>
	</div>


</div>