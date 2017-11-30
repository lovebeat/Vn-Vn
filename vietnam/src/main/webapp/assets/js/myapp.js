$(function(){
	
	//dismissing the alert after 2 seconds
	var $alert = $('.alert');
	if($alert.length){
		setTimeout(function(){
			$alert.fadeOut('fast');
		},2000)
	}
	
	
	
	//timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
	
	
	
	//----------------DAtatable for admin
	
	var $adminCityTable = $('#adminCityTable');

	// execute the below code only where are have this table

	if ($adminCityTable.length) {
		// console.log('Inside the table !');
		var jsonUrl = window.contextRoot + '/json/data/admin/all/city';
		
		$adminCityTable.DataTable({

			lengthMenu : [ [ 10, 30, 50, -1 ],
					[ '10', '30', '50', 'All' ] ],
			pageLength : 10,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
			
				{
					data: 'id',
					bSortable: false,
				},
				{
					data: 'name'
				},
			
				{
					data : 'code',
					bSortable: false,
					mRender: function(data, type, row){
						return '<img src ="' + window.contextRoot + '/resources/images/'+row.name+'/' + data + '.jpg" class="adminDataTableImg" style="height: 80px;width: 120px;" />'
					}
				}, 
				{
					data : 'description',
				}, 
				
				{
					data : 'active',
					bSortable: false,
					mRender: function(data, type, row){
						var str='';
						str	+='<label class="switch">';
						if(data){
							str+='<input type="checkbox" checked="checked" value="'+row.id+'">';
							
						}else{
							str+='<input type="checkbox" value="'+row.id+'">';
						}
						
						str+= '<div class = "slider"></div></label>';
						return str;
							
					}
					
				},
				{
					data:'id',
					bSortable : false,
					mRender : function(data, type, row) {

						var str = '';
						str += '<a href="'
								+ window.contextRoot
								+ '/manage/'
								+ data
								+ '/city" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

						return str;
					}
				}
				
			],
			
			initComplete: function () {
				var api = this.api();
				api.$('.switch input[type="checkbox"]').on('change' , function() {							
					var dText = (this.checked)? 'You want to activate the City?': 'You want to de-activate the City?';
					var checked = this.checked;
					var checkbox = $(this);
					debugger;
				    bootbox.confirm({
				    	size: 'medium',
				    	title: 'City Activation/Deactivation',
				    	message: dText,
				    	callback: function (confirmed) {
					        if (confirmed) {
					            $.ajax({							            	
					            	type: 'GET',
					            	url: window.contextRoot + '/manage/city/'+checkbox.prop('value')+'/activation',
					        		timeout : 100000,
					        		success : function(data) {
					        			/*displaySnackbar(data);*/	
					        			bootbox.alert(data);
					        		},
					        		error : function(e) {
					        			/*displaySnackbar('ERROR: '+ e);*/
					        			bootbox.alert('ERROR: '+ e);
					        			//display(e);
					        		}						            	
					            });
					        }
					        else {							        	
					        	checkbox.prop('checked', !checked);
					        }
						}
					});
				});
			}

		});

	}
	//------------
	
	
//----------------DAtatable for place admin
	
	var $adminPlaceTable = $('#adminPlaceTable');

	// execute the below code only where are have this table

	if ($adminPlaceTable.length) {
		// console.log('Inside the table !');
		var jsonUrl = window.contextRoot + '/json/data/admin/all/place';
		
		$adminPlaceTable.DataTable({

			lengthMenu : [ [ 10, 30, 50, -1 ],
					[ '10', '30', '50', 'All' ] ],
			pageLength : 10,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
			
				{
					data: 'id',
					bSortable: false,
				},
				{
					data: 'name'
				},
				{
					data: 'city.name'
				},
			
				{
					data : 'code',
					bSortable: false,
					mRender: function(data, type, row){
						return '<img src ="' + window.contextRoot + '/resources/images/' + row.city.name +'/'+row.name+ '/' + data + '.jpg" class="adminDataTableImg" style="height: 80px;width: 120px;" />'
					}
				}, 
				{
					data : 'description',
				}, 
				
				{
					data : 'active',
					bSortable: false,
					mRender: function(data, type, row){
						var str='';
						str	+='<label class="switch">';
						if(data){
							str+='<input type="checkbox" checked="checked" value="'+row.id+'">';
							
						}else{
							str+='<input type="checkbox" value="'+row.id+'">';
						}
						
						str+= '<div class = "slider"></div></label>';
						return str;
							
					}
					
				},
				{
					data:'id',
					bSortable : false,
					mRender : function(data, type, row) {

						var str = '';
						str += '<a href="'
								+ window.contextRoot
								+ '/manage/'
								+ data
								+ '/place" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

						return str;
					}
				}
				
			],
			
			initComplete: function () {
				var api = this.api();
				api.$('.switch input[type="checkbox"]').on('change' , function() {							
					var dText = (this.checked)? 'You want to activate the Place?': 'You want to de-activate the Place?';
					var checked = this.checked;
					var checkbox = $(this);
					debugger;
				    bootbox.confirm({
				    	size: 'medium',
				    	title: 'Place Activation/Deactivation',
				    	message: dText,
				    	callback: function (confirmed) {
					        if (confirmed) {
					            $.ajax({							            	
					            	type: 'GET',
					            	url: window.contextRoot + '/manage/place/'+checkbox.prop('value')+'/activation',
					        		timeout : 100000,
					        		success : function(data) {
					        			/*displaySnackbar(data);*/
					        			bootbox.alert(data)
					        		},
					        		error : function(e) {
					        			/*displaySnackbar('ERROR: '+ e);*/
					        			bootbox.alert('ERROR: '+ e);
					        			//display(e);
					        		}						            	
					            });
					        }
					        else {							        	
					        	checkbox.prop('checked', !checked);
					        }
						}
					});
				});
			}

		});

	}
	//------------
	
	
