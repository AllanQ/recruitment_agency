click_button_submit_vacancy = ->
  $('#submit-vacancy').on('click', ->
    validate_vacancy()
  )

validate_vacancy = ->
  res_validity = empty_validity() && valid_validity()
  res_contacts = empty_contacts()
  res_salary = empty_salary() && valid_salary()
  res_skills = few_skills()
  res_title = empty_title()
  return res_validity && res_contacts && res_salary && res_skills && res_title

empty_validity = ->
  $('#alert-validity-empty').addClass('hidden')
  validity = $('#vacancy_validity').val()
  if validity == null || validity == ''
    $('#alert-validity-empty').removeClass('hidden')
    $('#vacancy_validity').focus()
    false
  else
    true

valid_validity = ->
  $('#alert-validity-invalid').addClass('hidden')
  validity = $('#vacancy_validity').val()
  if validity % 1 == 0 && validity > 0
    true
  else
    $('#alert-validity-invalid').removeClass('hidden')
    $('#vacancy_validity').focus()
    false

empty_contacts = ->
  $('#alert-contacts-empty').addClass('hidden')
  contacts = $('#vacancy_contacts').val().trim()
  if contacts == null || contacts == ''
    $('#alert-contacts-empty').removeClass('hidden')
    $('#vacancy_contacts').focus()
    false
  else
    true

empty_salary = ->
  $('#alert-salary-empty').addClass('hidden')
  salary = $('#vacancy_salary').val()
  if salary == null || salary == ''
    $('#alert-salary-empty').removeClass('hidden')
    $('#vacancy_salary').focus()
    false
  else
    true

valid_salary = ->
  $('#alert-salary-invalid').addClass('hidden')
  salary = $('#vacancy_salary').val()
  if salary % 1 == 0 && salary > 0
    true
  else
    $('#alert-salary-invalid').removeClass('hidden')
    $('#vacancy_salary').focus()
    false

few_skills = ->
  $('#alert-few-skills').addClass('hidden')
  skills = $('#skills').val().trim()
  if skills == null || skills == '' || skills.slice(3, -1).split(', ').length < 2
    $('#alert-few-skills').removeClass('hidden')
    $('#skill').focus()
    false
  else
    true

empty_title = ->
  $('#alert-title-empty').addClass('hidden')
  title = $('#vacancy_title').val().trim()
  if title == null || title == ''
    $('#alert-title-empty').removeClass('hidden')
    $('#vacancy_title').focus()
    false
  else
    true

$ (->
  click_button_submit_vacancy()
)
