<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="row">
	<c:if test="${not empty message }">
		<div class="col-xs-4">
			<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				${message }
			</div>
		</div>
	</c:if>
	<c:if test="${not empty messageErr }">
		<div class="col-xs-4">
			<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				${messageErr }
			</div>
		</div>
	</c:if>
</div>



	<!-- general form elements -->
	<div class="box box-success">

		<!-- /.box-header -->
		<!-- form start -->
		<sf:form role="form" modelAttribute="hotel" action="${contextRoot }/provider/new" method="POST" enctype="multipart/form-data" >
			<div class="row">
				<div class="col-lg-5">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Thông tin chung</h3>
						</div>
						<br>
						<div class="form-group">
							<label for="name">Tên</label> <sf:input type="text"
								class="form-control" id="name" path="name"
								placeholder="Nhập tên" />
							<sf:errors path="name" cssClass="help-block" element="em" />

						</div>
						<div class="form-group">
							<label for="file">Chọn ảnh</label>
							<sf:input type="file" id="file" path="file" />
							<sf:errors path="file" cssClass="help-block" element="em" />
						</div>
						<div class="form-group">
							<label for="cityId">Tỉnh/Thành Phố</label>
								<sf:select path="ct" items="${cities }" itemLabel="name" itemValue= "id" class="form-control"/>
						</div>
						<div class="form-group">

							
							<label for="address">Địa chỉ</label> <sf:input type="text"
								class="form-control" id="wheres" path="wheres"
								placeholder="Nhập địa chỉ" />


						</div>
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group">
									<label>Loại</label> <sf:select class="form-control" id="star" path="star">	
										<sf:option value="HomeStay">HomeStay</sf:option>
										<sf:option value="Khách Sạn">Khách Sạn</sf:option>
										<sf:option value="Nhà nghỉ">Nhà nghỉ</sf:option>
									</sf:select>
								</div>
							</div>
							<div class="col-lg-5">
								<div class="form-group">
									<label>Thời gian hoạt động</label> <sf:select class="form-control" id="timeOperate" path= "timeOperate">
										<sf:option value="24/7">24/7</sf:option>
										<sf:option value="Giờ hành chính">Giờ hành chính</sf:option>
										
									</sf:select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="website">Website (nếu có)</label> <sf:input type="text"
								class="form-control" id="website" path="website" placeholder="nhập địa chỉ website"/>
								<sf:errors path="website" cssClass="help-block" element="em" />
						</div>
						<div class="form-group">
							<label for="phone">SĐT liên hệ</label> <sf:input type="text"
								class="form-control" id="phone"  path="phone" placeholder="Nhập SĐT"/>
								<sf:errors path="phone" cssClass="help-block" element="em" />
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<div class="col-lg-5">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Chính sách và thanh toán</h3>
						</div>
						<br>
						<div class="form-group">

							<label>Phương thức thanh toán</label>
							<p class="help-block">Tôi có thể thanh toán bằng thẻ tín dụng?</p>
							<sf:select class="form-control" id="payment" path="payment">
								<sf:option value="Thẻ tín dụng">Có thể</sf:option>
								<sf:option value="Thanh toán trực tiếp">Không, thanh toán trực tiếp</sf:option>

							</sf:select>

						</div>
						<div class="form-group">

							<label>Chính sách hủy/trả phòng</label>
							<p class="help-block">Tôi có thể hủy đặt phòng trong thời gian bao lâu và chi phí như thế nào?</p>
							<sf:select class="form-control" id="cancel" path="cancel">
								<sf:option value="Miễn phí, 24h sau khi đặt">Miễn phí, 24h sau khi đặt</sf:option>
								<sf:option value="Trả 10% phí của hóa đơn">Trả 10% phí của hóa đơn</sf:option>
								<sf:option value="Miễn phí, 24h trước ngày nhận phòng">Miễn phí, 24h trước ngày nhận phòng</sf:option>
								<sf:option value="Miễn phí, 48 giờ trước khi nhận phòng">Miễn phí, 48 giờ trước khi nhận phòng</sf:option>
								<sf:option value=" Trả 100% phí của ngày đầu tiên">Trả 100% phí của ngày đầu tiên</sf:option>
								<sf:option value="Trả 50% phí của hóa đơn">Trả 50% phí của hóa đơn</sf:option>
							</sf:select>
					
						</div>
					</div>

					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Giới thiệu về chỗ ở của bạn</h3>
						</div>
						<br>
						<div class="form-group">
							<sf:textarea class="form-control" id="description" path="description"
								rows="9"></sf:textarea>
							<p class="help-block">Sơ lược nổi bật...</p>
							<sf:errors path="description" cssClass="help-block" element="em" />
	
						</div>
	
					</div>

			</div>
				
			</div>
			<div class="row">
				<div class="col-lg-11">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Thông tin Chi tiết</h3>
						</div>
						<br>
						<div class="row">
							<div class="col-lg-3">
								<div class="form-group">
									<label>Internet</label>
									<p class="help-block">Có Internet hay không?</p>
									<sf:select class="form-control" id="internet" path="internet">
										<sf:option value="miễn phí">có, miễn phí</sf:option>
										<sf:option value="trả phí">có, trả phí</sf:option>
										<sf:option value="Không">Không</sf:option>
									</sf:select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label>Khu vực đậu xe</label>
									<p class="help-block">Có bãi đậu xe không?</p>
									<sf:select class="form-control" id="parking" path="parking">
										<sf:option value="miễn phí">Có, miễn phí</sf:option>
										<sf:option value="trả phí">Có, trả phí</sf:option>
										<sf:option value="Không">Không</sf:option>
									</sf:select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label>Bữa ăn</label>
									<p class="help-block">Có bao gồm phục vụ bữa ăn không?</p>
									<sf:select class="form-control" id="breakfast" path="breakfast">
										<sf:option value="Không đi kèm">Không</sf:option>
										<sf:option value="Đã đi kèm với giá phòng">Có, đã bao gồm trong giá phòng</sf:option>
										<sf:option value="Tự chọn và trả theo nhu cầu">Có, tự chọn và trả theo nhu cầu</sf:option>
									</sf:select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group">
									<label>Trẻ nhỏ</label>
									<p class="help-block">Có chính sách khác dành cho trẻ nhỏ không?</p>
									<sf:select class="form-control" id="children" path="children">
										<sf:option value="Không áp dụng">Không</sf:option>
										<sf:option value="Trẻ em dưới 8 tuổi sẽ được miễn phí">Có, trẻ em dưới 8 tuổi sẽ được miễn phí</sf:option>

									</sf:select>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Thú nuôi</label>
									<p class="help-block">Có cung cấp dịch vụ dành cho thú nuôi mang theo?</p>
									<sf:select class="form-control" id="pet" path="pet">
										<sf:option value="Không có dịch vụ">Không</sf:option>
										<sf:option value="Tùy theo yêu cầu của khách">Tùy vào yêu cầu của khách</sf:option>

									</sf:select>
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
			<input type="submit" name="submit" id="submit" value="Lưu" class="btn btn-primary"/>
			<sf:hidden path="id" />
			<sf:hidden path="code" />
			<sf:hidden path="active" />
			<sf:input type="hidden" path="pr" value="${userModel.id}"/>
			<a href="${contextRoot }/provider/new"><button
						type="button" class="btn btn-warning">Hủy</button></a>
		</div>
		</sf:form>
	</div>

