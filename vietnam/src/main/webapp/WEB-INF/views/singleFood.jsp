<div class="container">

	<!-- Breadcrumb -->
	<div class="row">
	
		<div class="col-xs-12">
		
			<ol class="breadcrumb">
			
				<li><a href="${contextRoot}">Home</a></li>
				<li><a href="${contextRoot}/food/">Food</a></li>
				<li class= "active">${food.name }</li>
			
			</ol>
		
		</div>
	
	</div>
	
	<div class="row">
		
		<div class="row">
			<div class="page-header">
				<h1 class="text-center">${food.name }</h1><br>
				<h5 class="text-center" >${food.description }</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-8">
				
				<div class="food-single-class"><p>${food.content }</p></div>
				
			</div>
		
			<div class="col-xs-6 col-md-4 ">
				<div class="food-single-class">
					<strong>Price:</strong><br>
					${food.priceMin }&#8363 - ${food.priceMax }&#8363
					<hr/>
					<strong>Hours:</strong><br>
					${food.hoursOpen } - ${food.hoursClose }
					<hr/>
					<strong>Address:</strong><br>
					${food.address }
					<hr>
					<strong>Contact:</strong><br>
					${food.contact }
					<hr>
				</div>
			</div>
		</div>
	</div>

</div>