//----------------DAtatable for food admin
	
	var $adminFoodTable = $('#adminFoodTable');

	// execute the below code only where are have this table

	if ($adminFoodTable.length) {
		// console.log('Inside the table !');
		var jsonUrl = window.contextRoot + '/json/data/admin/all/food';
		
		$adminFoodTable.DataTable({

			lengthMenu : [ [ 10, 30, 50, -1 ],
					[ '10', '30', '50', 'All' ] ],
			pageLength : 10,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
			
				/*{
					data: 'id',
					bSortable: false,
				},*/
				{
					data: 'name'
				},
				{
					data: 'city.name'
				},
				/*{
					data: 'place.name'
				},*/
				
				
				{
					data : 'code',
					bSortable: false,
					mRender: function(data, type, row){
						return '<img src ="' + window.contextRoot + '/resources/images/' + row.city.name +'/food/' + row.name+ '/' + data + '.jpg" class="adminDataTableImg" style="height: 80px;width: 120px;" />'
					}
				}, 
				
				{
					data: 'address'
				},
				{
					data: 'priceMin',
						mRender : function(data, type, row) {
							return '&#8363;' + data
						}
				},
				{
					data: 'priceMax',
					mRender : function(data, type, row) {
						return '&#8363;' + data
					}
				},
				{
					data: 'hoursOpen'
				},
				{
					data: 'hoursClose'
				},
				{
					data: 'contact'
				},
				
				
				{
					data : 'active',
					bSortable: false,
					mRender: function(data, type, row){
						var str='';
						str	+='<label class="switch">';
						if(data){
							str+='<input type="checkbox" checked="checked" value="'+row.id+'">';
							
						}else{
							str+='<input type="checkbox" value="'+row.id+'">';
						}
						
						str+= '<div class = "slider"></div></label>';
						return str;
							
					}
					
				},
				{
					data:'id',
					bSortable : false,
					mRender : function(data, type, row) {

						var str = '';
						str += '<a href="'
								+ window.contextRoot
								+ '/manage/'
								+ data
								+ '/food" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

						return str;
					}
				}
				
			],
			
			initComplete: function () {
				var api = this.api();
				api.$('.switch input[type="checkbox"]').on('change' , function() {							
					var dText = (this.checked)? 'You want to activate the Food?': 'You want to de-activate the Food?';
					var checked = this.checked;
					var checkbox = $(this);
					debugger;
				    bootbox.confirm({
				    	size: 'medium',
				    	title: 'Food Activation/Deactivation',
				    	message: dText,
				    	callback: function (confirmed) {
					        if (confirmed) {
					            $.ajax({							            	
					            	type: 'GET',
					            	url: window.contextRoot + '/manage/food/'+checkbox.prop('value')+'/activation',
					        		timeout : 100000,
					        		success : function(data) {
					        			/*displaySnackbar(data);*/		
					        			bootbox.alert(data)
					        		},
					        		error : function(e) {
					        			/*displaySnackbar('ERROR: '+ e);*/
					        			bootbox.alert('ERROR: '+ e);
					        			//display(e);
					        		}						            	
					            });
					        }
					        else {							        	
					        	checkbox.prop('checked', !checked);
					        }
						}
					});
				});
			}

		});

	}
	//------------
	
	
	
