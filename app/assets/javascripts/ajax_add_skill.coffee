click_button_ajax_skill = ->
  $('#ajax-skill').on('click', ->
    vacancy_id = $('#vacancy_id').val()
    name = $('#skill').val()
    $.ajax("/skills", {
      type: 'POST',
      data: { 'skill': { 'name': name }, 'vacancy_id': vacancy_id }
    })
    $('#skill').val('').focus()
  )

$ (->
  click_button_ajax_skill()
)
