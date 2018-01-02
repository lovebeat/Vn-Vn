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
		<h3 class="box-title">Chọn ảnh để làm banner</h3>

		<div class="box-tools pull-right">
			<button type="button" class="btn btn-box-tool">
				<i class="fa fa-minus "></i>
			</button>
		</div>
		<!-- /.box-tools -->
	</div>
	<!-- form start -->
	<sf:form role="form" modelAttribute="banner" action="${contextRoot }/manage/banner" method="POST" enctype="multipart/form-data" >
		<div class="box-body">
			
			<div class="form-group">
				<label for="file">Chọn ảnh</label> <sf:input type="file"
					id="file" path="file"/>
				<sf:errors path="file" cssClass="help-block" element="em" />
			</div>
		</div>

		<div class="box-footer">
			<input type="submit" name="submit" id="submit" value="Lưu" class="btn btn-primary"/>
			<sf:hidden path="id" />
			<sf:hidden path="code" />
			<sf:hidden path="active" />
			<a href="${contextRoot }/manage/banner"><button
						type="button" class="btn btn-warning">Hủy</button></a>
		</div>
	</sf:form>
</div>
<!-- /.box -->



<div class="box box-danger">
	<div class="box-header with-border" data-widget="collapse">
		<h3 class="box-title">Danh sách các banner</h3>

		<div class="box-tools pull-right">
			<button type="button" class="btn btn-box-tool">
				<i class="fa fa-minus "></i>
			</button>
		</div>
		<!-- /.box-tools -->
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<table id="adminBannerTable"
			class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Hình ảnh</th>
					<th>Trạng thái</th>
				</tr>
			</thead>

		</table>
	</div>
	<!-- /.box-body -->
</div>