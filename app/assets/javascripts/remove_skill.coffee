click_remove_skill_button = ->
  $(':button.btn btn-primary glyphicon glyphicon-remove-right hidden.removable').click('click', ->

    console.log(this.id)

#    $('event.target').remove()
#    console.log('click remove button')
#    remove_skill_from_skills_hidden_field($(@).attr('text'))
#    $(@).remove()
  )

remove_skill_from_skills_hidden_field =(skill) ->
  console.log(skill)
  skills = $('#skills').val() + ', '
  console.log(skills)
  $('#skills').val(skills.replace(', ' + skill + ', ', ', ').slice(0, -2))
  skills = $('#skills').val()
  console.log(skills)

$ (->
  click_remove_skill_button()
)
