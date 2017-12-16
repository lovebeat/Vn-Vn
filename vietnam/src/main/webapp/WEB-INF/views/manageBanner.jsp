<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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

<!-- form -->
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">Chọn Ảnh để làm banner</h3>
	</div>
	<!-- /.box-header -->
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
		</div>
	</sf:form>
</div>
<!-- /.box -->



<div class="box">
            <div class="box-header">
              <h3 class="box-title">Danh sách các banner</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="adminBannerTable" class="table table-bordered table-striped">
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