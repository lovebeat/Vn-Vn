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
			<button type="button" class="btn btn-box-tool" >
				<i class="fa fa-minus "></i>
			</button>
		</div>
		<!-- /.box-tools -->
	</div>
	<!-- form start -->
	<sf:form role="form" modelAttribute="place" action="${contextRoot }/manage/places" method="POST" enctype="multipart/form-data" >
		<div class="box-body">
			<div class="form-group">
				<label for="name">Tên địa điểm</label> <sf:input
					type="text" class="form-control" id="name" path="name"
					placeholder="nhập tên"/>
					<sf:errors path="name" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="cityId">Thuộc tỉnh/t. phố</label>
					<sf:select path="ct"  items="${cities }" itemLabel="name" itemValue= "id" class="form-control"/>
			</div>
			<div class="form-group">
				
					<div class="text-right">
						
						<button type="button" data-toggle="modal" data-target="#myCityModal" class="btn btn-warning btn-xs">Thêm tỉnh</button>
					</div>
				
			</div>
			<div class="form-group">
				<label for="file">Chọn ảnh</label> <sf:input type="file"
					id="file" path="file"/>
				<sf:errors path="file" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="description">Mô tả</label> <sf:textarea
					class="form-control" id="description" path="description" 
					rows="2" ></sf:textarea>
					<p class="help-block">Sơ lược nổi bật về địa điểm...</p>
					<sf:errors path="description" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="content">Bài viết</label> <sf:textarea
					class="form-control" id="content" path="content" 
					rows="30" ></sf:textarea>
					<p class="help-block">Nội dung bài viết...</p>
					<%-- <sf:errors path="content" cssClass="help-block" element="em" /> --%>
			</div>
			
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<input type="submit" name="submit" id="submit" value="Lưu" class="btn btn-primary"/>
			<sf:hidden path="id" />
			<sf:hidden path="code" />
			<sf:hidden path="active" />
			<a href="${contextRoot }/manage/places"><button
						type="button" class="btn btn-warning">Hủy</button></a>
		</div>
	</sf:form>
</div>
<!-- /.box -->



<div class="box box-danger">
	<div class="box-header with-border" data-widget="collapse">
		<h3 class="box-title">Danh sách các địa điểm</h3>

		<div class="box-tools pull-right">
			<button type="button" class="btn btn-box-tool">
				<i class="fa fa-minus "></i>
			</button>
		</div>
		<!-- /.box-tools -->
	</div>
	<div class="box-body">
		<table id="adminPlaceTable" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Tên địa điểm</th>
					<th>Địa chỉ</th>
					<th>Hình ảnh</th>
					<th>Mô tả</th>

					<th>Trạng thái</th>
					<th>Sửa</th>
				</tr>
			</thead>

		</table>
	</div>
	<!-- /.box-body -->
</div>
<!-- dialog add new city in place pages if it don't exist -->      
<div class="modal fade" id="myCityModal" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">Thêm Tỉnh/T. phố</h4>
			</div>
			<div class="modal-body">
				<!-- Modal form -->
				<sf:form role="form" modelAttribute="city" action="${contextRoot }/manage/city" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="name">Tên tỉnh/t. phố</label> 
							<sf:input type="text" class="form-control" id="name" path="name" placeholder="Nhập tên"/>
							<sf:errors path="name" cssClass="help-block" element="em" />
						</div>
						
						<div class="form-group">
							<label for="file">Chọn ảnh</label> <sf:input type="file"
								id="file" path="file"/>
								<sf:errors path="file" cssClass="help-block" element="em" />
						</div>
						<div class="form-group">
							<label for="description">Mô tả</label> <sf:textarea
								class="form-control" id="description" path="description" 
								rows="1" ></sf:textarea>
								<p class="help-block">Sơ lược nổi bật về tỉnh/ t. phố...</p>
								<sf:errors path="description" cssClass="help-block" element="em" />
						</div>
						<div class="form-group">
							<label for="content">Bài viết</label> <sf:textarea
								class="form-control" id="content" path="content" 
								rows="9" ></sf:textarea>
								<p class="help-block">Nội dung bài viết...</p>
								<%-- <sf:errors path="content" cssClass="help-block" element="em" /> --%>
						</div>	

					<div class="form-group">
						<input type="submit" name="submit" id="submit" value="Lưu" class="btn btn-primary"/>
						<sf:hidden path="id" />
						<sf:hidden path="code" />
						<sf:hidden path="active" />
						<a href="${contextRoot }/manage/places"><button
						type="button" class="btn btn-warning">Hủy</button></a>
					</div>
				</sf:form>
			</div>
		</div>
	</div>
	
</div>          
