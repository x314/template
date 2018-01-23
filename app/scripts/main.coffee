$(document).ready ->

  $resize = ->
    $w = window.innerWidth
    $h = window.innerHeight
    $hheader = $('header').outerHeight()
    $hlogin = $('#login-wrapper main').height()
    $hfooter = $('footer').outerHeight()

    $('html, body, #login-wrapper main').height('')
    $('footer').removeClass 'vertical-bottom'

    if ($h - $hheader - $hfooter) > $hlogin
      $('html, body, #login-wrapper main').height('98%')
      $('footer').addClass 'vertical-bottom'

    $owlCarousel = $('.owl-carousel')
    $hbanner = $('#banner-wrapper').height()
    if $(window).width() < 768
      $owlCarousel.css({
        'width': $w
        'height': $hbanner
      })
    else
      $owlCarousel.css({
        'width': ''
        'height': ''
      })

    return

  $(window).resize ->
    $resize()

  $resize()

  $('[data-toggle="tooltip"]').tooltip()

  $('.owl-carousel').owlCarousel({
    # loop: true
    margin: 30
    nav: true
    responsive: {
      0: {
        items: 3
      }
      768: {
        items: 4
      }
      992: {
        items: 5
      }
      1200: {
        items: 6
      }
    }
  })

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

  $('.direct-access .btn-close').on 'click', ->
    # $('.direct-access .owl-carousel').css({
    #   'opacity': 0
    # })

    $ '.direct-access .owl-carousel'
      .fadeOut 0

    $ '.direct-access .btn'
      .removeClass 'hidden'

    $ '.direct-access .btn-close'
      .addClass 'hidden'
    
    false

  # Instantiate the Bootstrap carousel
  $('.multi-item-carousel').carousel
    interval: false

  # console.log screen.width, window.innerWidth, $(window).width()
  switch
    when ($(window).width() >= 1200)
      $('.panel-birthday').height $('.panel-development').height()

      $('#banner-wrapper > .direct-access > a.btn').on 'click', ->
        $wrapperOwlCarousel = $('.wrapper-owl-carousel')
        $w = if ($wrapperOwlCarousel.width() > 0) then 0 else '740px'
        $wrapperOwlCarousel.animate({
          'width': $w
        }, 500)
        false

    # when ($(window).width() >= 992)
    #   $('#banner-wrapper > .direct-access > a').on 'click', ->
    #     console.log 'click'
    #     $wrapperOwlCarousel = $('.wrapper-owl-carousel')
    #     $w = if ($wrapperOwlCarousel.width() > 0) then 0 else '740px'
    #     $wrapperOwlCarousel.animate({
    #       'width': $w
    #     }, 500)
    #     false

    when ($(window).width() >= 768)
      $('.multi-item-carousel .item').each ->
        next = $(this).next()
        if !next.length
          next = $(this).siblings(':first')
        next.children(':first-child').clone().appendTo $(this)
        return

      $('#banner-wrapper > .direct-access > a.btn').on 'click', ->
        $wrapperOwlCarousel = $('.wrapper-owl-carousel')
        $w = if ($wrapperOwlCarousel.width() > 0) then 0 else '525px'
        $wrapperOwlCarousel.animate({
          'width': $w
        }, 500)
        false

    when ($(window).width() < 768)
      $('#banner-wrapper > .direct-access > a.btn').on 'click', ->
        $wrapperOwlCarousel = $('.wrapper-owl-carousel')
        $owlCarousel = $('.owl-carousel')

        $ '.direct-access'
          .addClass 'w-absolute'

        $ '.direct-access .btn'
          .addClass 'hidden'

        $ '.direct-access .btn-close'
          .removeClass 'hidden'

        $ '.direct-access .owl-carousel'
          .fadeIn 0

        $wrapperOwlCarousel.css({
          'width': '100%'
          'height': '100%'
        })

        # $owlCarousel.css({
        #   'opacity': 1
        # })

        $('.direct-access .btn-close').show()

        false

  return