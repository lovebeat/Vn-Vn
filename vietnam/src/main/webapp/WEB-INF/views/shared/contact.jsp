<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container" id="contact">
	<h2 class="text-center">Liên hệ với chúng tôi </h2>
	<p class="text-center">
		<em>Bạn có yêu cầu / thắc mắc gì ?</em>
	</p>
	<br>
	<br>
	<div class="row test">
		<div class="col-sm-4">
			<p>
				<span class="glyphicon glyphicon-map-marker"></span> Ho Chi Minh, VN
			</p>
			<p>
				<span class="glyphicon glyphicon-phone"></span> 0966152448
			</p>
			<p>
				<span class="glyphicon glyphicon-envelope"></span> 13520757@gm.uit.edu.vn
			</p>
		</div>
		<div class="col-sm-8">
			<sf:form role="form" modelAttribute="contact" action="${contextRoot }/contact" method="POST" >
				<div class="row">
					<div class="col-sm-6 form-group">
						<sf:input type="text" path="name" id="name" class="form-control"
							placeholder="Tên" />
						
					</div>
					<div class="col-sm-6">
						<sf:input type="email" path="email" id="email" class="form-control"
							placeholder="Email" />
						
					</div>
				</div>
				<sf:textarea class="form-control" id="comment" path="comment"
					placeholder="Bình luận" rows="6"></sf:textarea>
				
				<br>
				<div class="row">
					<div class="col-sm-12 form-group">
						<input type="submit" name="submit" id="submit" value="Gửi"
							class="btn btn-primary pull-right" />
					</div>
					<sf:hidden path="id" />
					
				</div>
			</sf:form>
		</div>
	</div>

</div>
