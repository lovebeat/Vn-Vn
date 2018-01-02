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
<div class="container" >
<div class="col-md-8 col-md-offset-2" style="border: 1px solid #0000ff;">
<div class="row " style="margin-left: 30px">
	
		<h3 class="text-center">Thông tin đặt phòng</h3>
		<div class="row text-center"><p><strong>Khách sạn: </strong>${infRoom.hotel.name }</p></div><br>
		<div class="row">
			<div class="col-md-3"><p><strong>Phòng: </strong> ${infRoom.name }</p></div>
			<div class="col-md-3"><p><strong>Loại phòng: </strong> ${infRoom.typeRoom }</p></div>
			<div class="col-md-3"><p><strong>Giá: </strong> ${infRoom.price } / ngày</p></div>
		</div>
	
	
</div>
<hr>
<div class="" style="margin: 30px;">
<sf:form role="form" modelAttribute="bookingRoom"
	action="${contextRoot }/provider/${infRoom.hotel.id }/bookingRoomDirect/${infRoom.id }/${dateArrs }/${dateLeas }" method="POST">
	<div class="form-group">
		<label for="name">Tên khách hàng</label>
		<sf:input type="" class="form-control" id="nameGuest"
			path="nameGuest" placeholder="nhập tên" />


	</div>
	<div class="form-group">
		<label>Ngày nhận phòng</label>

		<div class="input-group">
			<span class="input-group-addon">
				<i class="glyphicon glyphicon-calendar"></i>
			</span>
			<sf:input type="" readonly="true" class="form-control pull-right"
				id="timeCheckIn" path="dateArrive" value="${dateArr }"/>

		</div>

	</div>
				<div class="form-group">
					<label>Ngày trả</label>

					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-calendar"></i>
						</span>
						<sf:input type="" readonly="true"
							class="form-control pull-right
						" id="timeCheckOut"
							path="dateLeave" value="${dateLea }" />
					</div>


				</div>
	<div class="form-group">
		<label for="address">Địa chỉ</label>
		<sf:input type="" class="form-control" id="addressGuest"
			path="addressGuest" placeholder="nhập địa chỉ" />


	</div>
	<div class="form-group">
		<label for="phone">Số điện thoại</label>
		<sf:input type="" class="form-control" id="phoneGuest"
			path="phoneGuest" placeholder="nhập SĐT liên hệ" />

	</div>
	
	




				<div class="form-group">
		<input type="submit" name="submit" id="submit" value="Đặt phòng"
			class="btn btn-success" />
		<sf:hidden path="ro" value="${infRoom.id }" />
		<sf:hidden path="active" />
		<sf:hidden path="id" />
		<sf:hidden path="ht" value="${infRoom.hotel.id }" />
		<sf:hidden path="ct" value="${infRoom.city.id }"/>
		<a href="${contextRoot }/provider/${infRoom.hotel.id }/bookingRoomDirect"><button
						type="button" class="btn btn-warning">Quay lại</button></a>
	</div>


</sf:form>

</div>

</div>

</div>