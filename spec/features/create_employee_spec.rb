require 'rails_helper'

feature 'create new employee' do
  scenario 'with valid data' do
    visit('/')
    click_link('Создать работника')

    fill_in('ФИО', with: 'Александр Сергеевич Пушкин')
    # fill_in('Skills', with: 'Ruby, Ruby on Rails')
    fill_in('Желаемая зарплата', with: 1000)
    fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
    check('Ищу работу')

    click_button('Создать работника')

    expect(page).to have_content('Работник создан')
    expect(Employee.last.contact).to eq('+123(45) 123-45-67')
  end
end