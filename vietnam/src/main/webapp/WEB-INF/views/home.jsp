<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./shared/slide.jsp"%>
<%@include file="./shared/nav.jsp"%>
<div class="container text-center" id="Welcome">
	<div class="row contentInHome">
		<div class="titleParagraphInHome">

			<h1>Welcome to Vietnam</h1>
			<br>
		</div>
		<div class="subscriptionInHome">
			Astonishingly exotic and utterly compelling, Vietnam is a country of
			breathtaking natural beauty with a unique heritage, where travel
			quickly becomes addictive.<br>
		</div>
		<br> <br>

		<div class="detailInHome" style="display: none;">

			<strong>Sensory Overload</strong><br> Unforgettable experiences
			are everywhere in Vietnam. There’s the sublime: gazing over a surreal
			seascape of limestone islands from the deck of a traditional junk in
			Halong Bay. The ridiculous: taking 10 minutes just to cross the
			street through a tsunami of motorbikes in Hanoi. The inspirational:
			exploring the world’s most spectacular cave systems in Phong Nha-Ke
			Bang National Park. The comical: watching a moped loaded with honking
			pigs weave a wobbly route along a country lane. And the
			contemplative: witnessing a solitary grave in a cemetery of thousands
			of war victims.<br> <br> <strong>History & Culture</strong><br>
			Forty years after the carnage and destruction of an epoch-defining
			conflict, Vietnam is resolutely a nation, not a war, in the eyes of
			the world. Self-confident and fast-developing, its progress is
			all-evident in the country's booming metropolises. Vietnam's allure
			is easy to appreciate (and something of a history lesson) as ancient,
			labyrinthine trading quarters of still-thriving craft industries are
			juxtaposed with grand colonial mansions from the French era, all
			overseen from the sky bars of 21st-century glass-and-steel
			high-rises.<br> <br> <strong>A Culinary Superpower</strong>
			<br> The Thais may grumble, but in Southeast Asia nothing really
			comes close: Vietnamese food is that good. Incredibly subtle in its
			flavours and outstanding in its diversity, Vietnamese cooking is a
			fascinating draw for travellers – myriad street-food tours and
			cooking schools are testament to this. Geography plays a crucial
			role, with Chinese flavours influencing the soups of the north,
			spices sparking up southern cuisine, and herbs and complex techniques
			typifying the central coastline, rightly renowned as Vietnam’s
			epicurean epicentre. And up and down the country you can mingle with
			villagers, sample local dishes and sip rice wine in Vietnam's many
			regional markets.<br> <br> <strong>Thrills &
				Chills</strong><br> If you have the bills, Vietnam has the thrills and
			chills. Some require a little physical effort, such as motorbiking
			switchback after switchback up the jaw-dropping Hai Van Pass in
			central Vietnam. Others require even more sweat: kitesurfing the
			tropical oceanic waters off Mui Ne or hiking the evergreen hills
			around Bac Ha or Sapa. And when you’re done with all that adrenaline
			stuff, there’s plenty of horizontal ‘me’ time to relish. Vietnam has
			outstanding spas – from marble temples of treatments, to simple
			family-run massage salons with backpacker-friendly rates. <br> <br>
		</div>
		<a href="javascript:void(0);" onclick="showMoreOrLess()"
			id="showMoreOrLessInHome"> Show More <span id="lessOrMoreInHome"
			class="glyphicon glyphicon-chevron-down animation"></span>
		</a>
	</div>
</div>
<div class="container split">
	<div class="row">
		<div>

			<hr style="margin: 40px 0px">
		</div>
	</div>
