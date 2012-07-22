String.prototype.trim = ->
    return this.replace(/^\s*/, "").replace(/\s*$/, "")

validator = /^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?$/

jQuery ->
  $(".alert").hide()
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $("#url_url").popover({
    animation: true,
    placement: 'bottom',
    title: 'HEY!'
    content: 'Put the disaster link here!',
    trigger: 'manual'
  }).popover("show")

  $(".icon-download-alt").tooltip({
    animation: true,
    placement: 'right',
    trigger: 'manual',
    title: 'copy to clipboard'
  }).tooltip('show')

  $("#url_url").click ->
    $("#url_url").popover('hide')
  
  $('i').click ->
    $('.tooltip-inner').text("copied!")

  $('form').submit (event)->
    el = $("#url_url").val()
    if el.trim() == "" or !validator.test(el)
      $(".alert").show()
      event.preventDefault()
      return false
    return true


