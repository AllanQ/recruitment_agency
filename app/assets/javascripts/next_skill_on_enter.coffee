next_skill = ->
  $('#inputform').on('keydown', 'input', (e)->
    if (@.id == 'skill') && (e.which == 13)
      e.preventDefault()
      $('#add-skill').click()
  )

$ (->
  next_skill()
)
