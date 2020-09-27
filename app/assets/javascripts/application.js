// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_nested_form
//= require bootstrap-sprockets
//= require_tree .




// レシピ画像プレビュー機能
$(function(){
	$('.file').on('change', function(){
		var file = $(this).prop('files')[0];
		var reader = new FileReader();
		reader.onload = function() {
			$(".img").attr('src', reader.result);
		}
		reader.readAsDataURL(file);
	});
})

// 手順画像プレビュー表示
$(function () {
  $('.step-file').on('change', function(){
     var file = $(this).prop('files')[0];
     var reader = new FileReader();

    reader.onload = function() {
      $('.step-img').attr('src', reader.result);
    }
    reader.readAsDataURL(file);
  });
})

// 材料フォーム追加
$(function(){
	var count = 0;
	$('#add').on('click', function(){
		var original = $('#ingredient-field\\[' + count + '\\]');
		var originCnt = count;

		count++;

		original.clone().insertAfter(original).attr('id', 'ingredient-field[' + count + ']').end().find('input, text_field').each(function(i,t){
			$(t).attr({
				id: $(t).attr('id').replace(/\[[0-9]\]+$/, '[' + count + ']'),
				name: $(t).attr('name').replace(/\[[0-9]\]+$/, '[' + count + ']')
			});
			$(t).val('');
		});
	});
})


$(function(){
	var count = 0;
	$('#add2').on('click', function(){
		var original = $('#step-field\\[' + count + '\\]');

		count++;

		original.clone().insertAfter(original).attr('id', 'step-field[' + count + ']').end().find('textarea, text_area').each(function(t,a){
			$(a).attr({
				id: $(a).attr('id').replace(/\[[0-9]\]+$/, '[' + count + ']'),
				name: $(a).attr('name').replace(/\[[0-9]\]+$/, '[' + count + ']')
			});
			$(a).val('');
		});

		// var image = $('#step-image-field\\[' + count + '\\]');
		// var originCloned = original.clone()

		// count++;

		// image.clone().appendTo(originCloned).attr('id', 'step-image-field[' + count + ']').end().find('input, attachment_field').each(function(i,f){
		// 	$(f).attr({
		// 		id: $(f).attr('id').replace(/\[[0-9]\]+$/, '[' + count + ']'),
		// 		name: $(f).attr('name').replace(/\[[0-9]\]+$/, '[' + count + ']')
		// 	});
		// 	$(f).val('');
		// });
	});
})