//----------------DAtatable for hotel
	
	var $providerHotelTable = $('#providerHotelTable');

	// execute the below code only where are have this table

	if ($providerHotelTable.length) {
		// console.log('Inside the table !');
		var jsonUrl = window.contextRoot + '/json/data/provider/all/hotelApprove';
		
		$providerHotelTable.DataTable({

			lengthMenu : [ [ 3, 6, 9, -1 ],
					[ '3', '6', '9', 'All' ] ],
			pageLength : 3,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
			
				{
					data: 'id',
					bSortable: false,
				},
				{
					data: 'name'
				},
				
				{
					data : 'code',
					bSortable: false,
					mRender: function(data, type, row){
						return '<img src ="' + window.contextRoot + '/resources/images/hotel/' + row.name+ '/' + data + '.jpg" class="adminDataTableImg" style="height: 80px;width: 120px;" />'
					}
				}, 
				{
					data: 'where'
				},
			
				
				{
					data: 'star'
				},
				{
					data: 'phone'
				},
				
				{
					data : 'active',
					bSortable: false,
					mRender: function(data, type, row){
						var str='';
						str	+='<label class="switch">';
						if(data){
							str+='<input type="checkbox" checked="checked" value="'+row.id+'">';
							
						}else{
							str+='<input type="checkbox" value="'+row.id+'">';
						}
						
						str+= '<div class = "slider"></div></label>';
						return str;
							
					}
					
				},
				
				{
					data:'id',
					bSortable : false,
					mRender : function(data, type, row) {

						var str = '';
						str += '<a href="'
								+ window.contextRoot
								+ '/provider/'
								+ data
								+ '/detailRoom" class="btn btn-primary"><span class="glyphicon glyphicon-arrow-right"></span></a> &#160;';

						return str;
					}
				}
				
			],
			
			initComplete: function () {
				var api = this.api();
				api.$('.switch input[type="checkbox"]').on('change' , function() {							
					var dText = (this.checked)? 'You want to activate ?': 'You want to de-activate ?';
					var checked = this.checked;
					var checkbox = $(this);
					debugger;
				    bootbox.confirm({
				    	size: 'medium',
				    	title: 'Activation/Deactivation',
				    	message: dText,
				    	callback: function (confirmed) {
					        if (confirmed) {
					            $.ajax({							            	
					            	type: 'GET',
					            	url: window.contextRoot + '/provider/hotel/'+checkbox.prop('value')+'/activation',
					        		timeout : 100000,
					        		success : function(data) {
					        			displaySnackbar(data);		
					        			bootbox.alert(data)
					        		},
					        		error : function(e) {
					        			displaySnackbar('ERROR: '+ e);
					        			bootbox.alert('ERROR: '+ e);
					        			//display(e);
					        		}						            	
					            });
					        }
					        else {							        	
					        	checkbox.prop('checked', !checked);
					        }
						}
					});
				});
			}

		});

	}
	//------------
	
	//-------validaton code for login-form
		
	$loginForm = $('#loginForm');
	
	if($loginForm.length) {
		
		$loginForm.validate({			
				rules: {
					username: {
						required: true,
						email: true
						
					},
					password: {
						required: true
					}				
				},
				messages: {					
					username: {
						required: 'Please enter your email!',
						email: 'Please enter a valid email address!'
					},
					password: {
						required: 'Please enter your password!'
					}					
				},
				errorElement : "em",
				errorPlacement : function(error, element) {
					// Add the 'help-block' class to the error element
					error.addClass("help-block");
					
					// add the error label after the input element
					error.insertAfter(element);
				}				
			}
		
		);
		
	}
	
	//---------end
	
	// for handling CSRF token
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	
	if((token!=undefined && header !=undefined) && (token.length > 0 && header.length > 0)) {		
		// set the token header for the ajax request
		$(document).ajaxSend(function(e, xhr, options) {			
			xhr.setRequestHeader(header,token);			
		});				
	}
	
