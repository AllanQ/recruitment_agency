require 'rails_helper'

feature 'vacancies page' do
  scenario 'as home page' do
    visit('/')

    expect(page).to have_content('Вакансии')
  end
  scenario 'header link' do
    visit('/')
    click_link('Работники')
    click_link('Вакансии')

    expect(page).to have_content('Вакансии')
  end
end