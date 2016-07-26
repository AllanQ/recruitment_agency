click_button_submit_employee = ->
  $('#submit-employee').on('click', ->
    validate_employee()
  )

validate_employee = ->
  res_contact = empty_contact() && valid_contact()
  res_salary = empty_salary() && valid_salary()
  res_skills = few_skills()
  res_name = empty_name() && valid_name()
  return res_contact && res_salary && res_skills && res_name

empty_contact = ->
  $('#alert-contact-empty').addClass('hidden')
  contact = $('#employee_contact').val().trim()
  if contact == null || contact == ''
    $('#alert-contact-empty').removeClass('hidden')
    $('#employee_contacts').focus()
    false
  else
    true

valid_contact = ->
  $('#alert-contact-invalid').addClass('hidden')
  contact = $('#employee_contact').val().trim()
#  tel = /^\+?\d{4,22}$/
  tel = /^\+?[-().\d ]{4,40}$/
  email = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/
  reg = new RegExp(tel.source + "|" + email.source)
  if contact.match(reg)
    true
  else
    $('#alert-contact-invalid').removeClass('hidden')
    $('#employee_contact').focus()
    false

empty_salary = ->
  $('#alert-salary-empty').addClass('hidden')
  salary = $('#employee_salary').val()
  if salary == null || salary == ''
    $('#alert-salary-empty').removeClass('hidden')
    $('#employee_salary').focus()
    false
  else
    true

valid_salary = ->
  $('#alert-salary-invalid').addClass('hidden')
  salary = $('#employee_salary').val()
  if salary % 1 == 0 && salary > 0
    true
  else
    $('#alert-salary-invalid').removeClass('hidden')
    $('#employee_salary').focus()
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

empty_name = ->
  $('#alert-name-empty').addClass('hidden')
  name = $('#employee_name').val().trim()
  if name == null || name == ''
    $('#alert-name-empty').removeClass('hidden')
    $('#employee_name').focus()
    false
  else
    true

valid_name = ->
  $('#alert-name-invalid').addClass('hidden')
  name = $('#employee_name').val().trim()
#  re = /[а-яё]{2,}(\-[а-яё]{2,})?/i
  re = /[а-яё]{2,}/i
  reg = new RegExp("^(" + re.source + " ){2}" + re.source + "$")
  if name.match(reg)
    true
  else
    $('#alert-name-invalid').removeClass('hidden')
    $('#employee_name').focus()
    false

$ (->
  click_button_submit_employee()
)
