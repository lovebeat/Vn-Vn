<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">Chỉnh sửa thông tin phòng</h3>
	</div>
	<!-- /.box-header -->
	<!-- form start -->

	<sf:form role="form" modelAttribute="addRoom"
		action="${contextRoot }/provider/addRoom" method="POST">
		<div class="box-body">
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="name">Tên phòng</label>
						<sf:input type="text" class="form-control" id="name" path="name"
							placeholder="nhập tên phòng" />


					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="phone">Giá phòng/ngày</label>
						<sf:input type="number" class="form-control" id="price"
							path="price" placeholder="" />

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="typeRoom">Loại phòng</label> <sf:select
							class="form-control" id="typeRoom" path="typeRoom">
							<sf:option value="Đơn">Phòng đơn</sf:option>
							<sf:option value="Đôi">Phòng đôi</sf:option>
						</sf:select>

					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="submit" name="submit" id="submit" value="Lưu"
					class="btn btn-success" />
				<sf:hidden path="status" />
				<sf:hidden path="active" />
				<sf:hidden path="id" />
				<sf:hidden path="hotel.id" />
				<sf:hidden path="city.id" />
				<a href="${contextRoot }/provider/${addRoom.hotel.id }/detailRooms"><button
						type="button" class="btn btn-warning">Trở về</button></a>
			</div>

		</div>
	</sf:form>
</div>

