$(document).on('scroll', debounce(function() {
	$('#pictures[data-endless=""] .picture_group').each(function() {
		var self = $(this);
		if(self.visible()) {
			self.show();
		} else {
			self.hide();
		}
	});
}, 250));
