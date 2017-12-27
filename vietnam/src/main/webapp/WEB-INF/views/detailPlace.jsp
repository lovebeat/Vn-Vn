<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="container">

	<div class="row">

		<div class="row">
			<div class="page-header">
				<h1 class="text-center">${place.name }</h1>
				<br>
				<h4 class="text-center">${place.description }</h4>
			</div>
		</div>
		<div class="row">

			<div class="row">
				<div class="col-md-8 col-md-offset-2 ">
					<img
						src="${img }/${place.city.name }/${place.name }/${place.code }.jpg"
						style="width: 100%; height: 300px; object-fit: cover;">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-10 col-md-offset-1 ">
					<p>${place.content }</p>
				</div>
			</div>


		</div>
	</div>

</div>

<div class="container split">
	<div class="row">
		<div>

			<hr style="margin: 40px 0px">
		</div>
	</div>
</div>
<!-- this is some place near it -->
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-md-4">
			<h3 class="">
				<p>Một số địa điểm gần đây</p><br>
			</h3>
		</div>
	</div>
	<div class="row">

		<c:forEach items="${ listPlace}" var="place">
			
			<a href="${contextRoot}/place/${place.id}" style="color: black;">
				<div class="CityBlockItem">
					<div class="cityBlockImg">
						<img alt=""
							src="${img }/${place.city.name }/${place.name }/${place.code }.jpg">
						<div>
							<p>${place.id }</p>
						</div>
					</div>

					<div class="infoOfCityInBlock">
						<div>${place.name }</div>
						<div>
							<p>${place.city.name }</p>
						</div>
					</div>
				</div>
			</a>
		</c:forEach>

	</div>
</div>
<div class="container split">
	<div class="row">
		<div>

			<hr style="margin: 40px 0px">
		</div>
	</div>
</div>

