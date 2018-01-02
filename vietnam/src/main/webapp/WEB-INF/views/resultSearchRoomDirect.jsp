
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<div class="hrs" style="margin-left: 20px; margin-right: 20px;">
		<div class="row">
			<div>
				<hr style="margin: 20px 0px; border: 1px solid #ff0000;">
			</div>
		</div>
	</div>
<div class="row" style="margin-left: 30px">
	<h4>Các phòng còn trống</h4>
	
	<table class=" table table-responsive">
			<thead>
				<tr>
					<th>Tên Phòng</th>
					<th>Loại Phòng</th>
					<th>Giá Phòng</th>
					<th>Đặt phòng</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${roomEmptysss }" var="roomsss">
					<tr>
						<td>${roomsss.name }</td>
						<td>${roomsss.typeRoom }</td>
						<td>${roomsss.price }/ night</td>
						<td><a
							href="${contextRoot }/provider/${roomsss.hotel.id }/bookingRoomDirect/${roomsss.id }/${datearrive}/${dateleave}"><button
									type="button" class="btn btn-success">
									<span class="glyphicon glyphicon-hand-down"></span>
								</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

</div>