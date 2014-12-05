$(document).ready(function(){
	// $('#username').val()
	// $('.f1').text($('#username').val());
	// $('.f1').text($('#username').val());
	// $('.f2').text($('#email').val());
	$('#actions').change(function(){
		
		// "hello" + ($('#username').val());
		if ($(this).val()=="yes")
		{
			$('.content-section').toggleClass('hidden');
			
			if ($('#username').val()=='')
			{
				$('.f1').text('NA')
			}
			else	
			{
				$('.f1').text($('#username').val());
			}
			if ($('#email').val()=='')
			{
				$('.f2').text('NA')
			}
			else
			{
				$('.f2').text($('#email').val());
			}
			if ($('#password').val()=='')
			{
				$('.f3').text('NA')
			}
			else
			{
				$('.f3').text($('#password').val());
			}
			if ($('#confirm_password').val()=='')
			{
				$('.f4').text('NA')
			}
			else
			{
				$('.f4').text($('#confirm_password').val());
			}	
			$('.f5').text("Hello " +  $('.f1').text()+ " with email: "+ $('.f2').text()+ " password: "+ $('.f3').text()+ " confirm password: "+$('.f4').text());
		}
		if ($(this).val()=="no")
		{
			$('.content-section').addClass('hidden');				
		}
		if ($(this).val()=="")
		{
			$('.content-section').addClass('hidden');			
		}

	});

	$('#username').change(function(){
		$('.f5').text("Hello " +  $(this).val()+ " with email: "+ $('.f2').text()+ " password: "+ $('.f3').text()+ " confirm password: "+$('.f4').text());		
	});

	$('#posts').change(function(){
		$.ajax({
		  dataType: "json",
		  url: "/welcome/get_comments",
		  data: {
		    post_id: $(this).val()
		  },
		  success: function( data ) {
		  	  $('#comments').empty();	
		      $.each(data, function(key, value) {
	            $('#comments').append("<option>"+value+'</option>');
	        });
		  }
		});
	});


	$('#post_body').change(function(){
		$.ajax({
		  dataType: "json",
		  url: "/welcome/comments_body",
		  data: {
		    post_id: $(this).val()
		  },
		  success: function( data ) {
		  	console.log(data);
		  	  $('#body').empty();	
		  	  // alert("ffffe");
		      $.each(data, function(key, value) {
	            $('#body').append("<option>"+value+'</option>');
	        });
		  }
		});
	});


});
	
