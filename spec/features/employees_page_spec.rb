require 'rails_helper'

feature 'employees page' do
  scenario 'header' do
    visit('/')
    click_link('Работники')

    expect(page).to have_content('Работники')
  end
end