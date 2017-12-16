<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<sf:form role="form" modelAttribute="hotel" action="${contextRoot }/search" >
		<div class="row">
			
			<div class="col-md-3">
				<label for="city">Place</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-map-marker"></i></span>
						<sf:select path="ct" items="${cities }" itemLabel="name" itemValue= "id" class="form-control"/>
				</div>
			</div>
			
			
			<div class="col-md-3">
				<label for="place">Place</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-map-marker"></i></span> <input id="wheres"
						 class="form-control" name="wheres"
						placeholder="Destination"/>
				</div>
			</div>
			<div class="col-md-3">
				<label for="place">Number of guest</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <select class="form-control" >
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="4">5</option>
					</select>
				</div>
			</div>
			<div class="col-md-3">
				<label for="place">Number of room</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-home"></i></span> <select class="form-control">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4">
				<label for="place">Date arrive</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-calendar"></i></span> <input 
						class="form-control pull-right" id="datepicker" name="dateArrive"/>
				</div>
			</div>
			<div class="col-md-4">
				<label for="place">Date leave</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-calendar"></i></span> <input id="datepicker2"
						 class="form-control pull-right" name="dateLeave"
						placeholder=""/>
				</div>
			</div>
			<div class="col-md-4">
				<label for="place">Number of night</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-question-sign"></i></span> <input id="night"
						 class="form-control" name="night" placeholder=""/>
				</div>
			</div>
		</div>
		<br>
		<div class="form-group">
			<input type="submit" name="submit" id="submit" value="Search" class="btn btn-primary"/>
			
		</div>

	</sf:form><br>
	<div class="row">
		<p>Result is here</p>
		<hr>
		<c:forEach items="${listSearch }" var="search">
			<p>${search.getName() }</p>
		</c:forEach>
	</div>
</div>

	
	<hr>
	<div class="row" style="margin-left: 20px;">
		<c:forEach items="${listSearch }" var="search">
			<p>${search.getName() }</p>
		</c:forEach>
		<p>${test }</p>
	</div>