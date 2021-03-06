(function($){
    "use strict";

    var globalDeferred = $.Deferred();
    $(window).bind('load',function(){
        // after loading all the scripts
        globalDeferred.resolve();
    });

    // waypoints helper functions
    $.fn.waypointInit = function(classN,offset,delay,inv){
        return $(this).waypoint(function(direction){
            var current = $(this);
            if(direction === 'down'){
                if(delay){
                    setTimeout(function(){
                        current.addClass(classN);
                    },delay);
                }
                else{
                    current.addClass(classN);
                }
            }else{
                if(inv == true){
                    current.removeClass(classN);
                }
            }
        },{ offset : offset })
    };

    // synchronise
    $.fn.waypointSynchronise = function (config) {
        var element = $(this);

        function addClassToElem(el, eq) {
            el.eq(eq).addClass(config.classN);
        }

        element.closest(config.container).waypoint(function (direction) {
            element.each(function (i) {
                if (direction === 'down') {

                    if (config.globalDelay != undefined) {
                        setTimeout(function () {
                            setTimeout(function () {
                                addClassToElem(element, i);
                            }, i * config.delay);
                        }, config.globalDelay);
                    } else {
                        setTimeout(function () {
                            addClassToElem(element, i)
                        }, i * config.delay);
                    }

                } else {

                    if (config.inv) {
                        setTimeout(function () {
                            element.eq(i).removeClass(config.classN);
                        }, i * config.delay);
                    }

                }
            });
        }, { offset: config.offset });
        return element;
    };

    globalDeferred.done(function () {

        // go to top button
        (function () {
            $('#go_to_top').waypointInit('animate_horizontal_finished', '0px', 0, true);
            $('#go_to_top').on('click', function () {
                $('html,body').animate({
                    scrollTop: 0
                }, 500);
            });
        })();

        // ie9 placeholder
        (function () {
            if ($('html').hasClass('ie9')) {
                $('input[placeholder]').each(function () {
                    $(this).val($(this).attr('placeholder'));
                    var v = $(this).val();
                    $(this).on('focus',function () {
                        if ($(this).val() === v) {
                            $(this).val("");
                        }
                    }).on("blur", function () {
                            if ($(this).val() == "") {
                                $(this).val(v);
                            }
                        });
                });

            }
        })();

        (function(){

            // current menu
            $('#main-menu a[data-node]').each(function () {
                if ($.inArray($(this).data('node'), PathArray) > -1){
                    $(this).parents('li.toplevel').find('> a').addClass('current');
                }
                if ( UiContext == 'browse' ) {
                    href = '/content/browse/' + $(this).data('node');
                }
            });
            if (window.location.pathname == UriPrefix){
                $('#main-menu a.home').parent().addClass('current');
            }

            // tooltip
            $('.has_tooltip').tooltip();

            //preview
            $('[data-load-remote]').on('click',function(e) {
                e.preventDefault();
                var $this = $(this);
                $($this.data('remote-target')).html('<em>Loading...</em>');
                var remote = $this.data('load-remote');
                if(remote) {
                    $($this.data('remote-target')).load(remote);
                }
            });


        })();

        // responsive menu
        window.rmenu = function () {

            var menuWrap = $('[role="navigation"]'),
                menu = $('.main_menu'),
                button = $('#menu_button');

            function orientationChange() {
                button.off('click tap').on('click tap', function () {
                    menuWrap.stop().slideToggle();
                    $(this).toggleClass('active');
                });
                menu.children('li').children('a').off('click tap').on('click tap', function (e) {
                    var self = $(this);
                    self
                        .closest('li')
                        .toggleClass('current_click')
                        .find('.sub_menu_wrap')
                        .stop()
                        .slideToggle()
                        .end()
                        .closest('li')
                        .siblings('li')
                        .removeClass('current_click')
                        .children('a').removeClass('prevented').parent()
                        .find('.sub_menu_wrap')
                        .stop()
                        .slideUp();
                    if (!(self.hasClass('prevented'))) {
                        e.preventDefault();
                        self.addClass('prevented');
                    } else {
                        self.removeClass('prevented');
                    }
                });
            }

            orientationChange();

            $(window).on('resize', orientationChange);

        };
        rmenu();

        $('.side_menu').on('click', 'span', function (e) {
            if ($(this).closest('li').children('ul').length) {
                $(this).closest('li').toggleClass('active');
                //$(this).closest('li').next().slideToggle();
                e.preventDefault();
            }
        });

        (function () {
            $('#go_to_top').waypointInit('animate_horizontal_finished', '0px', 0, true);
            $('#go_to_top').on('click', function () {
                $('html,body').animate({
                    scrollTop: 0
                }, 500);
            });
        })();

        (function () {
            $('.sw_button').on('click', function () {
                $(this).parent().toggleClass('opened').siblings().removeClass('opened');
            });
        })();

        var editServizioContainer = $('.ezcca-edit-servizio');
        var editUfficioContainer = $('.ezcca-edit-ufficio');
        if (editUfficioContainer.length > 0 && editUfficioContainer.length > 0){
            var showUfficiByServizio = function () {
                var selectedServizi = [];
                editServizioContainer.find('[name^="ContentObjectAttribute_data_object_relation_list_"]').each(function () {
                    var value = $(this).val();
                    if(($(this).is('input:checkbox') || $(this).is('input:radio')) && !$(this).is(':checked')){
                        value = 0;
                    }
                    if (value > 0 && value !== 'no_relation') selectedServizi.push(value);
                });
                if (selectedServizi.length > 0){
                    editUfficioContainer.find('.col-md-3 p').append('<i id="ufficio-loader" class="fa fa-circle-o-notch fa-spin"></i>');
                    $.opendataTools.find('select-fields [metadata.id] and classes [ufficio] and servizio.id in ['+selectedServizi.join(',')+'] limit 50', function (response) {
                        $('#ufficio-loader').remove();
                        editUfficioContainer.find('option').css("background","none");
                        editUfficioContainer.find('#ufficio-suggest').remove();
                        if (response.length > 0) {
                            if (editUfficioContainer.find('span.classattribute-description').length === 0){
                                editUfficioContainer.find('.col-md-9').prepend('<span class="classattribute-description"></span>');
                            }
                            $.each(response, function () {
                                editUfficioContainer.find('option[value="' + this + '"]').css("background","#ff0");
                            });
                            editUfficioContainer.find('span.classattribute-description').append(
                                '<span id="ufficio-suggest" style="display: block">Sono evidenziati gli uffici relativi al servizio selezionato</span>'
                            );
                        }
                    });
                }
            };
            showUfficiByServizio();
            editServizioContainer.find('[name^="ContentObjectAttribute_data_object_relation_list_"]').on('change', function () {
                showUfficiByServizio();
            });
        }

    });
})(jQuery);