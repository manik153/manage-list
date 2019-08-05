$( document ).ready(function() {
	$("#form-submit").click(function(){
		if ($('#form-content').val() == ''){
			toastr["error"]("Content cannot be blank")
			return false
		}
	  $.ajax({
	  	url: "meta_form",
	  	type: 'POST',
	  	dataType: 'script',
	  	data: {type: $('#form-type').val(), content: $('#form-content').val(), list_id: $('#form-id').val()},
	  });
	});
	$("#restore-button").click(function(){
	  $.ajax({
	  	url: "restore_all",
	  	type: 'POST',
	  	dataType: 'script'
	  });
	});
	init();
});

function init() {
	$(".trash-list").click(function(){
	  $.ajax({
	  	url: "trash_list",
	  	type: 'POST',
	  	dataType: 'script',
	  	data: {id: $(this).parent().parent().parent().data('list')}
	  });
	});
	$(".trash-list-item").click(function(){
	  $.ajax({
	  	url: "trash_list_item",
	  	type: 'POST',
	  	dataType: 'script',
	  	data: {id: $(this).parent().parent().data('list-item')}
	  });
	});
	$(".restore-list").click(function(){
	  $.ajax({
	  	url: "restore_list",
	  	type: 'POST',
	  	dataType: 'script',
	  	data: {id: $(this).parent().parent().parent().data('list')}
	  });
	});
	$(".restore-list-item").click(function(){
	  $.ajax({
	  	url: "restore_list_item",
	  	type: 'POST',
	  	dataType: 'script',
	  	data: {id: $(this).parent().parent().data('list-item')}
	  });
	});
}