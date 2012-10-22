// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

jQuery(function($) {
	$('.upvote').on('ajax:success', function(data, status, xhr){
		console.log(status);
		$(this).next('.vote-count').html('<span class="vote-count">'+status+' votes </span>');
		//$(this).remove();
		console.log('success');
	});

	$(".upvote").on("mouseover", function () {
		$(this).tooltip('show');
	});
});

// jQuery(function($) {
// 	$('.upvote').on('click', function(e){
// 		e.preventDefault();
// 		$.ajax({
// 			url: '/posts/4/upvote',
// 			type: 'post',
// 			dataType: 'json',
// 			success: function(data) {
// 				$('.votes').val(data.id);
// 				console.log('success');
// 			}
// 		})
// 	});
// });
