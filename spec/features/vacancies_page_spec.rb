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

  let(:vacancy1) { create(:vacancy, title: 'Ruby developer') }
  let(:vacancy2) { create(:vacancy, title: 'Rails developer') }
  let(:vacancy3) { create(:vacancy, title: 'JS developer') }
  let(:skill1) { create(:skill, name: 'Ruby') }
  let(:skill2) { create(:skill, name: 'Rspec') }
  let(:skill3) { create(:skill, name: 'Ajax') }
  let(:skill4) { create(:skill, name: 'Rails') }
  let(:skill5) { create(:skill, name: 'Angular2') }
  let(:skill6) { create(:skill, name: 'Haml') }
  let(:skill7) { create(:skill, name: 'Cucumber') }


  scenario 'show all vacancies' do
    vacancy1.skills << skill1
    vacancy1.skills << skill2
    vacancy2.skills << skill3
    vacancy2.skills << skill4
    vacancy3.skills << skill5
    vacancy3.skills << skill6
    vacancy3.skills << skill7
    visit('/')

    expect(page).to have_content('Ruby developer')
    expect(page).to have_content('Rails developer')
    expect(page).to have_content('JS developer')
    expect(page).to have_content('Rspec')
    expect(page).to have_content('Ajax')
  end
end