//----------------DAtatable for hotel wait approve
	
	var $providerHotelWaitApprove = $('#providerHotelWaitApprove');

	// execute the below code only where are have this table

	if ($providerHotelWaitApprove.length) {
		// console.log('Inside the table !');
		var jsonUrl = window.contextRoot + '/json/data/provider/all/hotelNotApprove';
		
		$providerHotelWaitApprove.DataTable({

			lengthMenu : [ [ 3, 6, 9, -1 ],
					[ '3', '6', '9', 'All' ] ],
			pageLength : 3,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
			
				{
					data: 'id',
					bSortable: false,
				},
				{
					data: 'name'
				},
				
				{
					data: 'where'
				},
				{
					data: 'phone'
				},
				
				
				{
					data:'id',
					bSortable : false,
					mRender : function(data, type, row) {

						var str = '';
						str += '<a href="'
								+ window.contextRoot
								+ '/manage/'
								+ data
								+ '/approveHotel" class="btn btn-primary"><span class="glyphicon glyphicon-arrow-right"></span></a> &#160;';

						return str;
					}
				}
				
			],
			

		});

	}
	//-----------
	
//----------------DAtatable for hotel wait approve in provider side
	
	var $providerHotelWait = $('#providerHotelWait');

	// execute the below code only where are have this table

	if ($providerHotelWait.length) {
		// console.log('Inside the table !');
		var jsonUrl = window.contextRoot + '/json/data/provider/all/hotelNotApproves';
		
		$providerHotelWait.DataTable({

			lengthMenu : [ [ 3, 6, 9, -1 ],
					[ '3', '6', '9', 'All' ] ],
			pageLength : 3,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
			
				{
					data: 'id',
					bSortable: false,
				},
				{
					data: 'name'
				},
				{
					data : 'code',
					bSortable: false,
					mRender: function(data, type, row){
						return '<img src ="' + window.contextRoot + '/resources/images/hotel/' + row.name+ '/' + data + '.jpg" class="adminDataTableImg" style="height: 80px;width: 120px;" />'
					}
				},
				
				{
					data: 'where'
				},
				{
					data: 'phone'
				},
				{
					data : 'active',
					bSortable: false,
					mRender: function(data, type, row){
						var str='';
						str	+='<label class="switch">';
						if(data){
							str+='<input type="checkbox" checked="checked" value="'+row.id+'">';
							
						}else{
							str+='<input type="checkbox" value="'+row.id+'">';
						}
						
						str+= '<div class = "slider"></div></label>';
						return str;
							
					}
					
				},
				{
					data:'id',
					bSortable : false,
					mRender : function(data, type, row) {

						var str = '';
						str += '<a href="'
								+ window.contextRoot
								+ '/provider/'
								+ data
								+ '/hotel" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

						return str;
					}
				}
				
				
				
				
			],
			
			initComplete: function () {
				var api = this.api();
				api.$('.switch input[type="checkbox"]').on('change' , function() {							
					var dText = (this.checked)? 'You want to activate ?': 'You want to de-activate ?';
					var checked = this.checked;
					var checkbox = $(this);
					debugger;
				    bootbox.confirm({
				    	size: 'medium',
				    	title: 'Activation/Deactivation',
				    	message: dText,
				    	callback: function (confirmed) {
					        if (confirmed) {
					            $.ajax({							            	
					            	type: 'GET',
					            	url: window.contextRoot + '/provider/hotel/'+checkbox.prop('value')+'/activation',
					        		timeout : 100000,
					        		success : function(data) {
					        			displaySnackbar(data);		
					        			bootbox.alert(data)
					        		},
					        		error : function(e) {
					        			displaySnackbar('ERROR: '+ e);
					        			bootbox.alert('ERROR: '+ e);
					        			//display(e);
					        		}						            	
					            });
					        }
					        else {							        	
					        	checkbox.prop('checked', !checked);
					        }
						}
					});
				});
			}

		});

	}
	//-----------
	
	
	
	
	
	
	// display snack bar
	function displaySnackbar(result){
	    // Get the snackbar DIV
	    var x = document.getElementById("snackbar");
	    x.innerHTML = result
	    // Add the "show" class to DIV
	    x.className = "show";
	    // After 3 seconds, remove the show class from DIV
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	}

	
	
	
	
	
	
});