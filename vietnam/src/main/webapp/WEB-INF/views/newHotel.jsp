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



	<!-- general form elements -->
	<div class="box box-primary">

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
								class="form-control" id="where" path="where"
								placeholder="Nhập địa chỉ" />


						</div>
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group">
									<label>Loại</label> <select class="form-control" id="star" name="star">
										<option value="N/A">N/A</option>
										<option value="1 *">1 *</option>
										<option value="2 *">2 **</option>
										<option value="3 *">3 ***</option>
										<option value="4 *">4 ****</option>
										<option value="5 *">5 *****</option>
									</select>
								</div>
							</div>
							<div class="col-lg-5">
								<div class="form-group">
									<label>Thời gian hoạt động</label> <select class="form-control" id="timeOperate" name= "timeOperate">
										<option value="24/7">24/7</option>
										<option value="time in works">Giờ hành chính</option>
										
									</select>
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
							<select class="form-control" id="payment" name="payment">
								<option value="yes">Có thể</option>
								<option value="no">Không, thanh toán trực tiếp</option>

							</select>

						</div>
						<div class="form-group">

							<label>Chính sách hủy/trả phòng</label>
							<p class="help-block">Tôi có thể hủy đặt phòng trong thời gian bao lâu và chi phí như thế nào?</p>
							<select class="form-control" id="cancel" name="cancel">
								<option value="Miễn phí, 24h sau khi đặt">Miễn phí, 24h sau khi đặt</option>
								<option value="Trả 10% phí của hóa đơn">Trả 10% phí của hóa đơn</option>
								<option value="Miễn phí, 24h trước ngày nhận phòng">Miễn phí, 24h trước ngày nhận phòng</option>
								<option value="Miễn phí, 48 giờ trước khi nhận phòng">Miễn phí, 48 giờ trước khi nhận phòng</option>
								<option value=" Trả 100% phí của ngày đầu tiên">Trả 100% phí của ngày đầu tiên</option>
								<option value="Trả 50% phí của hóa đơn">Trả 50% phí của hóa đơn</option>
							</select>
							

						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-11">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Thông tin Home Stay</h3>
						</div>
						<br>
						<div class="row">
							<div class="col-lg-3">
								<div class="form-group">
									<label>Internet</label>
									<p class="help-block">Có Internet hay không?</p>
									<select class="form-control" id="internet" name="internet">
										<option value="có, miễn phí">có, miễn phí</option>
										<option value="có, trả phí">có, trả phí</option>
										<option value="Không">Không</option>
									</select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label>Khu vực đậu xe</label>
									<p class="help-block">Có bãi đậu xe không?</p>
									<select class="form-control" id="parking" name="parking">
										<option value="Có, miễn phí">Có, miễn phí</option>
										<option value="Có, trả phí">Có, trả phí</option>
										<option value="Không">Không</option>
									</select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label>Bữa ăn</label>
									<p class="help-block">Có bao gồm phục vụ bữa ăn không?</p>
									<select class="form-control" id="breakfast" name="breakfast">
										<option value="no">Không</option>
										<option value="Có, đã bao gồm trong giá phòng">Có, đã bao gồm trong giá phòng</option>
										<option value="Có, tự chọn và trả theo nhu cầul">Có, tự chọn và trả theo nhu cầu</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group">
									<label>Trẻ nhỏ</label>
									<p class="help-block">Có chính sách khác dành cho trẻ nhỏ không?</p>
									<select class="form-control" id="children" name="children">
										<option value="no">Không</option>
										<option value="Có, trẻ em dưới 8 tuổi sẽ được miễn phí">Có, trẻ em dưới 8 tuổi sẽ được miễn phí</option>

									</select>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Thú nuôi</label>
									<p class="help-block">Có cho phép mang theo thú nuôi?</p>
									<select class="form-control" id="pet" name="pet">
										<option value="no">Không</option>
										<option value="upon request">Tùy vào yêu cầu của khách</option>

									</select>
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
		</div>
		</sf:form>
	</div>

