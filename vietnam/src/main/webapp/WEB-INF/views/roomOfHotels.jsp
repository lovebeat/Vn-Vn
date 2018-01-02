<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

	
<div class="box box-success">


	<div class="box-body">
		<div class="box-header with-border">
			<h3 class="box-title">Thông tin Home Stay</h3>
		</div>
		<br>
		<div class="form-group">
			<p>
				<strong>Tên Name Stay: </strong>${hotel.name }
				<br><strong>Loại: </strong> ${hotel.star }<br>
				<strong>Thông tin liên hệ: </strong>${hotel.phone }<br>
				<script>
					window.hotelId = '${hotel.id}';
					
				</script>
				
				<strong>Tổng số phòng: ${total }</strong>
			</p>
			<div class="row">
				<div class="col-lg-12">
					<div class="text-right">
						<a href="${contextRoot }/provider/${hotel.id }/bookingRoomDirect"><button
						type="button" class="btn btn-md btn-success">Đặt phòng</button></a>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<div class="box box-primary">
	<div class="box-header with-border" data-widget="collapse">
		<h3 class="box-title">Danh sách phòng</h3>

		<div class="box-tools pull-right">
			<button type="button" class="btn btn-box-tool" >
				<i class="fa fa-minus "></i>
			</button>
		</div>
		<!-- /.box-tools -->
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		
		
	<div class="row">
		<div class="col-lg-12">
			<div class="text-right">
				<button type="button" data-toggle="modal" data-target="#addRoom" onclick=""
					class="btn btn-warning btn-md">
					Thêm phòng
				</button>
			</div>
		</div>
	</div>
		<br>
		<table id="roomsTotalsss" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Tên Phòng</th>
					<th>Loại phòng</th>
					<th>Giá</th>
					<th>Trạng thái</th>
					<th>Chỉnh sửa</th>
				</tr>
			</thead>

		</table>
		
		
	</div>
	<!-- /.box-body -->
</div>


<div class="box box-danger">
	<div class="box-header with-border" data-widget="collapse">
		<h3 class="box-title">Thông tin đặt phòng</h3>

		<div class="box-tools pull-right">
			<button type="button" class="btn btn-box-tool" >
				<i class="fa fa-minus "></i>
			</button>
		</div>
		<!-- /.box-tools -->
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<table id="detailBookings" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Tên Khách hàng</th>
					<th>Địa chỉ</th>
					<th>Số điện thoại</th>
					<th>Phòng</th>
					<th>Ngày đến</th>
					<th>Ngày đi</th>
					<th>Trả Phòng</th>
					<th>Gia hạn</th>
				</tr>
			</thead>

		</table>
	</div>
</div>






<!-- dialog add room -->
<div class="modal fade" id="addRoom" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">Thêm phòng</h4>
			</div>
			<div class="modal-body">
				<!-- Modal form -->

				<sf:form role="form" modelAttribute="addRoom"
					action="${contextRoot }/provider/addRoom" method="POST">
					<div class="form-group">
						<label for="name">Tên phòng</label>
						<sf:input type="text" class="form-control" id="name"
							path="name" placeholder="nhập tên phòng" required="required"/>
							<sf:errors path="name" cssClass="help-block" element="em" />

					</div>
					
					<div class="form-group">
						<label for="phone">Giá phòng/ngày</label>
						<sf:input type="number" class="form-control" id="price"
							path="price" placeholder="" />
							<sf:errors path="price" cssClass="help-block" element="em" />

					</div>
					
					<div class="form-group">
						<label for="typeRoom">Loại phòng</label>
						<sf:select class="form-control" id="typeRoom" path="typeRoom">
										<option value="Phòng đơn">Phòng đơn</option>
										<option value="Phòng đôi">Phòng đôi</option>
									</sf:select>

					</div>
					
					<div class="form-group">
						<input type="submit" name="submit" id="submit" value="Thêm"
							class="btn btn-success" />
						<sf:hidden path="active" />
						<sf:hidden path="id" />
						<sf:hidden path="hotel.id" id="idHt" value="${hotel.id }"/>
						<sf:hidden path="city.id" id="idct" value="${hotel.city.id }"/>
					</div>


				</sf:form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>

</div>