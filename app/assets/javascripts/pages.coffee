$(document).on "page:change", ->

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).closest('fieldset').remove()
    event.preventDefault()

  $('form').on 'click', '.remove_fields_nested', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  # tr
  $('form').on 'click', '.add_tr', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    padre = $(this).parent().parent()
    hermano = $(this).parent().parent().siblings(':last')
    if hermano[0]
      hermano.after($(this).data('tr').replace(regexp, time))
    else
      padre.before($(this).data('tr').replace(regexp, time))
    event.preventDefault()

  $('form').on 'click', '.remove_tr', (event) ->
    $(this).closest('tr').remove()
    event.preventDefault()