<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="container">

	<div class="row">
		<h1>Ẩm thực</h1>
	</div>
	<hr>
	<c:forEach items="${listFoods }" var="food">
	<div class="row">
		<div class="col-md-8">
			<div class="title-content" style="">
				<a style="text-decoration: none; color: black;" href="${contextRoot}/food/${food.getId()}"><h3><strong>${food.name }</strong></h3></a>
			</div><br>
			<div class="content">
				<p> ${food.description}</p>
			</div><br>
			<hr>
		</div>
	</div>
	
	</c:forEach>
	
	
</div>

