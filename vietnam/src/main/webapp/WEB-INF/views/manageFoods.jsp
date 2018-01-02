<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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

<!-- form -->
<div class="box box-success">
	<div class="box-header with-border" data-widget="collapse">
		<h3 class="box-title">Nhập thông tin</h3>

		<div class="box-tools pull-right">
			<button type="button" class="btn btn-box-tool">
				<i class="fa fa-minus "></i>
			</button>
		</div>
		<!-- /.box-tools -->
	</div>
	<!-- form start -->
	<sf:form role="form" modelAttribute="food"
		action="${contextRoot }/manage/foods" method="POST"
		enctype="multipart/form-data">
		<div class="box-body">
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="name">Tên món ăn/Địa điểm ăn uống</label>
						<sf:input type="text" class="form-control" id="name" path="name"
							placeholder="Nhập tên" />
						<sf:errors path="name" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="cityId">Thuộc tỉnh/t. phố</label>
						<sf:select path="ct" items="${cities }" itemLabel="name"
							itemValue="id" class="form-control" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<div class="text-right">
							<button type="button" data-toggle="modal"
								data-target="#myCityModal" class="btn btn-warning btn-xs">Thêm tỉnh</button>
						</div>
					</div>
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="file">Chọn ảnh</label>
						<sf:input type="file" id="file" path="file" />
						<sf:errors path="file" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="address">Địa chỉ</label>
						<sf:input type="text" class="form-control" id="address"
							path="address" placeholder="Nhập địa chỉ" />
						<sf:errors path="address" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="description">Mô tả</label>
						<sf:textarea class="form-control" id="description"
							path="description" rows="2"></sf:textarea>
						<p class="help-block">Sơ lược nổi bật...</p>
						<sf:errors path="description" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="content">Bài viết</label>
						<sf:textarea class="form-control" id="content" path="content"
							rows="30"></sf:textarea>
						<p class="help-block">Nội dung bài viết...</p>
						<%-- <sf:errors path="content" cssClass="help-block" element="em" /> --%>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="priceMin">Giá từ</label>
						<sf:input type="number" class="form-control" id="priceMin"
							path="priceMin" placeholder="" />
						<sf:errors path="priceMin" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="priceMax">Đến</label>
						<sf:input type="number" class="form-control" id="priceMax"
							path="priceMax" placeholder="" />
						<sf:errors path="priceMax" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="bootstrap-timepicker">
						<div class="form-group">
							<label for="hoursOpen">Giờ mở cửa, Từ</label>

							<div class="input-group">
								<sf:input type="text" class="form-control timepicker"
									id="hoursOpen" path="hoursOpen" />

								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
							</div>
							<!-- /.input group -->
						</div>
						<!-- /.form group -->
					</div>
				</div>
				<div class="col-md-4">
					<div class="bootstrap-timepicker">
						<div class="form-group">
							<label for="hoursClose">Đến</label>

							<div class="input-group">
								<sf:input type="text" class="form-control timepicker"
									id="hoursClose" path="hoursClose" />

								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
							</div>
							<!-- /.input group -->
						</div>
						<!-- /.form group -->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="contact">Liên hệ</label>
						<sf:input type="text" class="form-control" id="contact"
							path="contact" placeholder="Nhập thông tin để liên hệ" />
						<sf:errors path="contact" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>

		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<input type="submit" name="submit" id="submit" value="Lưu"
				class="btn btn-primary" />
			<sf:hidden path="id" />
			<sf:hidden path="code" />
			<sf:hidden path="active" />
			<a href="${contextRoot }/manage/foods"><button
						type="button" class="btn btn-warning">Hủy</button></a>

		</div>
	</sf:form>
</div>
<!-- /.box -->



<div class="box box-danger">
	<div class="box-header with-border" data-widget="collapse">
		<h3 class="box-title">Danh sách ẩm thực</h3>

		<div class="box-tools pull-right">
			<button type="button" class="btn btn-box-tool">
				<i class="fa fa-minus "></i>
			</button>
		</div>
		<!-- /.box-tools -->
	</div>
	<div class="box-body">
		<table id="adminFoodTable" class="table table-bordered table-striped">
			<thead>
				<tr>
					<!-- <th>Id</th> -->
					<th>Tên</th>
					<th>Tỉnh</th>
					<!-- <th>Place</th> -->
					<th>Hình ảnh</th>

					<th>Địa chỉ</th>
					<th>Giá từ</th>
					<th>Đến</th>
					<th>Giờ mở cửa</th>
					<th>Giờ đóng cửa</th>
					<th>Liên hệ</th>
					<th>Trạng thái</th>
					<th>Sửa</th>
				</tr>
			</thead>

		</table>
	</div>
	<!-- /.box-body -->
</div>


<!-- dialog add new city in food pages if it don't exist -->
<div class="modal fade" id="myCityModal" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">Thêm tỉnh/T. phố</h4>
			</div>
			<div class="modal-body">
				<!-- Modal form -->
				<sf:form role="form" modelAttribute="city"
					action="${contextRoot }/manage/city" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="name">Tên tỉnh / T.phố</label>
						<sf:input type="text" class="form-control" id="name" path="name"
							placeholder="Nhập tên" />
						<sf:errors path="name" cssClass="help-block" element="em" />
					</div>

					<div class="form-group">
						<label for="file">Chọn ảnh</label>
						<sf:input type="file" id="file" path="file" />
						<sf:errors path="file" cssClass="help-block" element="em" />
					</div>
					<div class="form-group">
						<label for="description">Mô tả</label>
						<sf:textarea class="form-control" id="description"
							path="description" rows="1"></sf:textarea>
						<p class="help-block">Sơ lược nổi bật...</p>
						<sf:errors path="description" cssClass="help-block" element="em" />
					</div>
					<div class="form-group">
						<label for="content">Bài viết</label>
						<sf:textarea class="form-control" id="content" path="content"
							rows="9"></sf:textarea>
						<p class="help-block">Nội dung bài viết...</p>
						<%-- <sf:errors path="content" cssClass="help-block" element="em" /> --%>
					</div>

					<div class="form-group">
						<input type="submit" name="submit" id="submit" value="Lưu"
							class="btn btn-primary" />
						<sf:hidden path="id" />
						<sf:hidden path="code" />
						<sf:hidden path="active" />
					</div>
				</sf:form>
			</div>
		</div>
	</div>

</div>
