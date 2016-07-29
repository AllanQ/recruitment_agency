require 'rails_helper'

feature 'edit vacancy' do
  let(:vacancy1) { create(:vacancy, title: 'vacancy1') }
  let(:skill1) { create(:skill, name: 'skill1') }
  let(:skill2) { create(:skill, name: 'skill2') }
  before do
    vacancy1.skills << skill1
    vacancy1.skills << skill2
  end

  scenario 'page title' do
    visit('/')
    click_link('vacancy1')
    click_link('Редактировать')

    expect(page).to have_content('Редактирование вакансии')
  end

  scenario 'skills presence' do
    visit('/')
    click_link('vacancy1')
    click_link('Редактировать')

    expect(page).to have_content('skill1')
    expect(page).to have_content('skill2')
  end


end
