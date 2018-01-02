<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="container">
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-5">
			<img src="${img }/hotel/${hotel.name}/${hotel.code}.jpg" style=" width: 100%; height: 300px;object-fit: cover;">
			<br><br>
			<div class="row" style="margin: 5px;">
				<p><strong>Số phòng trống:</strong> ${temp }</p>
			</div>
		</div>
		<div class="col-md-6" style="border: 1px solid #F2F2F2; padding: 40px;">
			<div class="row">
				<p> <strong>Chủ Đăng kí:</strong> ${hotel.name }<br>
					<strong>Email:</strong> ${hotel.website }<br>
					<strong>Số Điện thoại:</strong> ${hotel.phone }<br>
				</p>
			</div><hr>
			<div class="row">
				<p> <strong>Home Stay ${hotel.name } tại ${hotel.city.name }</strong><br><br>
					Home Stay Happy Zone is one of the most beautiful and flexible in TP.HCM. Not only famous with
					luxurious facilities but also in friendly of humans. kkk <br>
				</p>
			</div><hr>
			<div class="row">
				<p> <strong>Địa chỉ:</strong> ${hotel.wheres }<br>
				</p>
			</div><hr>
			<div class="row">
				<p> <strong>Some rule in Home Stay:</strong><br>
					- No smoking.<br>
					- just 2 people in a room<br>
					
					
				</p>
			</div>
		</div>
	</div>
	
	<%-- <div class="row">
		<c:forEach items="${test2 }" var="test2">
			<p>${test2.nameGuest }</p>
		</c:forEach>
	</div> --%>
	
	
	<div class="row" style="margin-top: 30px">
		<h4>List Room of hotel</h4>
		
			<c:choose>
				<c:when test="${test2.size() == 0 }">
					
						
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
									<tr>
										<td>${room.name }</td>
										<td>${room.typeRoom }</td>
										<td>${room.price } / night</td>
										<td><a href="${contextRoot }/bookingRoom/${room.id }/${dateArrive}/${dateLeave}"><button
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
											<td><a href="${contextRoot }/bookingRoom/${room.id }/${dateArrive}/${dateLeave}"><button
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
	<div class="text-right">
		<a href="${contextRoot }/searchHotel"><button type="button" class="btn btn-warning">
				<span class="glyphicon glyphicon-share-alt"></span><p>Trở về</p></button></a>
	</div>
</div>
