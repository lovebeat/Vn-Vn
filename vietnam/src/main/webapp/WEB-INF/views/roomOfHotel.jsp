<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%-- <div class="row">
	<c:if test="${not empty message }">
		<div class="col-xs-12">
			<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				${message }
			</div>
		</div>
	</c:if>
</div> --%>



<!-- general form elements -->
<div class="box box-primary">


	<div class="box-body">
		<div class="box-header with-border">
			<h3 class="box-title">Thông tin Home Stay</h3>
		</div>
		<br>
		<div class="form-group">
			<p>
				Tên Name Stay: ${hotel.name }<br> Loại: ${hotel.star }<br>
				Thông tin liên hệ: ${hotel.phone }<br>

			</p>
		</div>

	</div>
</div>
<div class="box">

	<!-- /.box-header -->
	<!-- form start -->

	<div class="row">
		<div class="col-lg-10">
			<div class="box-body">
				<div class="box-header with-border">
					<h3 class="box-title">Danh sách phòng của Home Stay</h3>
				</div>
				<br>
				<c:forEach items="${ listRoom}" var="room">
					<div class="col-lg-2"
						style="border: 1px solid; margin-left: 20px; margin-bottom: 20px; float: left">
						<div class="room" id="" style="padding-left: 20px;">
							<div class="row">
								<p>Phòng ${room.name }</p>
							</div>
							<div class="row">Trạng thái: ${room.status }</div>
						</div>
						<div class="row">
							<c:choose>
								<c:when test="${room.status.equals('empty')}">
									<button type="button" data-toggle="modal"
										data-target="#bookingRoom" onclick="book(${room.id})"
										class="btn btn-success btn-xs">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>

								</c:when>
								<c:when test="${room.status.equals('full')}">
									<button type="button" data-toggle="modal"
										data-target="#detailRoomBooked" onclick="booking(${room.id})"
										class="btn btn-danger btn-xs">
										<span class="glyphicon glyphicon-eye-open"></span>
									</button>

								</c:when>

							</c:choose>
						</div>

					</div>

				</c:forEach>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-11">
			<div class="text-right">
				<button type="button" data-toggle="modal" data-target="#addRoom" onclick="add(${hotel.id})"
					class="btn btn-warning btn-md">
					Thêm phòng
				</button>
			</div>
		</div>
	</div>

</div>


<script type="text/javascript">
function booking(id){
	//alert('123');
	var xhttp;    
    
    xhttp = new XMLHttpRequest();
    xhttp.open("GET", window.contextRoot+"/json/data/"+id+"/booking", true);
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
    	  var mol = document.getElementById("info-room-booked");
    	  console.log(this.responseText);
    	  if(this.responseText != ""){
    		  var result = JSON.parse(this.responseText);
        	  var name = result['nameGuest'];
        	  var adr = result['addressGuest'];
        	  var phone = result['phoneGuest'];
        	  var dateArr = result['dateArrive'];
        	  var dateLea = result['dateLeave'];
        	  
        	  //alert(name);
        	  mol.innerHTML = "Tên khách hàng: " + name + "<br/>" 
        	  					+ "Địa chỉ: " + adr + "<br/>"
        	  					+ "Thông tin liên hệ: " + phone + "<br/>"
        	  					+ "Ngày nhận phòng: " + dateArr + "<br/>"
        	  					+ "Ngày trả phòng: " + dateLea + "<br/>"
        	  					;
    	  }else{
    		  mol.innerHTML = "No data";
    	  }
      }
      return false;
    };
    xhttp.send();
}

function book(id){
	
	$("#idRo").val(id);
}

function add(id){
	
	$("#idHt").val(id);
}

</script>

<!-- dialog detail room booked -->
<div class="modal fade" id="detailRoomBooked" role="dialog"
	tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">Thông tin khách hàng đặt phòng</h4>
			</div>
			<div class="modal-body">
				<!-- Modal form -->
				<div id="info-room-booked" class="row" style="margin: 20px;">

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>

</div>


<!-- dialog booking room -->
<div class="modal fade" id="bookingRoom" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">Đặt phòng</h4>
			</div>
			<div class="modal-body">
				<!-- Modal form -->

				<sf:form role="form" modelAttribute="bookingf"
					action="${contextRoot }/provider/bookingFy" method="POST">
					<div class="form-group">
						<label for="name">Tên khách hàng</label>
						<sf:input type="text" class="form-control" id="nameGuest"
							path="nameGuest" placeholder="nhập tên" />


					</div>
					<div class="form-group">
						<label for="address">Địa chỉ</label>
						<sf:input type="text" class="form-control" id="addressGuest"
							path="addressGuest" placeholder="nhập địa chỉ" />


					</div>
					<div class="form-group">
						<label for="phone">Số điện thoại</label>
						<sf:input type="text" class="form-control" id="phoneGuest"
							path="phoneGuest" placeholder="nhập SĐT liên hệ" />

					</div>
					<div class="form-group">
						<label>Ngày nhận phòng</label>

						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<sf:input type="text" class="form-control pull-right datepicker"
								id="dateArrive" path="dateArrive" />

						</div>

					</div>
					<div class="form-group">
						<label>Ngày trả</label>

						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<sf:input type="text"
								class="form-control pull-right datepicker
						"
								id="dateLeave" path="dateLeave" />
						</div>

					</div>




					<div class="form-group">
						<input type="submit" name="submit" id="submit" value="Đặt"
							class="btn btn-success" />
						<sf:hidden path="roomId" id="idRo" value="" />
						<sf:hidden path="active" />
						<sf:hidden path="id" />
					</div>


				</sf:form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>

</div>


<!-- dialog add room -->
<div class="modal fade" id="addRoom" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">Thêm phòng</h4>
			</div>
			<div class="modal-body">
				<!-- Modal form -->

				<sf:form role="form" modelAttribute="addRoom"
					action="${contextRoot }/provider/addRoom" method="POST">
					<div class="form-group">
						<label for="name">Tên phòng</label>
						<sf:input type="text" class="form-control" id="name"
							path="name" placeholder="nhập tên phòng" />


					</div>
					
					<div class="form-group">
						<label for="phone">Giá phòng/ngày</label>
						<sf:input type="number" class="form-control" id="price"
							path="price" placeholder="" />

					</div>
			
					<div class="form-group">
						<input type="submit" name="submit" id="submit" value="Thêm"
							class="btn btn-success" />
						<sf:hidden path="status"/>
						<sf:hidden path="active" />
						<sf:hidden path="id" />
						<sf:hidden path="hotel.id" id="idHt" value=""/>
					</div>


				</sf:form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>

</div>

