click_button_add_skill_edit = ->
  $('#add-skill-edit').on('click', ->
    vacancy_id = $('#vacancy_id').val()
    name = $('#skill').val()
    $.ajax("/skills/add", {
      type: 'GET',
      data: { 'skill': { 'name': name }, 'vacancy_id': vacancy_id }
    })
    $('#skill').val('').focus()
  )

$ (->
  click_button_add_skill_edit()
)
