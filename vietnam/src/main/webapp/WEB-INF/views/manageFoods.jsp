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
	<sf:form role="form" modelAttribute="food" action="${contextRoot }/manage/foods" method="POST" enctype="multipart/form-data" >
		<div class="box-body">
			<div class="form-group">
				<label for="name">Name of Food</label> <sf:input
					type="text" class="form-control" id="name" path="name"
					placeholder="Enter name of Food"/>
					<sf:errors path="name" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="cityId">City</label>
					<sf:select path="cityId" items="${cities }" itemLabel="name" itemValue="id" class="form-control"/>
					
			</div>
			<div class="form-group">
				<label for="placeId">Place</label>
					<sf:select path="placeId" items="${places }" itemLabel="name" itemValue="id" class="form-control"/>
					
			</div>
			<div class="form-group">
				<label for="file">Select an image</label> <sf:input type="file"
					id="file" path="file"/>
				<sf:errors path="file" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="address">Address of Food</label> <sf:input
					type="text" class="form-control" id="address" path="address"
					placeholder="Enter address of Food"/>
					<sf:errors path="address" cssClass="help-block" element="em" />
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
					rows="30" ></sf:textarea>
					<p class="help-block">Content of article...</p>
					<sf:errors path="content" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="priceMin">Price minimum of Food</label> <sf:input
					type="number" class="form-control" id="priceMin" path="priceMin"
					placeholder="Enter price minimum of Food"/>
					<sf:errors path="priceMin" cssClass="help-block" element="em" />
			</div>
			<div class="form-group">
				<label for="priceMax">Price maximum of Food</label> <sf:input
					type="number" class="form-control" id="priceMax" path="priceMax"
					placeholder="Enter price maximum of Food"/>
					<sf:errors path="priceMax" cssClass="help-block" element="em" />
			</div>
			<div class="bootstrap-timepicker">
                <div class="form-group">
                  <label for="hoursOpen">Hours Open</label>

                  <div class="input-group">
                    <sf:input type="text" class="form-control timepicker" id ="hoursOpen" path="hoursOpen"/>

                    <div class="input-group-addon">
                      <i class="fa fa-clock-o"></i>
                    </div>
                  </div>
                  <!-- /.input group -->
                </div>
                <!-- /.form group -->
            </div>
			<div class="bootstrap-timepicker">
                <div class="form-group">
                  <label for="hoursClose">Hours Close</label>

                  <div class="input-group">
                    <sf:input type="text" class="form-control timepicker" id ="hoursClose" path="hoursClose"/>

                    <div class="input-group-addon">
                      <i class="fa fa-clock-o"></i>
                    </div>
                  </div>
                  <!-- /.input group -->
                </div>
                <!-- /.form group -->
            </div>
			<div class="form-group">
				<label for="contact">Contact</label> <sf:input
					type="text" class="form-control" id="contact" path="contact"
					placeholder="Enter some information to contact"/>
					<sf:errors path="contact" cssClass="help-block" element="em" />
			</div>
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-primary"/>
			<sf:hidden path="id" />
			<sf:hidden path="code" />
			<sf:hidden path="active" />
			<sf:hidden path="cityId" />
			<sf:hidden path="placeId" />
		</div>
	</sf:form>
</div>
<!-- /.box -->



<div class="box">
            <div class="box-header">
              <h3 class="box-title">List of available Foods</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="adminFoodTable" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Id</th>
                  <th>Name</th>
                  <th>City</th>
                  <th>Place</th>
                  <th>Image</th>
                  
                  <th>Address</th>
                  <th>Price Min</th>
                  <th>Price Max</th>
                  <th>Hours Open</th>
                  <th>Hours Close</th>
                  <th>Contact</th>
                  <th>Active</th>
                  <th>Edit</th>
                </tr>
                </thead>
                
              </table>
            </div>
            <!-- /.box-body -->
          </div>