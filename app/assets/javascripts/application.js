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
// $(function () {
//   $('.step-file').on('change', function(){
//      var $files = $(this).prop('files');
//      var len = $files.length;
//      for ( var i = 0; i < len; i++ ) {
//       var file = $files[i];
//      	var reader = new FileReader();

// 	    reader.onload = function() {
// 	      $('.step-img').attr('src', reader.result);
// 	    }
//     	reader.readAsDataURL(file);
//   	}
//   });
// })

// 材料フォーム追加
$(function() {
  var count = $('#ingredient-box').length;
    $('#add').on('click', function() {
    var input =
        '<div id="ingredient-field[' + count +']">'
        + '<li>'
        + '<input placeholder="材料名" name="recipe[ingredients_attributes][' + count + '][name]" id="recipe_ingredients_attributes_' + count + '_name" class="form group--form__ingredient" type="text">'
        + '・・・'
        + '<input placeholder="分量" name="recipe[ingredients_attributes][' + count + '][quantity]" id="recipe_ingredients_attributes_' + count + '_quantity" class="form" type="text">'
        + '</li>'
        +'</div>'
    $('#ingredient-box').append(input);
    count ++;
  });
});

// 手順フォーム追加
$(function() {
  var count = $('#step-box').length;
  $('#add2').on('click', function() {
    var input =
         '<div id="step-field[' + count +']">'
        + '<li class="group--step-form">'
        + '<textarea name="recipe[steps_attributes][' + count + '][text]" id="recipe_steps_attributes_' + count + '_text" class="form group--step-form__step"></textarea>'
        + '<div id="step-image-field[' + count +']" class="group--step-form__image preview_' + count + '">'
				+	'<label for="recipe_steps_attributes_' + count + '_step_images_step_image">'
				+ '<img height="80px" class="step-img" src="/assets/no-a5f1d9ff311e907fb87093b1862ca98110b27370235519e530e05b1a6ac1ac6f.jpg">'
				+ '<input value="{}" data-reference="bbbbc08269842b829b74d1edbc6aea2c" type="hidden" name="recipe[steps_attributes][' + count + '][step_images][step_image]">'
				+ '<input name="recipe[steps_attributes][' + count + '][step_images][step_image]" id="recipe_steps_attributes_' + count + '_step_images_step_image" class="step-file image--button" type="file">'
        + '</label>'
        + '</div>'
        + '</li>'
        + '</div>'
    $('#step-box').append(input);
    count ++;
  });

  $(document).on('change', '.step-file', function(){
  	var id = $(this).attr('id').replace(/[^0-9]/g, '');
  	var file = $(this).prop('files')[0];
    var reader = new FileReader();

    reader.onload = function() {
    	$(`.preview_${id} img`).attr('src', reader.result);
    }
    reader.readAsDataURL(file);
  });
});



