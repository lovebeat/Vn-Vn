<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="slideshow-container container-fluid">
	<div class="row top">
		<div class="col-sm-4">
			<input type="text" name="search" placeholder="Search.."
				style="background-image: url('${img }/searchicon.png');">
		</div>
		<div class="col-sm-4"></div>
		<div class="col-sm-4"></div>
	</div>
	<div class="row">
		<c:forEach items="${listBanner }" var="banner">
			<div class="mySlides fade">
				<img src="${img }/banner/${banner.code }.jpg" alt="pic1"
					style="width: 100%; height: 600px;">
				<div class="title">Viet Nam</div>
				<div class="subTitle">we are happy for you</div>
				<div class="foot">it's all for you.....</div>
			</div>
		</c:forEach>
		<%-- <div class="mySlides fade">
			<img src="${img }/pic1.jpg" alt="pic1"
				style="width: 100%; height: 600px;">
			<div class="title">Viet Nam</div>
			<div class="subTitle">we are happy for you</div>
			<div class="foot">it's all for you.....</div>
		</div>

		<div class="mySlides fade">
			<img src="${img }/pic2.jpg" alt="pic2"
				style="width: 100%; height: 600px;">
			<div class="title">Viet Nam</div>
			<div class="subTitle">thank you for visit my love in my page...</div>
			<div class="foot">it's all for you.....</div>
		</div>

		<div class="mySlides fade">
			<img src="${img }/pic3.jpg" alt="pic3"
				style="width: 100%; height: 600px;">
			<div class="title">Viet Nam</div>
			<div class="subTitle">other........</div>
			<div class="foot">it's all for you.....</div>
		</div> --%>
		<button id="citiesBtn">
			<span>Cities</span>
		</button>
	</div>
	<!-- The modal -->
	<div id="citiesModal" class="citiesModal">
		<!-- Modal content -->
		<div class="citiesModal-content">
			<div class="citiesModalHeader">
				<span class="closeModal">&times;</span> <input
					style="background-image: url('${img }/searchicon.png');"
					type="text" id="searchCityInModal"
					onkeyup="searchCiTyInModalFunc()" name="searchModal"
					placeholder="  Enter city....">
			</div>
			<div class="citiesModalBody">
				<c:forEach items="${ listCity}" var="city">
					<div class="CityModalItem">
						<div class="cityModalImg">
							<img alt="" src="${img }/${city.name }/${city.code }.jpg">
							<div>
								<p>${city.id }</p>
							</div>
						</div>

						<div class="infoOfCityInModal">
							<div>${city.name }</div>
							<div>Viet Nam</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="citiesModalFooter">
				<h3>City in Viet Nam</h3>
			</div>
		</div>
	</div>
</div>