click_button_add_skill = ->
  $('#add-skill').on('click', ->
    $('#skill').val().trim().split(/[,/]/).forEach(add_skill)
    $('#skill').val('').focus()
  )

add_skill =(item) ->
  if item != ''
    skill = capitalize(item)
    unless check_presence(skill)
      define_skill_id(skill)
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

define_skill_id =(skill) ->
#  id = 0
#  if $('#edit-vacancy-id').length
#    id = $('#edit-vacancy-id').val()
  $.ajax("/skills/find_id/", {
    type: 'GET',
    dataType: 'json',
    data: { 'skill': { 'name': skill } },
    success: (result) ->
      id = result.id
      add_skill_to_skills(', ' + skill + '=' + id)
  })

add_skill_to_skills =(text_skill_data) ->
  skills = $('#skills').val()
  $('#skills').val(skills + text_skill_data)

add_button_with_skill_name =(skill_name) ->
  $('#skills-list').append('<span></span>')
  $('#sample').clone().removeClass('hidden').addClass('removable')
  .attr('id', skill_name).text(skill_name)
  .appendTo($('#skills-list').children().last())

#edit_skills = ->
#  if $('#edit-skills').length
#    e_skills = $('#edit-skills').val()
#    if e_skills != null && e_skills != ''
#      $('#skills').val(e_skills)
#      i = e_skills.lastIndexOf("=")
#      e_skills[2...i].split(/\=\d+, /).forEach (e_skill) ->
#        add_button_with_skill_name(e_skill)

$ (->
#  edit_skills()
#  unless $('#edit-skills').length
  click_button_add_skill()
)
