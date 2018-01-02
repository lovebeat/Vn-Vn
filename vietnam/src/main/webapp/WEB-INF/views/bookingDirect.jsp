
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="box">
	<div class="box-body">
		<div class="row">
			<sf:form role="form" modelAttribute="hotel"
				action="${contextRoot }/provider/${hotel.id}/bookingRoomDirect">
				<div class="col-md-11">
					<div class="col-md-5">
						<div class="form-group">
							<label>Ngày nhận phòng</label>

							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right " required
									id="timeCheckIn" name="dateArrive" />

							</div>

						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label>Ngày trả</label>

							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text"
									class="form-control pull-right
						"
									id="timeCheckOut" name="dateLeave" />
							</div>

						</div>
					</div>
				</div>

				<div class="col-md-11">
					<div class="input-group" style="margin-top: 25px; margin-left: 20px;">

						<input type="submit" name="submit" id="submit" value="Tìm kiếm"
							class="btn btn-success" />
						<a href="${contextRoot }/provider/${hotel.id }/detailRooms"><button
						type="button" class="btn btn-warning">Trở về</button></a>
					</div>
				</div>

			</sf:form>
		</div>
		
		<div class="col-md-11">
			<%@include file="resultSearchRoomDirect.jsp"%>
		</div>
		<div class="col-md-11 text-right">
			
		</div>
	</div>
</div>

