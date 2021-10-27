$(document).ready(function() {
//------------------trent's slider
		$offset = $('.trent-slider').width();
		$tSlideInStyles = {left: '0', right: '0'}
		$t_loadBarStopStyles = {animation : "none", width : "0%"}
		$hiddenSlideStylesRight = {left: $offset, right: 0 - $offset}
		$hiddenSlideStylesLeft = {right: $offset, left: 0 - $offset}
		
		//slider functions
		function tStartLoadBar() {$('.t-load-bar .inner-load-bar').css('animation', 'load 4.5s linear infinite');}

		function tSliderHasStopped() {
			if ($('.current-t-slide').css('left') === "0px" && $('.current-t-slide').css('right') === "0px") {
				return true;
			} else {
				return false;
			}
		}

		function tSlideChangerRight() {
			if ($('.current-t-slide').next().hasClass('t-slide') && tSliderHasStopped()) {
				$('.current-t-slide').removeClass('current-t-slide').css($hiddenSlideStylesLeft).next().css($tSlideInStyles).addClass('current-t-slide');
				$('.current-dot').removeClass('current-dot').next().addClass('current-dot');
			} else if (tSliderHasStopped()) {
				$('.current-t-slide').removeClass('current-t-slide');
				$('.t-slide').first().addClass('current-t-slide').css($tSlideInStyles);
				tSetCss();
				$('.current-dot').removeClass('current-dot')
				$('.t-dot').first().addClass('current-dot');
			}
		}
		function tSlideChangerLeft() {
			if ($('.current-t-slide').prev().hasClass('t-slide') && tSliderHasStopped()) {
				$('.current-t-slide').removeClass('current-t-slide').css($hiddenSlideStylesRight).prev().css($tSlideInStyles).addClass('current-t-slide');
				$('.current-dot').removeClass('current-dot').prev().addClass('current-dot');
			} else if (tSliderHasStopped()) {
				$('.current-t-slide').removeClass('current-t-slide');
				$('.t-slide').last().addClass('current-t-slide').css($tSlideInStyles);
				tSetCssLeft();
				$('.current-dot').removeClass('current-dot')
				$('.t-dot').last().addClass('current-dot');
			}
		}

		function tSetCss() {
			$('.t-slide').each(function(index, value) {
				if (index > 0) {
					$(this).css($hiddenSlideStylesRight);
				}
			});
		}
		function tSetCssLeft() {
			$t_total = $('.t-slide').length - 1;
			$('.t-slide').each(function(index, value) {
				if (index < $t_total) {
					$(this).css($hiddenSlideStylesLeft)
				}
			});
		}


		//populate dots for every slide
		$('.t-slide').each(function(index, value) {
			$('.t-slide-dots').append('<div class="t-dot"></div>');
			if (index === 0) {$('.t-dot').first().addClass('current-dot')}
		});

		//slider-code
		$('.trent-slider').css('height', $('.trent-slider').width() / 2);
		tSetCss();
		//load bar 
		tStartLoadBar();
		$('.trent-slider').hover(function() {$('.t-load-bar .inner-load-bar').css($t_loadBarStopStyles);}, function() {tStartLoadBar()})
		//interval sllide change
		var tSlideChange = window.setInterval(function() {
			tSlideChangerRight();
		}, 5000);
		$('.trent-slider').mouseover(function() {
			clearInterval(tSlideChange);
		}).mouseout(function() {
			tSlideChange = window.setInterval(function() {
				tSlideChangerRight();
			},5000);
		});

		// -----slider controls
		//arrow
		$('.t-slider-controls .arrow').click(function() {
			if ($(this).hasClass('right-arrow')) {tSlideChangerRight();}
			else if ($(this).hasClass('left-arrow')) {tSlideChangerLeft();}
		});
		//dots 
		$('.t-slide-dots .t-dot').click(function() {
			$newDotIndex = $(this).index();
			$currentDotIndex = $('.current-dot').index();
			if (tSliderHasStopped()) {
				$('.t-slide').each(function(index, value) {
					$('.current-dot').removeClass('current-dot');
					$('.current-t-slide').removeClass('current-t-slide');
					$('.t-dot').eq($newDotIndex).addClass('current-dot');
					$('.t-slide').eq($newDotIndex).css($tSlideInStyles).addClass('current-t-slide');
					if (index > $newDotIndex) {
						$(this).css($hiddenSlideStylesRight);
					} else if (index < $newDotIndex) {
						$(this).css($hiddenSlideStylesLeft);
					}
				});
			}
		});
		//close slider JS
});