require 'rails_helper'

feature 'vacancies page' do
  scenario 'vacancies header' do
    visit('/')
    expect(page).to have_content('Vacancies')
  end
end