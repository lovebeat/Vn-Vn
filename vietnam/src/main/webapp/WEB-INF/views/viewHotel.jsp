<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="container">

	<!-- general form elements -->
	<div class="box box-primary">

		<!-- /.box-header -->
		<!-- form start -->
		<sf:form role="form" modelAttribute="hotel" action="${contextRoot }/manage/approveProvider" method="POST" enctype="multipart/form-data" >
			<div class="row">
				<div class="col-lg-5">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Thông tin chung</h3>
						</div>
						<br>
						<div class="form-group">
							<label for="name">Tên</label> <sf:input type="text"
								class="form-control" id="name" path="name" readonly="true" />
						</div>
						<div class="form-group">
							
							<sf:input type="file" id="file" path="file" style="display:none"/>
							
						</div>
						<div class="form-group">
							<label for="cityId">Tỉnh/Thành phố</label>
								<input type="text"
								class="form-control" value="${hotel.city.name} " readonly/>
								<sf:hidden path="ct" value="${hotel.city.id }" class="form-control"/>
						</div>
						<div class="form-group">

							
							<label for="address">Địa chỉ</label> <sf:input type="text" readonly="true"
								class="form-control" id="wheres" path="wheres" />

						</div>
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group">
									<label>Loại</label> <sf:input class="form-control" id="star" path="star" readonly="true"/>
									
								</div>
							</div>
							<div class="col-lg-5">
								<div class="form-group">
									<label>Thời gian hoạt động</label> <sf:input class="form-control" id="timeOperate" path= "timeOperate" readonly="true"/>
										
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="website">Website (nếu có)</label> <sf:input type="text" readonly="true"
								class="form-control" id="website" path="website" />
								
						</div>
						<div class="form-group">
							<label for="phone">SĐT liên hệ</label> <sf:input type="text" readonly="true"
								class="form-control" id="phone"  path="phone" />
								
						</div>
						<div class="form-group">
							<label for="name">Giới thiệu</label> <sf:textarea  readonly="true" class="form-control" id="description" path="description"
								rows="9"></sf:textarea>

						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<div class="col-lg-5">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Hình ảnh</h3>
						</div>
						<br>
						<div class="form-group">
							<div class=" " style="margin-top: 20px;">
								<img src="${images }/hotel/${hotel.name }/${hotel.code }.jpg"
									style="width: 100%; height: 300px; object-fit: cover;">
							</div>

						</div>
						<br><br>
						<div class="box-header with-border">
							<h3 class="box-title">Chính sách và thanh toán</h3>
						</div>
						<br>
						<div class="form-group">

							<label>Phương thức thanh toán</label>
							<sf:input class="form-control" id="payment" path="payment" readonly="true"/>
								
						</div>
						<div class="form-group">

							<label>Chính sách hủy/trả phòng</label>
							<sf:input class="form-control" id="cancel" path="cancel" readonly="true"/>

						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-11">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Thông tin chi tiết</h3>
						</div>
						<br>
						<div class="row">
							<div class="col-lg-3">
								<div class="form-group">
									<label>Internet</label>
									<sf:input class="form-control" id="internet" path="internet" readonly="true"/>
									
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label>Khu vực đậu xe</label>
									<sf:input class="form-control" id="parking" path="parking" readonly="true"/>
										
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label>Bữa ăn</label>
									<sf:input class="form-control" id="breakfast" path="breakfast" readonly="true"/>
										
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group">
									<label>Trẻ nhỏ</label>
									<sf:input class="form-control" id="children" path="children" readonly="true"/>
										
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Thú nuôi</label>
									<sf:input class="form-control" id="pet" path="pet" readonly="true"/>
										
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		<div class="row">
				<div class="col-lg-11">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Các dịch vụ và hoạt động khác được cung cấp</h3>
						</div>
						<br>
						<div class="form-group">
							<p class="help-block">Các hoạt động và dịch vụ mà chúng tôi có cung cấp trong quá trình ở tại đây</p>

						</div>
					</div>
				</div>
				
			</div>
			<div class="box-footer">
			<input type="submit" name="submit" id="submit" value="Duyệt" class="btn btn-primary"/>
			<sf:hidden path="id" />
			<sf:hidden path="code" />
			<sf:hidden path="active" />
			<sf:input type="hidden" path="pr" value="${hotel.user.id }"/>
			<sf:hidden path="approve"/>
			<a href="${contextRoot }/manage/listHotelApprove"><button
						type="button" class="btn btn-warning">Trở về</button></a>
		</div>
		</sf:form>
	</div>

</div>