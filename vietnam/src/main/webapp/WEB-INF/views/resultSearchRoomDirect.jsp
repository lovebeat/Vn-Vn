
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
	
	<c:choose>
		<c:when test="${test2.size() == 0 }">


			<table class=" table table-responsive table-striped">
				<thead>
					<tr>
						<th>Tên Phòng</th>
						<th>Loại Phòng</th>
						<th>Giá Phòng</th>
						<th>Đặt phòng</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${room }" var="room">
						<tr>
							<td>${room.name }</td>
							<td>${room.typeRoom }</td>
							<td>${room.price }/ night</td>
							<td><a
								href="${contextRoot }/provider/${room.hotel.id }/bookingRoomDirect/${room.id }/${datearrive}/${dateleave}"><button
										type="button" class="btn btn-success">
										<span class="glyphicon glyphicon-hand-down"></span>
									</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>



		</c:when>

		<c:when test="${test2.size() != 0 }">
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
					<c:forEach items="${room }" var="room">
						<c:forEach items="${test2 }" var="t">
							<c:choose>
								<c:when test="${!room.id.equals(t.room.id) }">

									<tr>
										<td>${room.name }</td>
										<td>${room.typeRoom }</td>
										<td>${room.price }/night</td>
										<td><a
											href="${contextRoot }/provider/${room.hotel.id }/bookingRoomDirect/${room.id }/${datearrive}/${dateleave}"><button
													type="button" class="btn btn-success">
													<span class="glyphicon glyphicon-hand-down"></span>
												</button></a></td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>

		</c:when>
	</c:choose>

</div>