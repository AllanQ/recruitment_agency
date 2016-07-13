require 'rails_helper'

feature 'create new vacancy' do
  scenario 'create new vacancy with valid data' do
    visit('/')
    click_link('Create Vacancy')

    fill_in('Название', with: 'Ruby developer')
    # fill_in('Skills', with: 'Ruby, Ruby on Rails')
    fill_in('Зарплата', with: 1000)
    fill_in('Контактная информация', with: 'Email: test@email.com')
    fill_in('Срок действия, дней', with: 7)
    click_button('Создать вакансию')

    expect(page).to have_content('Вакансия создана')
    expect(Vacancy.last.title).to eq('Ruby developer')
  end
end