<div class="container">
	<div class="row">
		<div class="col-md-3">
			
				<img src="${img }/food.jpg" class="img img-responsive" />
			
		</div>
		<div class="col-md-9">
			<div class="row">
				<h2 class="text-center">Food and drink</h2>
			</div>
			<div class="row">
				<div class="food-class">
					<ol>
						<c:forEach items="${listFoods }" var="food">
							<a href="${contextRoot}/food/${food.getId()}"><li class="food-class-items">${food.getName() }</li></a>
						</c:forEach>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>