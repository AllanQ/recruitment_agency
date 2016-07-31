click_remove_skill_button_new = ->
  $('#skills-list').on('click', '.removable', ->
    remove_skill_from_skills_hidden_field(@.id)
    $(@).parent('span').remove()
    $('#skill').focus()
  )

remove_skill_from_skills_hidden_field =(skill) ->
  skills = $('#skills').val() + ', '
  regex = new RegExp(', ' + skill + '=' + '[0-9]+' + ', ')
  $('#skills').val(skills.replace(regex, ', ').slice(0, -2))

$ (->
  click_remove_skill_button_new()
)
