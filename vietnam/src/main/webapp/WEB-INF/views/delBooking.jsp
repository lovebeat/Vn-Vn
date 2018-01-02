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
<br><div class="container">
<div class="col-md-6 col-md-offset-3" style="border: 1px solid #d7dfe8; background-color: #f9fbfc;">
	
		<h3 class="text-center">Chi tiết đặt phòng</h3>
		<p class="" style="padding-left: 20px;"><strong>Khách sạn: </strong>${booking.hotel.name }</p>
		<div class="hrs" style="margin-left: 20px; margin-right: 20px;">
			<div class="row">
				<div>
					<hr style="margin: 20px 0px; border: 1px solid #ff0000;">
				</div>
			</div>
		</div>
		<div class="row" style="margin:30px;" >
			<p><strong>Tên khách hàng: </strong>${booking.nameGuest }</p>
			<p><strong>Địa chỉ: </strong> ${booking.addressGuest }</p>
			<p><strong>Số điên thoại liên hệ: </strong>${booking.phoneGuest }</p>
			
			<p><strong>Phòng: </strong>${booking.room.name }</p>
			<p><strong>Loại phòng: </strong>${booking.room.typeRoom }</p>
			<p><strong>Giá: </strong>${booking.room.price } / ngày</p>
			<p><strong>Ngày đến: </strong>${booking.dateArrive }</p>
			<p><strong>Ngày đi: </strong>${booking.dateLeave }</p>
			<p><strong>Tổng tiền: </strong></p>
		</div>
		<div class="row text-right" style="margin-right: 30px; margin-bottom:30px;">
			<a style="margin-right: 20px;" href="${contextRoot }/provider/endBooking/${booking.id}"><button type="button" class="btn btn-success">
				<span class="glyphicon glyphicon-open"></span><p>Trả phòng</p>
			</button></a>
			
			<a href="${contextRoot }/provider/${booking.hotel.id }/detailRooms"><button type="button" class="btn btn-warning">
				<span class="glyphicon glyphicon-share-alt"></span><p>Quay lại</p>
			</button></a>
		</div>
</div>


</div>