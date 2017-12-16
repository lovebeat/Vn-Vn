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

<div class="container">

	<!-- general form elements -->
	<div class="box box-primary">

		<!-- /.box-header -->
		<!-- form start -->
		<sf:form role="form" modelAttribute="hotel" action="${contextRoot }/manage/approveProvider" method="POST" enctype="multipart/form-data" >
			<div class="row">
				<div class="col-lg-5">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Basic Inf</h3>
						</div>
						<br>
						<div class="form-group">
							<label for="name">Name</label> <sf:input type="text"
								class="form-control" id="name" path="name" readonly="true"
								placeholder="Enter name" />
							<sf:errors path="name" cssClass="help-block" element="em" />

						</div>
						<div class="form-group">
							<label for="file">Select an image</label>
							<sf:input type="file" id="file" path="file" readonly="true" disabled="true"/>
							<sf:errors path="file" cssClass="help-block" element="em" />
						</div>
						<div class="form-group">
							<label for="cityId">City</label>
								<sf:select path="ct" items="${cities }" itemLabel="name" itemValue= "id" class="form-control" disabled="true"/>
						</div>
						<div class="form-group">

							
							<label for="address">Address</label> <sf:input type="text" readonly="true"
								class="form-control" id="where" path="where"
								placeholder="Enter address" />


						</div>
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group">
									<label>Star rating</label> <select class="form-control" id="star" name="star" disabled="true">
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
									<label>Time Operate</label> <select class="form-control" id="timeOperate" name= "timeOperate" disabled="true">
										<option value="24/7">24/7</option>
										<option value="time in works">Time in works</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="website">Hotel's Website</label> <sf:input type="text" readonly="true"
								class="form-control" id="website" path="website" placeholder="Enter website"/>
								<sf:errors path="website" cssClass="help-block" element="em" />
						</div>
						<div class="form-group">
							<label for="phone">Hotel's Phone</label> <sf:input type="text" readonly="true"
								class="form-control" id="phone"  path="phone" placeholder="Enter phone"/>
								<sf:errors path="phone" cssClass="help-block" element="em" />
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<div class="col-lg-5">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Payment and policies</h3>
						</div>
						<br>
						<div class="form-group">

							<label>Payment option</label>
							<p class="help-block">Can you charge credit cards at the
								property?</p>
							<select class="form-control" id="payment" name="payment" disabled="true">
								<option value="yes">Yes</option>
								<option value="no">No</option>

							</select>

						</div>
						<div class="form-group">

							<label>Cancellation policy</label>
							<p class="help-block">How many days in advance can guests
								cancel free of charge or guests will pay 100%?</p>
							<select class="form-control" id="cancel" name="cancel" disabled="true">
								<option value="free in day of arrival (18:00)">Day of arrival (18:00)</option>
								<option value="free in 1 day">1 day</option>
								<option value="free in 2 day">2 day</option>
								<option value="free in 3 day">3 day</option>
								<option value=" free in 7 day">7 day</option>
								<option value=" pay 100% of the first night">of the first night</option>
								<option value="pay 100% of the full stay">of the full stay</option>
							</select>
							

						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-11">
					<div class="box-body">
						<div class="box-header with-border">
							<h3 class="box-title">Hotel's information</h3>
						</div>
						<br>
						<div class="row">
							<div class="col-lg-3">
								<div class="form-group">
									<label>Internet</label>
									<p class="help-block">Is Internet available to guests?</p>
									<select class="form-control" id="internet" name="internet" disabled="true">
										<option value="yes, free">Yes, free</option>
										<option value="yes, paid">Yes, paid</option>
										<option value="no">No</option>
									</select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label>Parking</label>
									<p class="help-block">Is Parking available to guests?</p>
									<select class="form-control" id="parking" name="parking" disabled="true">
										<option value="yes, free">Yes, free</option>
										<option value="yes, paid">Yes, paid</option>
										<option value="no">No</option>
									</select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label>Breakfast</label>
									<p class="help-block">Is breakfast available to guests?</p>
									<select class="form-control" id="breakfast" name="breakfast" disabled="true">
										<option value="no">No</option>
										<option value="yes, it's included in the price">Yes, it's included in the price</option>
										<option value="yes, it's optional">Yes, it's optional</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5">
								<div class="form-group">
									<label>Children</label>
									<p class="help-block">Specific price for children ?</p>
									<select class="form-control" id="children" name="children" disabled="true">
										<option value="no">No</option>
										<option value="yes, children under 8 ages will be free of charge">Yes, Children under 8 ages will be fee of charge</option>

									</select>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Pet</label>
									<p class="help-block">Do you allow pets?</p>
									<select class="form-control" id="pet" name="pet" disabled="true">
										<option value="no">No</option>
										<option value="upon request">upon request</option>

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
							<h3 class="box-title">Services provied onsite, popular
								activities</h3>
						</div>
						<br>
						<div class="form-group">
							<p class="help-block">We've listed the options most
								frequently selected for properties like yours here.</p>

						</div>
					</div>
				</div>
				
			</div>
			<div class="box-footer">
			<input type="submit" name="submit" id="submit" value="Approve" class="btn btn-primary"/>
			<sf:hidden path="id" />
			<sf:hidden path="code" />
			<sf:hidden path="active" />
			<sf:input type="hidden" path="pr" value="${userModel.id}"/>
			<sf:hidden path="approve"/>
		</div>
		</sf:form>
	</div>

</div>