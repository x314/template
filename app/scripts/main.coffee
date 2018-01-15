$(document).ready ->

  $('[data-toggle="tooltip"]').tooltip()

  $('#click-a').on 'click', ->
    # $containernav = $('.container-nav');
    # $nav = $('.nav');
    $containernav = $('.wrapper-navbar-default')
    $navbardefault = $('.navbar-default')
    $nav = $('nav')
    $bannerwrapper = $('#banner-wrapper')

    $containernav.toggleClass 'nav-view'
    $navbardefault.toggleClass 'nav-view'

    $('html, body, main').css
      'height': ''
      'overflow': ''

    if $navbardefault.hasClass('nav-view')

      if $navbardefault.height() + $nav.height() > window.innerHeight
        $('html, body').css
          'height': $navbardefault.height() + $nav.height()
        $('main').css
          'height': $navbardefault.height() - $bannerwrapper.height()
          'overflow': 'hidden'
      else
        $('html, body').css
          'height': window.innerHeight
        $('main').css
          'height': window.innerHeight - $nav.height() - $bannerwrapper.height()
          'overflow': 'hidden'

    false

  # Instantiate the Bootstrap carousel
  $('.multi-item-carousel').carousel
    interval: false

  # console.log screen.width, window.innerWidth, $(window).width()
  if $(window).width() >= 768
    $('.multi-item-carousel .item').each ->
      next = $(this).next()
      if !next.length
        next = $(this).siblings(':first')
      next.children(':first-child').clone().appendTo $(this)
      return

  if $(window).width() >= 1200
    $('.panel-birthday').height $('.panel-development').height()

  $resize = ->
    # for every slide in carousel, copy the next slide's item in the slide.
    # Do the same for the next, next item.

    # console.log window.innerHeight
    $h = window.innerHeight
    $hheader = $('header').outerHeight()
    $hlogin = $('#login-wrapper main').height()
    $hfooter = $('footer').outerHeight()

    $('html, body, #login-wrapper main').height('')
    $('footer').removeClass 'vertical-bottom'

    if ($h - $hheader - $hfooter) > $hlogin
      $('html, body, #login-wrapper main').height('98%')
      $('footer').addClass 'vertical-bottom'

  $resize()

  $(window).resize ->
    $resize()

  return