<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container" style="margin-top: 30px;">
	<div class="col-md-3 " 
		style="border: 1px solid #ffffff; background-color: #e5e5e5; padding: 20px; margin-top:10px;">
		<h4 class="text-center">
			<span class="glyphicon glyphicon-search"></span> Điểm đến tiếp theo?
		</h4>
		<div class="hrs" style="margin-left: 20px; margin-right: 20px;">
			<div class="row">
				<div>
					<hr style="margin: 20px 0px; border: 1px solid #ffffff;">
				</div>
			</div>
		</div>
		<div class="" style="">
			<sf:form role="form" modelAttribute="hotel"
				action="${contextRoot }/searchHotel">
				<div class="row">

					<div class="col-md-12">
						<label for="cityId">Tỉnh/Thành Phố</label>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-home"></i></span>
							<sf:select path="ct" items="${cities }" itemLabel="name"
								itemValue="id" class="form-control" />
						</div>
					</div>
					

				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<label for="place">Date arrive</label>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span> <input
								class="form-control pull-right"id="timeCheckIn" name="dateArr" />
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<label for="place">Date leave</label>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span> <input
								id="timeCheckOut" class="form-control pull-right" name="dateLea"
								placeholder="" />
						</div>
					</div>
				</div>
				<div class="row ">
					<div class="col-md-2">
						<div class="input-group" style="margin-top: 25px;">

							<input type="submit" name="submit" id="submit" value="Tìm kiếm"
								class="btn btn-success" />

						</div>
					</div>
				</div>

				<br>


			</sf:form>
			</div>
		</div>

		<div class="col-md-9">

			<%-- <c:forEach items="${hotelEmptysss }" var="hotelsss">
				<div class="row">
					<a
						href="${contextRoot}/detailHotel/${hotelsss.id}/${testdatearr }/${testdatelea }"
						style="color: black;">
						<div class="row"
							style="border: 1px solid #F2F2F2; padding: 10px; margin: 10px;">
							<div class="col-md-5">
								<img src="${img }/hotel/${hotelsss.name}/${hotelsss.code}.jpg"
									style="width: 100%; height: 180px; object-fit: cover;">
							</div>
							<div class="col-md-7">

								<strong><h4>${hotelsss.getName() }</h4></strong>
								<p>${hotelsss.wheres }</p>
								<p>${hotelsss.star }</p>
								<p>${hotelsss.phone }</p>
								<p>${hotelsss.website }</p>

							</div>
						</div>
					</a>
				</div>
				
			</c:forEach> --%>
			<c:forEach items="${listSearch }" var="search">

				<div class="row">
					<a
						href="${contextRoot}/detailHotel/${search.id}/${testdatearr }/${testdatelea }"
						style="color: black;">
						<div class="row"
							style="border: 1px solid #F2F2F2; padding: 10px; margin: 10px;">
							<div class="col-md-5">
								<img src="${img }/hotel/${search.name}/${search.code}.jpg"
									style="width: 100%; height: 180px; object-fit: cover;">
							</div>
							<div class="col-md-7">

								<strong><h4>${search.getName() }</h4></strong>
								<p>${search.wheres }</p>
								<p>${search.star }</p>
								<p>${search.phone }</p>
								<p>${search.website }</p>

							</div>
						</div>
					</a>
				</div>

			</c:forEach>



		</div>







	</div>