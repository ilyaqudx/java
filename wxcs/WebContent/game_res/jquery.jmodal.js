/// <reference path="jquery.js"/>
/*
 * jmodal
 * version: 3.0 (05/13/2009)
 * @ jQuery v1.3.*
 *
 * Licensed under the GPL:
 *   http://gplv3.fsf.org
 *
 * Copyright 2008, 2009 Jericho [ thisnamemeansnothing[at]gmail.com ] 
 *  
*/
$.extend($.fn, {
    jmodal: function(setting) {
        var ps = $.fn.extend({
            data: {},
            marginTop: 100,
            buttonText: { ok: 'Ok', cancel: 'Cancel' },
            okEvent: function(e) { },
            width: 400,
            fixed: true,
            noCancel: false,
            title: 'JModal Dialog',
            content: 'This is a jquery plugin!',
            skinId: 'jmodal-main'
        }, setting);
        var allSel = $('select').hide(), doc = $(document);

        if($.browser.msie && ($.browser.version == "6.0") && !$.support.style){
          ps.fixed=false;
          var y = document.documentElement.scrollTop;
          ps.marginTop=y + 100;
        }else{
          ps.fixed=true;
        }

        //ps.docWidth = doc.width();
        //ps.docHeight = doc.height();
        ps.docWidth = document.body.clientWidth;
        ps.docHeight = document.body.clientHeight;
        var cache, cacheKey = 'jericho_modal';
        
        var bodyHtmlContent='<div id="jmodal-overlay" class="jmodal-overlay"/>\
                <div class="jmodal-main" id="jmodal-main" >\
                    <table border="0" cellspacing="0" cellpadding="0">\
                        <tr class="jmodal-top">\
                            <td class="jmodal-top-left jmodal-png-fiexed">&nbsp;</td>\
                            <td class="jmodal-border-top jmodal-png-fiexed">&nbsp;</td>\
                            <td class="jmodal-top-right jmodal-png-fiexed">&nbsp;</td>\
                        </tr>\
                        <tr class="jmodal-middle">\
                            <td class="jmodal-border-left jmodal-png-fiexed">&nbsp;</td>\
                            <td class="jmodal-middle-content">\
                                <div class="jmodal-title" />\
                                <div class="jmodal-content" id="jmodal-container-content" />\
                                <div class="jmodal-opts">\
                                  <input type="button" class="submit"/>&nbsp;&nbsp;<input id="cancelId" type="cancel" class="cancel"/>\
                                </div>\
                            </td>\
                            <td class="jmodal-border-right jmodal-png-fiexed">&nbsp;</td>\
                        </tr>\
                        <tr class="jmodal-bottom">\
                            <td class="jmodal-bottom-left jmodal-png-fiexed">&nbsp;</td>\
                            <td class="jmodal-border-bottom jmodal-png-fiexed">&nbsp;</td>\
                            <td class="jmodal-bottom-right jmodal-png-fiexed">&nbsp;</td>\
                        </tr>\
                    </table>\
                </div>';
        if ($('#jmodal-overlay').length == 0) {
            $(bodyHtmlContent).appendTo('body');
            //$(document.body).find('form:first-child') || $(document.body)
        }

        if (window[cacheKey] == undefined) {
            cache = {
                overlay: $('#jmodal-overlay'),
                modal: $('#jmodal-main'),
                body: $('#jmodal-container-content')
            };
            cache.title = cache.body.prev();
            cache.buttons = cache.body.next().children();
            window[cacheKey] = cache;
        }
        cache = window[cacheKey];
        var args = {
            hide: function() {
                cache.modal.fadeOut();
                cache.overlay.hide();
            },
            isCancelling: false
        };

        if (!cache.overlay.is(':visible')) {
            cache.overlay.css({ opacity: .4 });
            cache.modal.attr('class', ps.skinId)
                        .css({
                            position: (ps.fixed ? 'fixed' : 'absolute'),
                            width: ps.width,
                            left: (ps.docWidth - ps.width) / 2,
                            //top: (ps.marginTop + document.documentElement.scrollTop)
                            top: (ps.marginTop)
                        }).fadeIn();
        }
        cache.title.html(ps.title);
        //OK BUTTON
        if(!ps.noCancel){
          cache.buttons.eq(0)
              .val(ps.buttonText.ok)
                  .unbind('click')
                      .click(function(e) {
                          allSel.show();
                          ps.okEvent(ps.data, args);
                          if (!args.isCancelling) {
                              args.hide();
                          }
                      })
          //CANCEL BUTTON
              .next()
                  .val(ps.buttonText.cancel)
                      .one('click', function() { args.hide(); allSel.show(); });
        }else{
           cache.buttons.eq(0)
              .val(ps.buttonText.ok)
                  .unbind('click')
                      .click(function(e) {
                         // allSel.show();
                          ps.okEvent(ps.data, args);
                          if (!args.isCancelling) {
                              args.hide();
                          }
                      });
        }
        if (typeof ps.content == 'string') {
          $('#jmodal-container-content').html(ps.content);
        }
        if (typeof ps.content == 'function') {
          ps.content(cache.body);
        }
        if(ps.noCancel){
          $('#cancelId').hide();
        }else{
          $('#cancelId').show();
        }
        
    }
})