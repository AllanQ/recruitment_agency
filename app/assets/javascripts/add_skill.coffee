click_button_add_skill = ->
  $('#add-skill').on('click', (e)->
    e.preventDefault()
    $('#skill').val().trim().split(',').forEach(add_skill)
    $('#skill').val('')
  )

add_skill =(item) ->
  if item != ''
    skill = capitalize(item)
    unless check_presence(skill)
      add_skill_to_hidden_field_skills(skill)
      add_button_with_skill_name(skill)

capitalize =(str) ->
  str_low_case = str.trim().toLocaleLowerCase()
  str_low_case.charAt(0).toUpperCase() + str_low_case.slice(1)

check_presence =(skill) ->
  skills = $('#skills').val() + ', '
  if skills.search(', ' + skill + ', ') == -1
    false
  else
    true

add_skill_to_hidden_field_skills =(skill) ->
  skills = $('#skills').val()
  $('#skills').val(skills + ', ' + skill)

add_button_with_skill_name =(skill_name) ->
  $('#skills-list').append('<span></span>')
  $('#sample').clone().removeClass('hidden').addClass('removable').attr('id', skill_name)
  .text(skill_name).appendTo($('#skills-list').children().last())
  
$ (->
  click_button_add_skill()
)
