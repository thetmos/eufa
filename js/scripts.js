function fixCouponBackground() {
	$('#coupon_content_bg').css({
		width : $('#coupon_content_container').width(),
		height : $('#coupon_content_container').height()
	}).show();
}


function insertDateIndiv(sender, args) {
    $('#date_filterId').find('.divdateFilterInput').val(sender._selectedDate.format("dd/MM/yyyy"));
}



function addBet(betData)  {
    if (!$('#' + betData.gameId + '_' + betData.id).length) {
        var $couponItem = $('<div id="' + betData.gameId + '_' + betData.id + '" class="item"></div>').appendTo('#coupon_item_normal_content');
        var coupon_counter = parseInt($('#coupon_counter').text())+1;        
        if (coupon_counter > 2) {            
            $('#coupon_item_system').css('cursor', 'pointer');            
        }

        $('#coupon_counter').text(parseInt($('#coupon_item_normal_content .hidden_bet_id').length) + 1);     
        var couponItemHtml = '\
            <input type="hidden" class="hidden_bet_id" name="bet()" value="' + betData.id + '">\
			<span class="remove"></span>\
			<label><input class="checkbox" type="checkbox" />' + betData.players + '</label>\
			<div class="selection">Выбор: <strong>' + betData.title + '</strong> <span>' + betData.odd + '</span></div>\
		';
        var $system_additional = $('#system_additional');
        var system_additionalInnerHtml = '';        
        checked = 'checked';
        for (i = 2; i < coupon_counter; i++) {
            if (i != 2) {
                checked = '';
            }
            system_additionalInnerHtml += '<label><input type="radio" name="wincounts" class="system_additional_radiobutton" value="' + i + '" ' + checked + '>' + i + '/' + coupon_counter + '</label>';
        }
        $couponItem.append(couponItemHtml);
        $system_additional.html(system_additionalInnerHtml);
    }

    fixCouponBackground();    
}

//Оставляет видимыми только выбранные в левом столбце игры
function showOnlyFilteredGames(selectedChampsArray){    
    $('.date').css('display', 'none');
    $('.series').css('display', 'none');
    $('.sport').css('display', 'none');
    for (var i in selectedChampsArray) {
        $('#sports_bet_list').find('#' + selectedChampsArray[i]).css('display', 'block');
        $('#sports_bet_list').find('#' + selectedChampsArray[i]).closest('.sport').css('display', 'block');
        $('#sports_bet_list').find('#' + selectedChampsArray[i]).closest('.date').css('display', 'block');
    }
}


function RemoveBet (gameId, betId) {
    $('#' + gameId + '_' + betId).remove();
}

