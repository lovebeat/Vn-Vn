<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="row">
	<c:if test="${not empty message }">
		<div class="col-xs-12">
			<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				${message }
			</div>
		</div>
	</c:if>
</div>

<div class="box">
<div class="box-body">
<div class="col-md-9 col-md-offset-1" style="border: 1px solid #d7dfe8; background-color: #f9fbfc;padding: 20px;">
	
		<h3>Thông tin phòng</h3>
		<%-- <c:forEach items="${cc}" var="cc">
		<p>${cc }</p>
		</c:forEach> --%>
		<p><strong>Khách sạn: </strong>${booking.hotel.name }</p>
		<div class="hrs" style="margin-left: 20px; margin-right: 20px;">
			<div class="row">
				<div>
					<hr style="margin: 20px 0px; border: 1px solid #ff0000;">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"><p><strong>Phòng: </strong>${booking.room.name }</p></div>
			<div class="col-md-3"><p><strong>Loại phòng: </strong>${booking.room.typeRoom }</p></div>
			<div class="col-md-3"><p><strong>Giá: </strong>${booking.room.price } / ngày</p></div>
		</div>
		<div class="row">
			<div class="col-md-3"><p><strong>Ngày đến: </strong>${booking.getDateArrString() }</p></div>
			<div class="col-md-3"><p><strong>Ngày đi: </strong>${booking.getDateLeaString() }</p></div>
		</div>
		
		
	</div>	
</div>
</div>
<div class="box box-primary">
<sf:form role="form" modelAttribute="booking"
	action="${contextRoot }/provider/detailInfBooking/${booking.id }" method="POST">
	<div class="box-body">
	<div class="col-md-11" style="margin-top: 20px;">
	<div class="form-group">
		<label for="name">Tên khách hàng</label>
		<sf:input type="text" class="form-control" id="nameGuest" 
			path="nameGuest" placeholder="nhập tên" />


	</div>
	</div>
	<div class="col-md-11">
	<div class="form-group">
		<label>Ngày nhận phòng</label>

		<div class="input-group date">
			<div class="input-group-addon">
				<i class="fa fa-calendar"></i>
			</div>
			<sf:input type="text" class="form-control pull-right"
				id="timeCheckIn" path="dateArrive" />

		</div>

	</div>
	</div>
	<div class="col-md-11">
	<div class="form-group">
		<label>Ngày trả</label>

		<div class="input-group date">
			<div class="input-group-addon">
				<i class="fa fa-calendar"></i>
			</div>
			<sf:input type="text"
				class="form-control pull-right
						" id="timeCheckOut"
				path="dateLeave" />
		</div>

	</div>
	</div>
	<div class="col-md-11">
	<div class="form-group">
		<label for="address">Địa chỉ</label>
		<sf:input type="text" class="form-control" id="addressGuest"
			path="addressGuest" placeholder="nhập địa chỉ" />


	</div>
	</div>
	<div class="col-md-11">
	<div class="form-group">
		<label for="phone">Số điện thoại</label>
		<sf:input type="text" class="form-control" id="phoneGuest"
			path="phoneGuest" placeholder="nhập SĐT liên hệ" />

	</div>
	</div>
	


<div class="col-md-11">
	<div class="form-group">
		<input type="submit" name="submit" id="submit" value="Cập nhật"
			class="btn btn-success" />
		
		<sf:hidden path="active" />
		<sf:hidden path="id" />
		
		<a href="${contextRoot }/provider/${booking.hotel.id }/detailRooms"><button
						type="button" class="btn btn-warning">Trở về</button></a>
	</div>
</div>
</div>
</sf:form>
</div>

