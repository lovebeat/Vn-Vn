<%-- <%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="row">
	<c:if test="${not empty message }">
		<div class="col-xs-12">
			<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				${message }
			</div>
		</div>
	</c:if>
</div> --%>

<div class="container">

	<!-- general form elements -->
	<div class="box box-primary">

		<!-- /.box-header -->
		<!-- form start -->
		<form role="form" method="POST" enctype="multipart/form-data">
			<div class="row">
				<div class="col-lg-10">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Basic Inf</h3>
						</div>
						<br>
						<div class="form-group">
							<label for="name">Total of Room</label> <input type="text"
								class="form-control" id="name" name="name" readonly="true" />
						</div>
						<div class="row">
							<div class="form-group col-lg-6">
								<label for="name">Single Room</label> <input type="text"
									class="form-control" id="name" name="name" readonly="true" />
							</div>
							<div class="form-group col-lg-6">
								<label for="name">Double Room</label> <input type="text"
									class="form-control" id="name" name="name" readonly="true" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-5">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Status of Single Room</h3>
						</div>
						<br>
						<div class="form-group">
							<label>Number of Empty</label> <select class="form-control"
								id="where" name="where">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>


						</div>

						<div class="form-group">
							<label>Number of Full</label> <select class="form-control"
								id="star" name="star">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>


						<div class="form-group">
							<label>Number of staying</label> <select class="form-control"
								id="star" name="star">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>


					</div>
					<!-- /.box-body -->
				</div>
				<div class="col-lg-5">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Status of Double Room</h3>
						</div>
						<br>
						<div class="form-group">
							<label>Number of Empty</label> <select class="form-control"
								id="where" name="where">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>


						</div>

						<div class="form-group">
							<label>Number of Full</label> <select class="form-control"
								id="star" name="star">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>


						<div class="form-group">
							<label>Number of staying</label> <select class="form-control"
								id="star" name="star">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>

					</div>
				</div>
			</div>


			<div class="box-footer">
				<input type="submit" name="submit" id="submit" value="Update"
					class="btn btn-primary" />

			</div>
		</form>
	</div>

</div>