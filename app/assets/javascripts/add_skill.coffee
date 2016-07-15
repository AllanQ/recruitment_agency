split_and_add = ->
  $('#add-skill').on('click', ->
    console.log('batton add click')
    skill = $('#skill').val().trim().toLocaleLowerCase()
    skill.split(',').forEach(add_skill)
  )

add_skill =(item) ->
  skill = item.trim()
  skill = skill.charAt(0).toUpperCase() + skill.slice(1)
  console.log(skill)
  skills = $('#skills').val()
  $('#skills').val(skills + ', ' + skill)
  skills = $('#skills').val()
  console.log(skills)
  $('#sample').clone().removeAttr('id').removeClass('hidden')
    .text(skill).appendTo('#skills-list')
  $('#skill').val('')

$ (->
  split_and_add()
)