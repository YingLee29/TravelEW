// $(document).on("click", "#submit_review", function(e){
// 	const { url }= e.currentTarget.dataset;
// 	$.ajax({
// 		url: url,
// 		dataType: 'json',
// 		type: 'post',
// 		data: {
// 			'comment': $('#text_review').val()
// 		},
// 		success: function(data) {
// 			console.log(data)
// 			let html = `<div><span style="color: #2980b9;">${data.user.name}: </span>${data.review.comment}</div>`
			
//       		$('#reviews_section').append(html);
// 			$('#text_review').val('');
//     	}
// 	});
// })
