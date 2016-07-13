require 'rails_helper'

feature 'employees page' do
  scenario 'employees header' do
    visit('/')
    click_link('Employees')

    expect(page).to have_content('Employees')
  end
end