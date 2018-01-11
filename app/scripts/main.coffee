$(document).ready ->

  $('[data-toggle="tooltip"]').tooltip()

  $('#click-a').on 'click', ->
    # $containernav = $('.container-nav');
    # $nav = $('.nav');
    $containernav = $('.wrapper-navbar-default')
    $nav = $('.navbar-default')

    $containernav.toggleClass 'nav-view'
    $nav.toggleClass 'nav-view'

    if $nav.hasClass('nav-view')
      # $('html, body').css({
      #   'height': $('.nav > ul').height() + $('header').height(),
      #   'overflow': 'hidden'
      # });
      $('html, body').css
        'height': $('.navbar-default > ul').height() + $('nav').height()
        'overflow': 'hidden'
      $('html').css 'overflow': 'auto'
    else
      $('html, body').css
        'height': ''
        'overflow': 'initial'
    false

  # Instantiate the Bootstrap carousel
  $('.multi-item-carousel').carousel
    interval: false

  console.log screen.width, window.innerWidth, $(window).width()
  if $(window).width() >= 768
    $('.multi-item-carousel .item').each ->
      next = $(this).next()
      if !next.length
        next = $(this).siblings(':first')
      next.children(':first-child').clone().appendTo $(this)
      return

    $('.panel-birthday').height $('.panel-development').height()
    # $('.panel-birthday .tab-content').height $('.panel-process').height() + $('.panel-learn').height()

  $resize = ->
    # for every slide in carousel, copy the next slide's item in the slide.
    # Do the same for the next, next item.

    # console.log window.innerHeight
    $h = window.innerHeight;
    $hheader = $('header').outerHeight()
    $hlogin = $('#login-wrapper main').height()
    $hfooter = $('footer').outerHeight()

    $('html, body, #login-wrapper main').height('');
    $('footer').removeClass 'vertical-bottom'

    if ($h - $hheader - $hfooter) > $hlogin
      $('html, body, #login-wrapper main').height('98%');
      $('footer').addClass 'vertical-bottom'

  $resize()

  $(window).resize ->
    $resize()

  return