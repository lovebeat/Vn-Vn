
<div class="container">
	<div class="row">

		<div class="row">
			<div class="page-header">
				<h1 class="text-center">${food.name }</h1>
				<br>
				<h4 class="text-center">${food.description }</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-8">
				<div class="row">
					<img
						src="${img }/${food.city.name }/food/${food.name }/${food.code }.jpg"
						style="width: 80%; height: 300px; object-fit: cover;">
				</div>
				<div class="food-single-class">
					<p>${food.content }</p>
				</div>

			</div>

			<div class="col-xs-6 col-md-4 ">
				<div class="food-single-class">
					<strong>Price:</strong><br> ${food.priceMin }&#8363 -
					${food.priceMax }&#8363
					<hr />
					<strong>Hours:</strong><br> ${food.hoursOpen } -
					${food.hoursClose }
					<hr />
					<strong>Address:</strong><br> ${food.address }
					<hr>
					<strong>Contact:</strong><br> ${food.contact }
					<hr>
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
<!-- others food -->
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-md-4">
			<h3 class="">
				<p>Some similar food</p>
			</h3>
		</div>
	</div>
	<div class="row">

		<c:forEach items="${ listFood}" var="food">
			<a href="${contextRoot}/food/${food.id}" style="color: black;">
				<div class="CityBlockItem">
					<div class="cityBlockImg">
						<img alt=""
							src="${img }/${food.city.name }/food/${food.name }/${food.code }.jpg">
						<div>
							<p>${food.id }</p>
						</div>
					</div>

					<div class="infoOfCityInBlock">
						<div>${food.name }</div>
						<div>
							<p>${food.city.name }</p>
						</div>
					</div>
				</div>
			</a>
		</c:forEach>

	</div>
</div>






