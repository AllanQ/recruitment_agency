click_remove_skill_button = ->
  $('#skills-list').on('click', '.removable', (e)->
    e.preventDefault()
    remove_skill_from_skills_hidden_field(@.id)
    $(@).parent('span').remove()
  )

remove_skill_from_skills_hidden_field =(skill) ->
  skills = $('#skills').val() + ', '
  $('#skills').val(skills.replace(', ' + skill + ', ', ', ').slice(0, -2))

$ (->
  click_remove_skill_button()
)
