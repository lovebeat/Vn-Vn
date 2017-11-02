//script for slide image
var slideIndex = 0;
showSlides();

function showSlides() {
	var i;
	var slides = document.getElementsByClassName("mySlides");
	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";
	}
	slideIndex++;
	if (slideIndex > slides.length) {
		slideIndex = 1
	}
	slides[slideIndex - 1].style.display = "block";
	setTimeout(showSlides, 2000); // Change image every 2 seconds
}
// end script for slide image
/*
 * Toggle between adding and removing the "responsive" class to topnav when the
 * user clicks on the icon
 */
function showNavMenuInSmall() {
	var x = document.getElementById("myTopnav");
	if (x.className === "topnav") {
		x.className += " responsive";
	} else {
		x.className = "topnav";
	}
}
// Get the navbar
var navbar = document.getElementById("myTopnav");

// Get the offset position of the navbar
var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove
// "sticky" when you leave the scroll position
function stickyFunction() {
	if (window.pageYOffset >= sticky) {
		navbar.classList.add("sticky")
	} else {
		navbar.classList.remove("sticky");
	}
}

// show more or less in paragraph content
function showMoreOrLess() {
	console.log("Hello");
	var detail = document.getElementsByClassName("detailInHome");
	var link = document.getElementById("showMoreOrLessInHome");
	/* var symbol= document.getElementById("lessOrMore"); */
	// console.log(symbol.classList);
	if (detail[0].style.display == "none") {// show more
		detail[0].style.display = "block";
		link.innerHTML = 'Show Less  <span id="lessOrMoreInHome" class="glyphicon glyphicon-chevron-up animation"></span>';
		console.log("display none");
		/*
		 * symbol.classList.remove("glyphicon-chevron-down");
		 * symbol.classList.add("glyphicon-chevron-up");
		 * console.log(symbol.classList);
		 */

	} else {// show less
		detail[0].style.display = "none";
		link.innerHTML = 'Show More  <span id="lessOrMoreInHome" class="glyphicon glyphicon-chevron-down"></span>';
		console.log("display # none");
		/*
		 * symbol.classList.remove("glyphicon-chevron-up");
		 * symbol.classList.add("glyphicon-chevron-down");
		 * console.log(symbol.classList);
		 */
	}
}
// THIS IS FOR CITIES MODAL
// get the modal
var modal = document.getElementById("citiesModal");

// get the button that open the modal
var btn = document.getElementById("citiesBtn")

// get the span element that content the close btn
var spanClose = document.getElementsByClassName("closeModal")[0];

// when user click the button to open cities modal
btn.onclick = function() {
	modal.style.display = "block";
}

// when user click close button
spanClose.onclick = function() {
	modal.style.display = "none";
}

// when user click outside of the modal -> close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}

}
//THIS IS START SCRIPT FOR SEARCH CITY FROM MODAL CITY
function searchCiTyInModalFunc () {
	var  input, filter, parents, i, name;
	input = document.getElementById('searchCityInModal');
	console.log(input.value);
	filter = input.value.toUpperCase();
	parents = document.getElementsByClassName('citiesModalBody')[0];
	var cities =parents.getElementsByClassName('CityModalItem');
	for(i=0;i<cities.length;i++){
		name = cities[i].getElementsByClassName('infoOfCityInModal')[0].getElementsByTagName('div')[0];
		if(name.innerHTML.toUpperCase().indexOf(filter)>-1){
			cities[i].style.display='flex';
		}else {
			cities[i].style.display = 'none';
		}

	}
	
}
//THIS IS END SCRIPT FOR SEARCH CITY FROM MODAL CITY
// THIS IS START OF SESSION FOR SCRIPT TOP EXPERIENCES IMAGE SLIDE IM HOME.JSP
// FILE
var left = 0;
function showFrontSlideRight() {
	console.log("hello");
	var i;
	var slides = document.getElementsByClassName("frontSlide");
	var imgMarker = document.getElementsByClassName("top-experiences-shape-counter");
	var contents = document.getElementsByClassName("textInsideImg");
	var size = slides.length;
	// console.log(size);
	var count = 1;
	for (i = 0; i < size; i++) {
		slides[i].style.display = "none";
		imgMarker[i].style.display = "none";
		contents[i].style.display = "none";
	}
	while (true) {

		if (left < size) {

			console.log("In right 1");
			slides[left].style.display = "block";
			imgMarker[left].style.display = "block";
			contents[left].style.display = "block";
			console.log("count= " + count);
			console.log(left);
			left++;
		} else if (left >= size) {

			console.log("In right 2");
			left = 0;
			slides[left].style.display = "block";
			imgMarker[left].style.display = "block";
			contents[left].style.display = "block";
			console.log("count= " + count);
			console.log(left);
			left++;
		}
		if (count == 4) {
			break;
		}
		count++;
	}

}
function showFrontSlideLeft() {
	var i;
	var slides = document.getElementsByClassName("frontSlide");
	var imgMarker = document.getElementsByClassName("top-experiences-shape-counter");
	var contents = document.getElementsByClassName("textInsideImg");
	var size = slides.length;
	var count = 1;
	for (i = 0; i < size; i++) {
		slides[i].style.display = "none";
		imgMarker[i].style.display = "none";
		contents[i].style.display = "none";
	}
	while (true) {
		if (left == 0) {
			left = size - 1;
			console.log("In block 3");
			console.log(left);
			slides[left].style.display = "block";
			imgMarker[left].style.display = "block";
			contents[left].style.display = "block";
		} else {
			left--;
			console.log("In block 4");
			console.log(left);
			slides[left].style.display = "block";
			imgMarker[left].style.display = "block";
			contents[left].style.display = "block";
		}
		if (count == 4) {
			break;
		}
		count++;
	}

}

// THIS IS END OF SESSION FOR SCRIPT TOP EXPERIENCES IMAGE SLIDE IM HOME.JSP


