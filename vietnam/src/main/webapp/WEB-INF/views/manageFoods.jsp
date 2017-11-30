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
	<sf:form role="form" modelAttribute="food"
		action="${contextRoot }/manage/foods" method="POST"
		enctype="multipart/form-data">
		<div class="box-body">
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="name">Name of Food</label>
						<sf:input type="text" class="form-control" id="name" path="name"
							placeholder="Enter name of Food" />
						<sf:errors path="name" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="cityId">City</label>
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
								data-target="#myCityModal" class="btn btn-warning btn-xs">Add
								city</button>
						</div>
					</div>
				</div>
			</div>
			<%-- <div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="placeId">Place</label>
						<sf:select path="pl" items="${places }" itemLabel="name"
							itemValue="id" class="form-control" />
					</div>
				</div>
			</div> --%>
			<!-- <div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<div class="text-right">
							<button type="button" data-toggle="modal"
								data-target="#myPlaceModal" class="btn btn-warning btn-xs">Add
								Place</button>
						</div>
					</div>
				</div>
			</div> -->
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="file">Select an image</label>
						<sf:input type="file" id="file" path="file" />
						<sf:errors path="file" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="address">Address of Food</label>
						<sf:input type="text" class="form-control" id="address"
							path="address" placeholder="Enter address of Food" />
						<sf:errors path="address" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="description">Description</label>
						<sf:textarea class="form-control" id="description"
							path="description" rows="2"></sf:textarea>
						<p class="help-block">Enter some description...</p>
						<sf:errors path="description" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="content">Content</label>
						<sf:textarea class="form-control" id="content" path="content"
							rows="30"></sf:textarea>
						<p class="help-block">Content of article...</p>
						<%-- <sf:errors path="content" cssClass="help-block" element="em" /> --%>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="priceMin">Price minimum</label>
						<sf:input type="number" class="form-control" id="priceMin"
							path="priceMin" placeholder="Enter price minimum of Food" />
						<sf:errors path="priceMin" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="priceMax">Price maximum</label>
						<sf:input type="number" class="form-control" id="priceMax"
							path="priceMax" placeholder="Enter price maximum of Food" />
						<sf:errors path="priceMax" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="bootstrap-timepicker">
						<div class="form-group">
							<label for="hoursOpen">To (hours)</label>

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
							<label for="hoursClose">From (hours)</label>

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
						<label for="contact">Contact</label>
						<sf:input type="text" class="form-control" id="contact"
							path="contact" placeholder="Enter some information to contact" />
						<sf:errors path="contact" cssClass="help-block" element="em" />
					</div>
				</div>
			</div>

		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<input type="submit" name="submit" id="submit" value="Submit"
				class="btn btn-primary" />
			<sf:hidden path="id" />
			<sf:hidden path="code" />
			<sf:hidden path="active" />

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
					<!-- <th>Id</th> -->
					<th>Name</th>
					<th>City</th>
					<!-- <th>Place</th> -->
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

<!-- dialog add new place in food pages if it don't exist -->
<%-- <div class="modal fade" id="myPlaceModal" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">Add new Place</h4>
			</div>
			<div class="modal-body">
				<!-- Modal form -->
				<sf:form role="form" modelAttribute="place"
					action="${contextRoot }/manage/place" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="name">Name</label>
						<sf:input type="text" class="form-control" id="name" path="name"
							placeholder="Enter name" />
						<sf:errors path="name" cssClass="help-block" element="em" />
					</div>

					<div class="form-group">
						<label for="file">Select an image</label>
						<sf:input type="file" id="file" path="file" />
						<sf:errors path="file" cssClass="help-block" element="em" />
					</div>
					<div class="form-group">
						<label for="cityId">City</label>
						<sf:select path="ct" items="${cities }" itemLabel="name"
							itemValue="id" class="form-control" />
					</div>

					<div class="form-group">
						<label for="description">Description</label>
						<sf:textarea class="form-control" id="description"
							path="description" rows="1"></sf:textarea>
						<p class="help-block">Enter some description...</p>
						<sf:errors path="description" cssClass="help-block" element="em" />
					</div>
					<div class="form-group">
						<label for="content">Content</label>
						<sf:textarea class="form-control" id="content" path="content"
							rows="9"></sf:textarea>
						<p class="help-block">Content of article...</p>
						<sf:errors path="content" cssClass="help-block" element="em" />
					</div>

					<div class="form-group">
						<input type="submit" name="submit" id="submit" value="Submit"
							class="btn btn-primary" />
						<sf:hidden path="id" />
						<sf:hidden path="code" />
						<sf:hidden path="active" />
					</div>
				</sf:form>
			</div>
		</div>
	</div>

</div> --%>
<!-- dialog add new city in food pages if it don't exist -->
<div class="modal fade" id="myCityModal" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">Add new City</h4>
			</div>
			<div class="modal-body">
				<!-- Modal form -->
				<sf:form role="form" modelAttribute="city"
					action="${contextRoot }/manage/city" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="name">Name</label>
						<sf:input type="text" class="form-control" id="name" path="name"
							placeholder="Enter name" />
						<sf:errors path="name" cssClass="help-block" element="em" />
					</div>

					<div class="form-group">
						<label for="file">Select an image</label>
						<sf:input type="file" id="file" path="file" />
						<sf:errors path="file" cssClass="help-block" element="em" />
					</div>
					<div class="form-group">
						<label for="description">Description</label>
						<sf:textarea class="form-control" id="description"
							path="description" rows="1"></sf:textarea>
						<p class="help-block">Enter some description...</p>
						<sf:errors path="description" cssClass="help-block" element="em" />
					</div>
					<div class="form-group">
						<label for="content">Content</label>
						<sf:textarea class="form-control" id="content" path="content"
							rows="9"></sf:textarea>
						<p class="help-block">Content of article...</p>
						<%-- <sf:errors path="content" cssClass="help-block" element="em" /> --%>
					</div>

					<div class="form-group">
						<input type="submit" name="submit" id="submit" value="Submit"
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