$(function () {
    $('.coupon_header_container').click(function () {
        $(this).children().toggleClass('opened');
        $('.coupon_content_container').slideToggle(100);
    });

    $('.date h3').click(function () {
        $(this).next().toggle().end().toggleClass('closed');
    });

    $('.rates_type h3').click(function () {
        $(this).next().toggle().end().toggleClass('opened');
    });

    /* rates events */
    $('.rate_double .arrow').click(function () {
        var This = $(this).parent()[0];
        $('.rate_double').each(function () {
            if (this == This) return true;
            $(this).removeClass('rate_double_opened');
        });
        $(this).parent().toggleClass('rate_double_opened');
    });

    $('.rate_f')
        .live('click', function () {
            $('.rate_double').removeClass('rate_double_opened');
            var $bet = $(this);
            var $parent = $bet.parent();
            if ($parent.is('.rate_double')) {
                $bet.prependTo($parent);
            }
            $bet.closest('.rates_group').find('.#span_odd').text($('#f_odd_' + this.id).text());
            $bet.closest('.rates_group').find('.#span_odd').attr('title', $('#f_odd_' + this.id).attr('title'));
        });

    $("#make_onebet").mouseover(function () {
        $(this).addClass('rate_hover_onebet');
    }).mouseout(function () {
        $(this).toggleClass('rate_hover_onebet');
    }).click(function () {

        var $parent_onebet = $(this).parents('.onebet_popup');
        var $onebet = $parent_onebet.find('.onebet');
        var $a = $onebet.find('.onebet_id').text();
        var $aa = $('.rate#' + $onebet.find('.onebet_id').text());
        $aa.removeClass('rate_selected');
        $aa.removeClass('rate_hover');
        var betSum_onebet = parseFloat($parent_onebet.find('.textfield').val());
        var $a = "b";
        if (betSum_onebet > 0) {
            $parent_onebet.find('.onebet_text').text('Подождите, идет запрос на сервер.');
            $('#layer_bg').addClass('layer_dark');
            $.post('make_one_bet.aspx', { eventId: $onebet.find('.onebet_id').text(), betSum: betSum_onebet }, function (data) {
                $onebet.find('.onebet_text').text($(data).find('data').attr('message'));                
                switch (parseInt($(data).find('data').attr('status'))) {
                    case 0:
                        setTimeout(function () {
                            $('#' + $onebet.find('.onebet_id').text()).removeClass('rate_selected');
                            $('#' + $onebet.find('.onebet_id').text()).removeClass('rate_hover');
                            $parent_onebet.css('display', 'none');
                            $('#layer_bg').removeClass('layer_dark');
                            jAlert($(data).find('data').attr('message'), 'Ставка произведена успешно.');
                        }, 3000);
                        break;
                    case 1:
                        $('#' + $onebet.find('.onebet_id').text()).removeClass('rate_selected');
                        $('#' + $onebet.find('.onebet_id').text()).removeClass('rate_hover');
                        $parent_onebet.find('.onebet_text').html($(data).find('data').attr('message') + '<br />');
                        $('#layer_bg').removeClass('layer_dark');
                        jAlert($(data).find('data').attr('message'), 'Ошибка!');
                        break;
                    default:
                        break;
                }
            }, 'xml');
        } else {
            $parent_onebet.find('.onebet_text').text('Введена неверная сумма. Сумма должна быть > 0');
        }
    });

    $('.cancel_button').click(function () {
        $(this).parents('.onebet_popup').css('display', 'none');
        var $onebet = $(this).parents('.onebet_popup').find('.onebet');
        var $aa = $('#' + $onebet.find('.onebet_id').text());
        $aa.removeClass('rate_selected');
        $aa.removeClass('rate_hover');
    });
    $('.add_button').click(function () {
        var $onebet = $(this).parents('.onebet_popup').find('.onebet');
        var $aa = $('#' + $onebet.find('.onebet_id').text());
        $aa.removeClass('rate_selected');
        $aa.removeClass('rate_hover');
        addBet({
            id: parseInt($onebet.find('.onebet_id').text()),
            title: $onebet.find('.onebet_title').text(),
            odd: $onebet.find('.onebet_odd').text(),
            players: $onebet.find('.onebet_players').text(),
            gameId: $onebet.find('.onebet_gameId').text()
        });
        $(this).parents('.onebet_popup').css('display', 'none');
    });
    $('.add_word').click(function () {
        var $onebet = $(this).parents('.onebet_popup').find('.onebet');
        var $aa = $('#' + $onebet.find('.onebet_id').text());
        $aa.removeClass('rate_selected');
        $aa.removeClass('rate_hover');
        addBet({
            id: parseInt($onebet.find('.onebet_id').text()),
            title: $onebet.find('.onebet_title').text(),
            odd: $onebet.find('.onebet_odd').text(),
            players: $onebet.find('.onebet_players').text(),
            gameId: $onebet.find('.onebet_gameId').text()
        });
        $(this).parents('.onebet_popup').css('display', 'none');
    });
    $('.cancel_word').click(function () {
        $(this).parents('.onebet_popup').css('display', 'none');
        var $onebet = $(this).parents('.onebet_popup').find('.onebet');
        var $aa = $('#' + $onebet.find('.onebet_id').text());
        $aa.removeClass('rate_selected');
        $aa.removeClass('rate_hover');
    });

    $('.rate').mouseover(function () {
        $(this).addClass('rate_hover');
    }).mouseout(function () {
        $(this).toggleClass('rate_hover');
    }).click(function () {
        document.getElementById("make_onebet").focus();
        $('#content').find('.rate_selected').removeClass('rate_selected').removeClass('rate_hover');
        $('.rate_double').removeClass('rate_double_opened');
        var gameId = $(this).closest('.game').attr('id'),
		        betId = $(this).attr('id');
        if ($(this).hasClass('rate_selected')) {
            RemoveBet(gameId, betId);
            return;
        }
        $(this).parents('.rates_group').find('.rate').removeClass('rate_selected').removeClass('rate_hover').end().end().addClass('rate_selected');

        var parent = $(this).parent();
        if (parent.is('.rate_double')) {
            $(this).prependTo(parent);
        }
        var positionWidth = screen.width / 2;
        var positionHeight = $(this).offset().top - 60; //document.getElementById(gameId).offsetTop;
        //window.scrollTo(0, positionHeight - 100);
        var $onebet = $('#onebet_popup').find('.onebet');
        //clear data
        $onebet.find('.onebet_id').text('');
        $onebet.find('.onebet_odd').text('');
        $onebet.find('.onebet_text').text('');
        $onebet.find('.onebet_title').text('');
        $onebet.find('.onebet_players').text('');
        $onebet.find('.onebet_gameId').text('');
        $('#onebet_popup').find('.header_onebet').text();
        $('#onebet_popup').find('#bet_sum').val('');
        $('#onebet_popup').find('.divtext').find('.onebet_text').text('');

        //add data
        $onebet.find('.onebet_id').text(betId);
        $onebet.find('.onebet_odd').text($(this).text());
        $onebet.find('.onebet_text').text($(this).attr('title') + ' ' + $(this).text());
        $onebet.find('.onebet_title').text($(this).attr('title'));
        $onebet.find('.onebet_players').text($(this).closest('.game').find('.game_main').find('.team').text());
        $onebet.find('.onebet_gameId').text(gameId);

        $('#onebet_popup').find('.header_onebet').text($(this).attr('title') + ' ' + $(this).text());
        $('#onebet_popup').css('top', parseInt(positionHeight) + 'px');
        $('#onebet_popup').css('left', positionWidth + 'px');
        $('#onebet_popup').css('display', 'block');
    });


    $('.more_rates').click(function () {
        if ($(this).parents('.game').hasClass('game_opened')) {
            $(this).parents('.game').removeClass('game_opened');
            $(this).text('+');
        }
        else {
            if (!$(this).parents('.game').hasClass('.game_live')) {
                $(this).parents('.game').addClass('game_opened');
                $(this).text('-');
            }
            else {
                window.open('live_popup.php', null, 'width=480,height=580,status=0,toolbar=0,location=0,menubar=0,directories=0,resizable=1,scrollbars=1');
            }
        }
    });


    $('.sub_rates_header').click(function () {
        if (!$(this).hasClass('sub_rates_opened')) {
            $(this).addClass('sub_rates_opened').next().slideDown(100);
        }
        else {
            $(this).removeClass('sub_rates_opened').next().slideUp(100);
        }
    });
    $('.subsub_rates_header').click(function () {
        if (!$(this).hasClass('sub_rates_opened')) {
            $(this).addClass('sub_rates_opened').next().slideDown(100);
        }
        else {
            $(this).removeClass('sub_rates_opened').next().slideUp(100);
        }
    });


    fixCouponBackground();

    $('#coupon_content #coupon_item_express').click(function () {
        $(this).siblings().removeClass('selected');
        $(this).addClass('selected');
        $('#system_additional').css('display', 'none');

        var itemID = $(this).attr('id');
        $('#' + itemID + '_content').show();

        fixCouponBackground();
    });

    $('#coupon_content #coupon_item_system').click(function () {
        var coupon_counter = parseInt($('#coupon_counter').text());
        if (coupon_counter > 2) {
            $('#system_additional').css('display', 'block');
            $(this).siblings().removeClass('selected');
            $(this).addClass('selected');
            var itemID = $(this).attr('id');
            $('#' + itemID + '_content').show();

            fixCouponBackground();
        }
    });

    $('#next_button').click(function () {
        var activeBetSystem = ""
        var winEventsCounter = $(this).parents('.coupon_actions').find('.system_additional').find('.system_additional_radiobutton[@name=wincounts]:checked').val();
        if ($(this).parents('.coupon_actions').parents('.coupon_content').find('#coupon_item_express').hasClass('selected')) {
            activeBetSystem = "express";
        }
        else {
            if ($(this).parents('.coupon_actions').parents('.coupon_content').find('#coupon_item_system').hasClass('selected')) {
                activeBetSystem = "system";
            }
        }
        itemsArray = new Array();
        itemsStr = '';
        $('#coupon_item_normal_content .item .hidden_bet_id').each(function () {
            itemsArray.push($(this).val());
        });
        itemsStr = itemsArray[0];
        for (i = 1; i < itemsArray.length; i++) {
            itemsStr += ',' + itemsArray[i];
        }
        var necessarilyCount = 2;
        var coupon_counter = parseInt($('#coupon_counter').text());
        var $betSum = $(this).parents('.coupon_actions').find('.sum').find('#betSum');
        var $betSum_onebet = parseFloat($betSum.val());
        if (activeBetSystem == "express") {
            if (coupon_counter < necessarilyCount) {
                jAlert('Для совершения ставки необходимо наличие в купоне не менее ' + necessarilyCount + ' ставок.', 'Недостаточно событий в купоне');
            }
            else {
                jConfirm('Вы подтвержаете, что согласны сделать ставку?', 'Подтверждение ставки', function (r) {
                    if (r == true) {
                        if ($betSum_onebet > 0) {
                            //$('#coupon_item_normal_content .item').fadeOut(300);
                            fixCouponBackground();
                            $('#layer_bg').addClass('layer_dark');
                            $.ajax({
                                type: "POST",
                                url: "make_combo_bet.aspx",
                                dataType: "xml",
                                data: "type=" + activeBetSystem + "&bet=" + itemsStr + "&betSum=" + $betSum_onebet,
                                success: function (data) {                                    
                                    switch (parseInt($(data).find('data').attr('status'))) {
                                        case 0:
                                            setTimeout(function () {
                                                $('#coupon_item_normal_content').html('');
                                                $('#coupon_counter').text('0');
                                                $('#system_additional').html('');
                                                $betSum.val('');
                                                fixCouponBackground();
                                                $('.coupon_header_container').children().toggleClass('opened');
                                                $('.coupon_content_container').slideToggle(100);
                                                $('#layer_bg').removeClass('layer_dark');
                                                jAlert($(data).find('data').attr('message'), 'Ставка произведена успешно.');
                                            }, 2000);
                                            break;
                                        case 1:
                                            $('#coupon_item_normal_content .item').fadeIn(300);
                                            $('#layer_bg').removeClass('layer_dark');
                                            jAlert($(data).find('data').attr('message'), 'Ошибка!');
                                            break;
                                        default:
                                            break;
                                    }
                                },
                                error: function () {
                                    $('#layer_bg').removeClass('layer_dark');
                                    $('#coupon_item_normal_content .item').fadeIn(300);
                                    jAlert('Извините, произошла ошибка. Попробуйте перезагрузить страницу и повторить попытку позже.', 'Ошибка!');
                                }
                            });
                        }
                        else {
                            jAlert('Сумма ставки должна быть больше 0', 'Недостаточная сумма ставки');
                        }
                    }
                });
            }
        }
        else {
            if (activeBetSystem == "system") {
                necessarilyCount = 3;
                if (coupon_counter <= winEventsCounter || winEventsCounter <= 0) {
                    jAlert('Количество событий для выигрыша должно быть больше 0 и меньше количества всех элементов в купоне.', 'Неправильно введено количество событий для выигрыша.');
                }
                if (coupon_counter < necessarilyCount) {
                    jAlert('Для совершения ставки необходимо наличие в купоне не менее ' + necessarilyCount + ' ставок.', 'Недостаточно событий в купоне');
                }
                if (coupon_counter > winEventsCounter && coupon_counter >= necessarilyCount && winEventsCounter > 0) {
                    $('#layer_bg').addClass('layer_dark');
                    $.ajax({
                        type: "POST",
                        url: "make_combo_bet.aspx",
                        dataType: "xml",
                        data: "type=" + activeBetSystem + "&bet=" + itemsStr + "&betSum=" + $betSum_onebet + '&winEventsCounter=' + winEventsCounter,
                        success: function (data) {                            
                            switch (parseInt($(data).find('data').attr('status'))) {
                                case 0:
                                    setTimeout(function () {
                                        $('#coupon_item_normal_content').html('');
                                        $('#coupon_counter').text('0');
                                        $('#system_additional').html('');
                                        $betSum.val('');
                                        fixCouponBackground();
                                        $('.coupon_header_container').children().toggleClass('opened');
                                        $('.coupon_content_container').slideToggle(100);
                                        $('#layer_bg').removeClass('layer_dark');
                                        jAlert($(data).find('data').attr('message'), 'Ставка произведена успешно.');
                                    }, 2000);
                                    break;
                                case 1:
                                    $('#coupon_item_normal_content .item').fadeIn(300);
                                    $('#layer_bg').removeClass('layer_dark');
                                    jAlert($(data).find('data').attr('message'), 'Ошибка!');
                                    break;
                                default:
                                    break;
                            }
                        },
                        error: function () {
                            $('#coupon_item_normal_content .item').fadeIn(300);
                            $('#layer_bg').removeClass('layer_dark');
                            jAlert('Извините, произошла ошибка. Попробуйте перезагрузить страницу и повторить попытку позже.', 'Ошибка!');
                        }
                    });
                }
            }
        }

    });

    $('#coupon_item_normal_content .remove').live('click', function () {
        $(this).parent().fadeOut(300, function () {
            $(this).remove();
            $('#coupon_counter').text(parseInt($('#coupon_counter').text()) - 1);
            $('#' + $(this).closest('.item').find('.hidden_bet_id').val()).removeClass('rate_hover rate_selected');
            fixCouponBackground();
        });
    });

    $('#left_actions .sub_actions label').click(function () {
        var selectedChampsArray = new Array();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            $(this).parents('li').find('input#' + $(this).attr('id')).removeAttr('checked');
        } else {
            $(this).addClass('selected');
            $(this).parents('li').find('input#' + $(this).attr('id')).attr('checked', 'checked');
        }
        $('#left_actions .sub_actions label').each(function () {
            if ($(this).hasClass('selected')) {
                selectedChampsArray.push(this.id);
            }
        });
        showOnlyFilteredGames(selectedChampsArray);
        $('#startMessage').css('display', 'none');
    });


    $('#left_actions .sub_actions .chkbxleftact').click(function () {
        var selectedChampsArray = new Array();
        var $a = $(this).attr('id');
        var $b = $(this).parents('li');
        var $bb = $(this).parents('li').find('label');
        var $bbb = $(this).parents('li').find('label#' + $(this).attr('id'));
        if ($(this).parents('li').find('label#' + $(this).attr('id')).hasClass('selected')) {
            $(this).parents('li').find('label#' + $(this).attr('id')).removeClass('selected');
            $(this).removeAttr('checked');
        } else {
            $(this).parents('li').find('label#' + $(this).attr('id')).addClass('selected');
            $(this).attr('checked', 'checked');
        }
        $('#left_actions .sub_actions label').each(function () {
            if ($(this).hasClass('selected')) {
                selectedChampsArray.push(this.id);
            }
        });
        showOnlyFilteredGames(selectedChampsArray);
        $('#startMessage').css('display', 'none');
    });

    $('#left_actions #sports_list li > a').live('click', function () {
        var $sport = $(this).parent();
        var sportId = $sport.attr('id');
        $sport.toggleClass('selected');
        return false;
    });

    $('#left_actions.menu li > a').live('click', function () {
        var $sport = $(this).parent();
        $sport.toggleClass('active');
        return false;
    });


    /* live events */
    $('.game_on_tv').hover(function () {
        $('<div>').attr('id', 'tv_hover_popup').addClass('tv_hover_container').css({
            top: $(this).offset().top - 48,
            left: $(this).offset().left + 30
        }).append(
			$('<div>').html($(this).children().html())
		).appendTo('body');
    }, function () {
        $('#tv_hover_popup').remove();
    });


    /* results events */
    $('.view_more_active').toggle(function () {
        $(this).parents('.game').toggleClass('game_expanded');
        $(this).parents('.game_main').next().slideDown(100);
    }, function () {
        $(this).parents('.game').toggleClass('game_expanded');
        $(this).parents('.game_main').next().slideUp(100);
    });

    if ($('#date_filter_input').length) {
        $('#date_filter_input').datepicker({
            firstDay: 1,
            dateFormat: 'dd.mm.yy',
            showAnim: 'fadeIn',
            duration: 200
        });

        $('.date_filter').click(function () {
            $('#date_filter_input').datepicker('show');
        });
    }


    /* withdraw addresses */
    $('.withdraw_action_button').toggle(function () {
        $(this).parents('.withdraw_item_details').next().slideDown(100);
    }, function () {
        $(this).parents('.withdraw_item_details').next().slideUp(100);
    });

    $('#allEventsToSHow').click(function () {
        $('.date').css('display', 'block');
        $('.series').css('display', 'block');
        $('.sport').css('display', 'block');
        $('#startMessage').css('display', 'none');
    });

    /* addmoney */
    $('.addmoney_action_button').toggle(function () {
        $(this).parents('.addmoney_item_details').next().slideDown(100);
    }, function () {
        $(this).parents('.addmoney_item_details').next().slideUp(100);
    });

    /* account payments */
    $('.account_payments_expand_link').toggle(function () {
        $(this).parents('tr').next('tr.details').show();
    }, function () {
        $(this).parents('tr').next('tr.details').hide();
    });

    /* account history */
    $('.account_history tr.express').toggle(function () {
        $(this).find('.details').show();
    }, function () {
        $(this).find('.details').hide();
    });

    /*live*/
    $('.futurem').click(function () {
        var $live = $('.live');
        $live.css('display', 'block');
        var $last = $('#liveleft').find('li .active');
        if ($(this).attr('id') != $last.attr('id')) {
            $last.removeClass('active');
            $(this).addClass('active');
        }
        $live.find('.livetitle').text($(this).parents('li').find('a:first-child').text());
        var $counter = $live.find('.count').find('.counter');
        var $matches = $live.find('.matches');
        $matches.html('');
        $counter.find('.series-single').text($(this).find('.content').find('.series-single').text());
        $counter.find('.series-title').text($(this).find('.content').find('.series-title').text());
        var $timer = '';
        /*
        timer
        timer
        timer
        timer
        timer
        */
        $counter.find('.series-time').text($timer);
        $('#div_mathes_post_status').css('display', 'block');
        $('#div_mathes_post_status').find('.mathes_post_status').text('Пожалуйста, подождите');
        $.post('livegame.aspx', { id: $(this).attr('id') }, function (data) {
            var appendHtml = '';
            var $a = $(data).find('events').find('oneevent');
            i = 0;
            j = 0;
            appendHtml += '\
                <div class="match" id="match_0">\
					<div class="header">Матч</div>\
					<div class="content">\
                    ';
            $(data).find('events').find('oneevent').each(function () {
                if (i % 3 == 0 && i != 0) {
                    j++;
                    appendHtml += '\
					        </div>\
				        </div>\
                        <div class="match" id="match_' + j + '">\
					        <div class="header">Матч</div>\
					        <div class="content">\
                            ';
                }
                appendHtml += '<span class="longchar" title="' + $(this).attr('name') + '" id="' + $(this).attr('id') + '"><div class="livebet" onclick="livebetclick(' + $(this).attr('id') + ', ' + j + ')">' + $(this).attr('name').slice(0, 7) + '</div><span>' + $(this).attr('odd') + '3.65</span></span>';
                i++;
            });
            appendHtml += '\
					</div>\
				</div>\
                ';
            $('#div_mathes_post_status').css('display', 'none');
            $matches.html(appendHtml);
        }, 'xml');
    });
    $('#live_make_onebet').click(function () {
        alert('af');
    });
});