</div>
<!-- THIS IS CONTEXT FOR SLIDE IMAGE OF TOP EXPERIENCE IN VIET NAM -->
<div class="container" id="top-experiences">
	<div class="row">

		<h1 style="text-align: center;">Top experiences in Viet Nam</h1>
		<br> <br>
	</div>
	<div class="row top-experiences">
		<c:forEach var="i" begin="0" end="${listPlace.size()-1 }">
			<c:choose>
				<c:when test="${i<4}">
					<script>
						console.log("${img }/${listPlace.get(i).city.name }/${listPlace.get(i).name }/${listPlace.get(i).code }")
					</script>
					<div class="col-sm-3 top-experiences-img">
						<img
							src="${img }/${listPlace.get(i).city.name }/${listPlace.get(i).name }/${listPlace.get(i).code }.jpg"
							style="width: 100%; height: 400px; object-fit: cover;" onclick="location.href='place/${listPlace.get(i).id}'"
							class="hover-shadow cursor frontSlide">
						<div class="top-experiences-shape-counter">
							<p>${i }</p>
						</div>
						<div class="textInsideImg">
							<div class="frontSlideTitle">
								<p>${listPlace.get(i).name}</p>
							</div>
							<div class="frontSlideSubTitle">${listPlace.get(i).city.name }</div>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<script>
					 	console.log("in else")
				
						console.log("${img }/${listPlace.get(i).city.name }/${listPlace.get(i).name }/${listPlace.get(i).code }")
					
					</script>
					<div class="col-sm-3 top-experiences-img" style="display: none;">
						<img
							src="${img }/${listPlace.get(i).city.name }/${listPlace.get(i).name }/${listPlace.get(i).code }.jpg"
							style="width: 100%; height: 400px; object-fit: cover;" onclick="location.href='place/${listPlace.get(i).id}'"
							class="hover-shadow cursor frontSlide" alt="Hinh Thieu">
						<div class="top-experiences-shape-counter">
							<p>${i }</p>
						</div>
						<div class="textInsideImg">
							<div class="frontSlideTitle" >
								<p>${listPlace.get(i).name}</p>
							</div>
							<div class="frontSlideSubTitle" >${listPlace.get(i).city.name }</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<%-- <c:forEach items="${ listPlace}" var="place">
			<div class="col-sm-3 top-experiences-img">
				<img
					src="${img }/${place.city.name }/${place.name }/${place.code }.jpg"
					style="width: 100%; height: 400px; object-fit: cover;" onclick=""
					class="hover-shadow cursor frontSlide">
				<div class="top-experiences-shape-counter">
					<p>1</p>
				</div>
				<div class="textInsideImg">
					<div class="frontSlideTitle">
						<p>${place.name}</p>
					</div>
					<div class="frontSlideSubTitle">${place.city.name }</div>
				</div>
			</div>
		</c:forEach> --%>
		<%-- <div class="col-sm-3 top-experiences-img">
			<img src="${img}/pic2.jpg"
				style="width: 100%; height: 400px; object-fit: cover;" onclick=""
				class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter">
				<p>1</p>

			</div>
			<div class="textInsideImg">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>
		</div>
		<div class="col-sm-3 top-experiences-img">
			<img src="${img }/pic3.jpg"
				style="width: 100%; height: 400px; object-fit: cover;" onclick=""
				class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter">
				<p>1</p>
			</div>
			<div class="textInsideImg">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>

		</div>
		<div class="col-sm-3 top-experiences-img">

			<img src="${img }/pic4.jpg"
				style="width: 100%; height: 400px; object-fit: cover;" onclick=""
				class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter">
				<p>1</p>
			</div>
			<div class="textInsideImg">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>
		</div>

		<div class="col-sm-3 top-experiences-img">
			<img src="${img }/banana.jpg"
				style="width: 100%; height: 400px; object-fit: cover; display: none;"
				onclick="" class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter" style="display: none;">
				<p>1</p>
			</div>
			<div class="textInsideImg" style="display: none;">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>
		</div>
		<div class="col-sm-3 top-experiences-img">
			<img src="${img }/chicken.jpg"
				style="width: 100%; height: 400px; object-fit: cover; display: none;"
				onclick="" class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter" style="display: none;">
				<p>1</p>
			</div>
			<div class="textInsideImg" style="display: none;">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>
		</div>
		<div class="col-sm-3 top-experiences-img">
			<img src="${img }/longBien.jpg"
				style="width: 100%; height: 400px; object-fit: cover; display: none;"
				onclick="" class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter" style="display: none;">
				<p>1</p>
			</div>
			<div class="textInsideImg" style="display: none;">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>
		</div>
		<div class="col-sm-3 top-experiences-img">
			<img src="${img }/hoGuom.jpg"
				style="width: 100%; height: 400px; object-fit: cover; display: none;"
				onclick="" class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter" style="display: none;">
				<p>1</p>
			</div>
			<div class="textInsideImg" style="display: none;">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>
		</div>

		<!--               -->
		<div class="col-sm-3 top-experiences-img">
			<img src="${img }/pigToBeef.jpg"
				style="width: 100%; height: 400px; object-fit: cover; display: none;"
				onclick="" class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter" style="display: none;">
				<p>1</p>
			</div>
			<div class="textInsideImg" style="display: none;">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>

		</div>
		<div class="col-sm-3 top-experiences-img">
			<img src="${img }/pig.jpg"
				style="width: 100%; height: 400px; object-fit: cover; display: none;"
				onclick="" class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter" style="display: none;">
				<p>1</p>
			</div>
			<div class="textInsideImg" style="display: none;">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>
		</div>
		<div class="col-sm-3 top-experiences-img">
			<img src="${img }/pic3.jpg"
				style="width: 100%; height: 400px; object-fit: cover; display: none;"
				onclick="" class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter" style="display: none;">
				<p>1</p>
			</div>
			<div class="textInsideImg" style="display: none;">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>

		</div>
		<div class="col-sm-3 top-experiences-img">
			<img src="${img }/pic4.jpg"
				style="width: 100%; height: 400px; object-fit: cover; display: none;"
				onclick="" class="hover-shadow cursor frontSlide">
			<div class="top-experiences-shape-counter" style="display: none;">
				<p>1</p>
			</div>
			<div class="textInsideImg" style="display: none;">
				<div class="frontSlideTitle">Ho chi minh</div>
				<div class="frontSlideSubTitle">Viet Nam</div>
			</div>
		</div> --%>
		<a class="prev" onclick="showFrontSlideLeft()">&#10094;</a> <a
			class="next" onclick="showFrontSlideRight()">&#10095;</a>
	</div>

</div>

<div class="container split">
	<div class="row">
		<div>

			<hr style="margin: 40px 0px">
		</div>
	</div>
</div>
<!-- this is food -->
<div class="container" id="food">
	<div class="row">
		<div class="col-md-4">
			<img src="${img }/foodanddrink.jpg"
				style="width: 100%; height: 450px; object-fit: cover;"
				class="img img-responsive">
		</div>
		<div class="col-md-8">
			<div class="row">
				<h1 style="text-align: center;">Ẩm thực vùng miền</h1>
				<br> <br>
			</div>
			<div class="row">
				<div class="food-class">
					<ul style="list-style-type: none">
						<c:forEach items="${listFoods }" var="food">
							<a href="${contextRoot}/food/${food.getId()}"><li
								class=" food-class-items">${food.getName() }</li></a>
						</c:forEach>
					</ul>
				</div>
			</div><br><br>
			<div class="row" style="float: right">
				<div class="" style="margin-right: 400px;">
					<a style = "text-decoration: none" href="${contextRoot }/allFood"> 
						Xem thêm <span class="glyphicon glyphicon-chevron-right"></span></a>
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















