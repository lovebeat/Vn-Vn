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
		<h3 class="box-title">Settup some field for it</h3>
	</div>
	<!-- /.box-header -->
	<!-- form start -->
	<sf:form role="form" modelAttribute="city" action="${contextRoot }/manage/cities" method="POST" enctype="multipart/form-data" >
		<div class="box-body">
			<div class="form-group">
				<label for="name">Name </label> <sf:input
					type="text" class="form-control" id="name" path="name"
					placeholder="Enter name"/>
					<sf:errors path="name" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="file">Select an image</label> <sf:input type="file"
					id="file" path="file"/>
				<sf:errors path="file" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="description">Description</label> <sf:textarea
					class="form-control" id="description" path="description" 
					rows="2" ></sf:textarea>
					<p class="help-block">Enter some description...</p>
					<sf:errors path="description" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="content">Content</label> <sf:textarea
					class="form-control" id="content" path="content" 
					rows="20" ></sf:textarea>
					<p class="help-block">Content of article...</p>
					<%-- <sf:errors path="content" cssClass="help-block" element="em" /> --%>
			</div>
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-primary"/>
			<sf:hidden path="id" />
			<sf:hidden path="code" />
			<sf:hidden path="active" />
		</div>
	</sf:form>
</div>
<!-- /.box -->



<div class="box">
            <div class="box-header">
              <h3 class="box-title">List of available Cities</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="adminCityTable" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Id</th>
                  <th>Name</th>
                  <th>Image</th>
                  <th>Description</th>
                  
                  <th>Active</th>
                  <th>Edit</th>
                </tr>
                </thead>
                
              </table>
            </div>
            <!-- /.box-body -->
          </div>