function livemakeonebet() {  
    $(function () {
        var $a = this;
        jAlert('111Для совершения ставки необходимо наличие в купоне не менее ' + $(this).val() + ' ставок.', 'Недостаточно событий в купоне');
    });
}

function livebetclick(id, blockid) {
    if(!document.getElementById(id).className.match(new RegExp('(\\s|^)active(\\s|$)'))){
        
        var elements = document.getElementById('match_' + blockid).getElementsByTagName('div');
        var content;
        var contentFlag = false;
        for (var i = 0; i < elements.length; i++) {
            
            if ( elements[i].className=='content') {
                content=elements[i];
            }
        }

        var spans = content.getElementsByTagName('span')
        for (var i = 0; i < spans.length; i++) {
            if (spans[i].className.match(new RegExp('(\\s|^)active(\\s|$)'))) {
                spans[i].className = 'longchar';
                contentFlag = true;
            }
        }

        if (contentFlag == false) {
            content.innerHTML += '\
                            <div class="divbet">\
                            <br class="breaker">\
                            <div class="addbet"><div class="divform">\
							        <input type="text" value="" class="text"><input type="button" id="live_make_onebet" onclick="livemakeonebet()" value="Сделать" class="submit"><br>\
							        <div class="buttons"><input class="add_button" id="live_add_bet" type="button" value="">Добавить<input class="cancel_button" onclick="cancelbet(' + blockid + ')" id="live_cancel_bet" type="button" value="">Отменить</div>\
						    </div></div>\
                            <span class="desc">Максимальная ставка (100.000 AMD.)</span>\
                            </div>\
                            ';
        }
        document.getElementById(id).className += ' active';
    }
}

function cancelbet(blockid) {
    var elements = document.getElementById('match_' + blockid).getElementsByTagName('div');
    var content;
    var contentdivs;
    for (var i = 0; i < elements.length; i++) {
        if (elements[i].className == 'content') {
            content = elements[i];
        }
    }
    var spans = content.getElementsByTagName('span')
    for (var i = 0; i < spans.length; i++) {
        if (spans[i].className.match(new RegExp('(\\s|^)active(\\s|$)'))) {
            spans[i].className = 'longchar';
            contentFlag = true;
        }
    }
    contentdivs = content.getElementsByTagName('div');
    for (var i = 0; i < contentdivs.length; i++) {
        if (contentdivs[i].className == 'divbet') {
            contentdivs[i].innerHTML = '';
        }
    }    
}


