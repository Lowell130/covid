<%@page buffer="none" trimDirectiveWhitespaces="true"  taglibs="c,fn,fmt,cms"  %>
$(document).ready(function () {
	var time = 100;
<cms:device type="mobile">
	$('#accordion-tab-1-content-1').removeClass('show');
	$('#accordion-tab-2-content-1').removeClass('show');
	$('#accordion-tab-4-1-content-1').removeClass('show');
	$('#accordion-tab-4-2-content-1').removeClass('show');
	$('#accordion-tab-4-3-content-2').removeClass('show');
	$('#accordion-tab-4-4-content-2').removeClass('show');
	$('#accordion-tab-4-5-content-1').removeClass('show');
	$('#accordion-tab-5-content-1').removeClass('show');
</cms:device>
<cms:device type="desktop, tablet">
	setTimeout(function(){ $('.tab-pane.active h5 a').first().focus(); }, time);
</cms:device>
	function getUrlVars() {
		var vars = {};
		var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
			vars[key] = value;
		});
		return vars;
	}
	//var m = {'sanita':'tab1', 'lavoro':'tab2', 'liquidita':'tab4', 'fisco':'tab5'}
	var aa = ['tab1', 'tab2', 'tab4', 'tab5'];//, 'tab41', 'tab42', 'tab43', 'tab44'
	var k = getUrlVars()["s"];
	var a = parseInt(k);
	if(isNaN(a) || a < 1 || a > 4) a = 1;
	var v = aa[a -1];
	var l1 = $('#l1'), l11 = $('#l11'), l12 =  $('#l12'), l13 =  $('#l13'), l14 = $('#l14'), l15 = $('#l15');
	$('#faq-tabs a').click(function(e){
		if(!$(this).attr('id')){
			l1.removeClass('active2');
			l1.css('background-color', '');
		}
		$(this).blur();
		focusTarget($(this).attr('href'));
	});
	$(l1).click(function(e) {
		e.preventDefault();
		l11.click();
	})
	//f(!v) v = m['sanita'];
	if(a === 3) {
		l1.click();
	} else {
		$('#faq-tabs a[aria-controls='+v+']').click()
	}
	//setTimeout(function(){ $('a.nav-link.active').focus(); }, time);
	setTimeout(function(){ $('.tab-pane.active h5 a').first().focus(); }, time);
	
	$('#faq-tabs a').keypress(function(e){
		var keycode = (e.keyCode ? e.keyCode : e.which);
		if(keycode === 13){
			//console.log($(this).attr('id'));
			focusTarget($(this).attr('href'));
		}
	});
	$('.sub-nav-link').mouseover(function(e) {
		l1.css('background-color', '#f6f6f6');
	});
	$('.sub-nav-link').mouseout(function(e) {
		if(l11.hasClass('active') || l12.hasClass('active') || l13.hasClass('active') || l14.hasClass('active') || l15.hasClass('active')) return;
		l1.css('background-color', '');
	});	
	
	//active class on sub-nav-link
	$('.sub-nav-link').on('click', function() {
		l1.addClass('active2');
	});	

	function focusTarget(parent) {
		setTimeout(function(){
			if(parent === '#') return;
			var trgEl = parent + ' h5 a';
			var trg = $(trgEl).first();
			//trg.css('color', 'green');
			trg.focus();
		}, time);
	}
	$('#faq-tab-content .tab-pane').each(function(i) {
		var el = $(this).find('h5 a').last().last();
		id = 'last' + i;
		el.attr('id', id);
		id = '#' + id;
		//console.log(id);
		$(document).on('keydown', id ,function(e){
			var keycode = (e.keyCode ? e.keyCode : e.which);
			if(keycode === 9){
				var p = $(this).closest('.tab-pane').attr('id');
				//console.log(p);
				var n = $('#faq-tabs').find('a[href=#'+p+']').next();
					setTimeout(function(){
						n.focus();
					}, time);
			}
		});
		//el.css('color', 'fuchsia');
	})
	
	if(!!$('.carousel-control-prev').length) {
		$('.carousel-control-prev').click(function(e) {setFocus($(this));} )
		$('.carousel-control-next').click(function(e) {setFocus($(this));} )
		function setFocus(o) {
			setTimeout(function() {
				var p = o.parent().find('.active');
				var q = p.find('a');
				var r = q.first()
				r.focus();
			}, 100)
		}
	}
})