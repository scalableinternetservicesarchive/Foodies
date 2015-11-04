/* Google Maps Settings */
/*----------------------------------------------------------------*/
function google_map(){
	var map_position = new google.maps.LatLng(-37.8135, 144.97);
    var marker_position = new google.maps.LatLng(-37.8135, 144.97);
    var map;
    var marker;

    var mapOptions = {
        zoom: 13,
        scrollwheel: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        streetViewControl: true,
        center: map_position,
        styles:
        [
		  {
		    "stylers": [
		      { "hue": "#333739" },
		      { "saturation": -70 }
		    ]
		  }
		]
    };

    map = new google.maps.Map(document.getElementById('map'), mapOptions);

    marker = new google.maps.Marker({
        map:map,
        animation: google.maps.Animation.DROP,
        position: marker_position
    });
    google.maps.event.addListener(marker, 'click', toggleBounce);

    function toggleBounce() {
	    if (marker.getAnimation() != null) {
	            marker.setAnimation(null);
        } else {
            marker.setAnimation(google.maps.Animation.BOUNCE);
        }
    }
}


/* Change slide in Slider */
/*-----------------------------------------------------------------------*/
function change_slide(in_id, out_id){
	var slide_in = jQuery("#home-slider #slides > li:nth-child(" + in_id + ")");
	var slide_out = jQuery("#home-slider #slides > li:nth-child(" + out_id + ")");

	if (in_id>out_id) {
		slide_in.slideDown(600, function(){
			slide_out.hide();
		});
	} else {
		slide_in.show(0, function(){
			slide_out.slideUp(600);
		});
	}
}


function slide(btnclicked){

	if (!btnclicked.hasClass('active-slide') &&
		!jQuery("#home-slider #slides > li").is(':animated')) {

			slide_id_in = btnclicked.attr('data-id');
			slide_id_out = jQuery(".btn-slider a.active-slide").attr('data-id');

			change_slide(slide_id_in, slide_id_out);

			jQuery(".btn-slider a").removeClass();
			btnclicked.addClass('active-slide');

			return false;
		}
}


function autoRotate() {
	rotate = setInterval(function(){
		var id_active = jQuery(".btn-slider a.active-slide").attr('data-id');
		var id_in = ++id_active;
		var id_last = jQuery(".btn-slider li:last a").attr('data-id');

		if (id_in > id_last) id_in = 1;

		slide(jQuery(".btn-slider li a[data-id='" + id_in + "']"));
    }, 7000); /* <<< Auto rotate slides on every 7 secs */
}


/* Regular expression to validate email address */
/*-----------------------------------------------------------------------*/
function validateEmail(emailValue){
	var emailPattern = /^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/;
	return emailPattern.test(emailValue);
}


/* Validate Form fields */
/*-----------------------------------------------------------------------*/
function validateForm(bName, bEmail, bMessage, email_field) {
	var fields_valid = true;

	if (bName && jQuery("input#name").val().length < 1) {
		jQuery("input#name").css('border-color','#ffaaaa');
		fields_valid = false;
    }

	if (bEmail && !validateEmail(email_field)) {
		if(bMessage) {
			jQuery("input#email").css('border-color','#ffaaaa');
		}
		fields_valid = false;
    }

	if (bMessage && jQuery("textarea#message").val().length < 1) {
		jQuery("textarea#message").css('border-color','#ffaaaa');
		fields_valid = false;
    }

	return fields_valid;
}


/* Scale Effect */
/*-----------------------------------------------------------------------*/
function scaleIt($elem, offset) {
	jQuery(window).scroll(function() {

		if (offset == undefined) offset = 100;

		var docViewBottom = jQuery(window).scrollTop() + jQuery(window).height();

		bottomOffset = docViewBottom - offset;
		var elemTop = jQuery($elem).offset().top;

		if( bottomOffset >= elemTop) {
			jQuery($elem).removeClass("scale-it-off").addClass("scale-it-on");
		} else {
			jQuery($elem).removeClass("scale-it-on").addClass("scale-it-off");
		}

	})
}


/* Parallax Effect */
/*-----------------------------------------------------------------------*/
function parallax(elem) {

	jQuery(window).scroll(function() {

		var docViewTop = jQuery(window).scrollTop();
		var docViewBottom = docViewTop + jQuery(window).height();

		var elemTop = jQuery(elem).offset().top;
		var elemBottom = elemTop + jQuery(elem).height();

		if (docViewBottom >= elemTop && docViewTop <= elemBottom) {
			var elemY = (docViewBottom - elemBottom) / jQuery(window).height() * 100;

			var elemHeight = jQuery(elem).height();
			var parallaxBgHeight = jQuery(elem).find(".parallax-bg").height();
			var speed = (parallaxBgHeight - elemHeight) / elemHeight;

			var parallaxBgY = -elemY*speed;

			jQuery(elem).find(".parallax-bg").css('top', parallaxBgY + '%');
		}
	});
}



/*===================================================*/
/*                    jQuery MAIN                    */
/*===================================================*/

