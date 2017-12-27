<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container" style="margin-top: 30px;">
	<div class="col-md-8 col-md-offset-2 " style="border: 1px solid #ffffff; background-color:#e5e5e5; padding:20px;">
	<h3 class="text-center"><span class="glyphicon glyphicon-search"></span> Điểm đến tiếp theo?</h3>
		<div class="hrs" style="margin-left: 20px; margin-right: 20px;">
			<div class="row">
				<div>
					<hr style="margin: 20px 0px; border: 1px solid #ffffff;">
				</div>
			</div>
		</div>
		<div class="col-md-11 col-md-offset-1" style="padding-left: 25px;">
		<sf:form role="form" modelAttribute="hotel" action="${contextRoot }/searchHotel" >
		<div class="row" >
		
			<div class="col-md-8">
				<label for="cityId">Tỉnh/Thành Phố</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-home"></i></span>
				<sf:select path="ct" items="${cities }" itemLabel="name" itemValue= "id" class="form-control"/>
				</div>
			</div>
			<div class="col-md-2">
				<div class="input-group" style="margin-top:25px;">
					
					<input type="submit" name="submit" id="submit" value="Tìm kiếm"  class="btn btn-success"/>
			
				</div>
			</div>

		</div>
		<br>
		<div class="row">
			<div class="col-md-5">
				<label for="place">Date arrive</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-calendar"></i></span> <input required
						class="form-control pull-right" id="timeCheckIn" name="dateArr"/>
				</div>
			</div>
			<div class="col-md-5">
				<label for="place">Date leave</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-calendar"></i></span> <input required id="timeCheckOut"
						 class="form-control pull-right" name="dateLea"
						placeholder=""/>
				</div>
			</div>
			
		</div>

				

				<br>
		

	</sf:form>
	</div>
	</div>
	<br>
	
	
	
	
	
	
</div>
