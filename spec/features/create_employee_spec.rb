require 'rails_helper'

feature 'create new employee' do
  xscenario 'add skills' do
    visit('/')
    click_link('Создать работника')
    fill_in('Умение', with: 'PostgreSQL')
    click_button('Добавить')
    expect(page).to have_button('Postgresql')
  end

  xscenario 'add skills' do
    visit('/')
    click_link('Создать работника')
    fill_in('Умение', with: 'HTML')
    click_button('Добавить')
    fill_in('Умение', with: 'PostgreSQL')
    click_button('Добавить')
    fill_in('Умение', with: 'ajax')
    click_button('Добавить')
    click_button('Postgresql')
    expect(page).not_to have_button('Postgresql')
  end

  xscenario 'with valid data' do
    visit('/')
    click_link('Создать работника')

    fill_in('ФИО', with: 'Александр Сергеевич Пушкин')

    fill_in('Умение', with: 'Ruby')
    click_button('Добавить')
    fill_in('Умение', with: 'Ruby on Rails')
    click_button('Добавить')

    fill_in('Желаемая зарплата', with: 1000)
    fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
    check('Ищу работу')

    click_button('Создать работника')

    expect(page).to have_content('Работник создан')
    expect(Employee.last.contact).to eq('+123(45) 123-45-67')
  end
end