jQuery(function() {


	/* Preloader */
	/*-----------------------------------------------------------------------*/
	jQuery(window).load(function() {
		jQuery('#preloader').fadeOut();
		jQuery('#preloader-bg').delay(350).fadeOut('slow');
	});


	/* Function Calls */
	/*-----------------------------------------------------------------------*/
	if (jQuery("#home-slider").length){
		autoRotate();
	}

	if (jQuery("#map").length) {
		google_map();
	}

	if (jQuery(".flexslider").length) {
		jQuery('.flexslider').flexslider({
			animation: "slide",
			pauseOnAction: false,
			pauseOnHover: true,
			directionNav: false
		});
	}


	/* Custom Dropdown */
	/*-----------------------------------------------------------------------*/
	jQuery(".dropdown-menu").hover(
		function(){
			jQuery(this).parent().children("a").addClass("dropdown-hover");
		},
		function(){
			jQuery(this).parent().children("a").removeClass("dropdown-hover");
		});


	/* About Me scroll the page */
	/*-----------------------------------------------------------------------*/
	jQuery(".about-me").click(function() {
		jQuery("html, body").animate({
			scrollTop: jQuery('#about-me').offset().top }, 800);

		return false;
	});


	/* Parallax Effect */
	/*-----------------------------------------------------------------------*/
	if (jQuery(".parallax-bg").length) {
		parallax(".subscribe-container");
	}


	/* Scale Effect */
	/*-----------------------------------------------------------------------*/
	if (jQuery(".client-logos").length) {
		scaleIt(".client-logos");
	}

	if (jQuery(".social-networks").length) {
		scaleIt(".social-networks", 50);
	}


	/* Toggle top margin of Home Slider when navigation opens */
	/*-----------------------------------------------------------------------*/
	jQuery(".navbar-toggle").click(function() {

		var navClosed = jQuery("#custom-nav").hasClass("collapse");
		var navOpened = jQuery("#custom-nav").hasClass("in");

		if (navClosed) {
			jQuery("#home-slider").animate({top: "+=70px"}, 100)
			.css("margin-bottom", "0px");
		} else if (navOpened) {
			jQuery("#home-slider").animate({top: "-=70px"}, 100)
			.css("margin-bottom", "-70px");
		}
	});


	/* Home Slider */
	/*-----------------------------------------------------------------------*/
	var btn_slider = jQuery(".btn-slider");
	btn_slider.css('margin-left', -(btn_slider.width()/2)+3);

	jQuery("#home-slider #slides > li:first").show();

	// pause auto rotation on btn-slider hover
	jQuery(".btn-slider li a").hover(
		function() { clearInterval(rotate); },
		function() { autoRotate(); })

	// change slide on btn-slider button click
	jQuery(".btn-slider li a").click(function() {
		slide(jQuery(this));
		jQuery("html, body").stop().animate({scrollTop: 0}, 'slow');
		return false;
	});


	/* Hover fix for touch screens */
	/*-----------------------------------------------------------------------*/
	jQuery(".work-item").click(function() {
		jQuery(".work-item .item-info").removeClass("touch-screen");
		jQuery(this).children(".item-info").addClass("touch-screen");
	});


	/* Modal Lightbox */
	/*-----------------------------------------------------------------------*/
	jQuery(".trigger-modal")
	.hover(
		function() {
			jQuery(this).children("a").animate({
			    opacity: 1,
			    top: "+=25%"
			}, 300);
		},

		function() {
			jQuery(this).children("a").stop().css({
				'opacity': 0,
				'top': '25%'});
		});

	// Center Modal verticaly
	jQuery(window).resize(function() {

		var docWidth = jQuery(window).width();
		var docHeight = jQuery(window).height();

		if (docWidth > 1040) var modalHeight = 600;
		else if (docWidth > 768) var modalHeight = 457;
		else if (docWidth > 620) var modalHeight = 375;
		else if (docWidth > 300) var modalHeight = 180;

		var modalTop = (docHeight - modalHeight) / 2 / docWidth * 100;

		jQuery(".modal-dialog").css('margin-top', modalTop + '%');
	});

	jQuery(window).resize();


	/* Submitting Subscribe Form using AJAX */
    /*-----------------------------------------------------------------------*/
	jQuery("form#subscribe").submit(function() {

		var dataString = jQuery(this).serialize();
		var email_field = jQuery("#subscribe input#subscribe-email");

		if(validateForm(0,1,0,email_field)){
			jQuery.ajax({
			type: "POST",
			url: "php/subscribe.php",
			data: dataString,
			success: function() {
				jQuery('#subscribe').fadeOut('slow', function() {
                    jQuery(this).html("<div id='confirm-subscribe'></div>");
                    jQuery('#confirm-subscribe').html("Your Request Was Successfully Submitted!");
                    jQuery(this).fadeIn('slow');
                })
			}
			});
		}
		return false;
	});


	/* Form fields on focus/blur change border color */
    /*---------------------------------------------------------------------*/
    jQuery("input#name, input#email:not('.subscribe'), textarea#message").bind("focus", function(){
		jQuery(this).css('border','1px solid #737779');
	});

	jQuery("input#name, input#email:not('.subscribe'), textarea#message").bind("blur", function(){
		jQuery(this).css('border','1px solid #c3c7c9');
	});


	/* Submitting Contact Form using AJAX */
    /*-----------------------------------------------------------------------*/
	jQuery("form#contact").submit(function() {

		var name_field = jQuery("#contact #name").val();
        var email_field = jQuery("#contact #email").val();
        var message_field = jQuery("#contact #message").val();

        var dataString = 'name=' + name_field
        			   + '&email=' + email_field
        			   + '&message=' + message_field;

		if(validateForm(1,1,1,email_field)){
			jQuery.ajax({
			type: "POST",
			url: "php/send_mail.php",
			data: dataString,
			success: function() {
				jQuery('#contact').fadeOut('slow', function(){
                    jQuery(this).html('<div id="confirm-message"></div>');

                    jQuery('#confirm-message').html('<h4>Your message has been sent successfully</h4>')
				    	.append('<p>We will be in touch with you very soon... Best Regards!</p>');

                    jQuery(this).fadeIn('slow');
                })
			}
			});
		}
		return false;
	});


	/* Scroll Page To Top */
	/*-----------------------------------------------------------------------*/
	jQuery(".to-top a").click(function() {
		jQuery("html, body").stop().animate({scrollTop: 0}, 'slow');
		return false;
	});

})
