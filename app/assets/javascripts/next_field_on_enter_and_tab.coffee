next_field = ->
  $('#inputform').on('keydown', 'input', (e)->
    # Enter key in title and salary fields and Tab key in skill field
    if ((e.which == 13) && (@.id == 'vacancy_title' ||
    @.id == 'vacancy_salary' || @.id == 'employee_name' ||
    @.id == 'employee_salary' || @.id == 'employee_contact')) ||
    ((e.which == 9) && (@.id == 'skill'))
      e.preventDefault()
      index = parseFloat($(@).attr('dataindex'))
      $('[dataindex="' + (index + 1).toString() + '"]').focus()
  )

$ (->
  next_field()
)
