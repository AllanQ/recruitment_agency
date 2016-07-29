require 'rails_helper'

feature 'vacancies page pagination' do
  let(:vacancy1) { create(:vacancy, title: 'vacancy1') }
  let(:vacancy2) { create(:vacancy, title: 'vacancy2') }
  let(:vacancy3) { create(:vacancy, title: 'vacancy3') }
  let(:vacancy4) { create(:vacancy, title: 'vacancy4') }
  let(:vacancy5) { create(:vacancy, title: 'vacancy5') }
  let(:vacancy6) { create(:vacancy, title: 'vacancy6') }
  let(:vacancy7) { create(:vacancy, title: 'vacancy7') }
  let(:skill1) { create(:skill, name: 'skill1') }
  let(:skill2) { create(:skill, name: 'skill2') }
  let(:skill3) { create(:skill, name: 'skill3') }
  let(:skill4) { create(:skill, name: 'skill4') }

  before do
    vacancy1.skills << skill3
    vacancy1.skills << skill4
    vacancy2.skills << skill1
    vacancy2.skills << skill2
    vacancy3.skills << skill1
    vacancy3.skills << skill2
    vacancy4.skills << skill1
    vacancy4.skills << skill2
    vacancy5.skills << skill1
    vacancy5.skills << skill2
    vacancy6.skills << skill1
    vacancy6.skills << skill2
    vacancy7.skills << skill1
    vacancy7.skills << skill2
  end

  scenario 'show 6 last vacancies' do
    visit('/')

    expect(page).to have_content('vacancy2')
    expect(page).to have_content('vacancy3')
    expect(page).to have_content('vacancy4')
    expect(page).to have_content('vacancy5')
    expect(page).to have_content('vacancy6')
    expect(page).to have_content('vacancy7')
    expect(page).to have_content('skill1')
    expect(page).to have_content('skill2')
    expect(page).not_to have_content('vacancy1')
    expect(page).not_to have_content('skill3')
    expect(page).not_to have_content('skill4')
  end

  scenario 'show 2 first vacancies' do
    visit('/')
    click_link('2')

    expect(page).to have_content('vacancy1')
    expect(page).to have_content('skill3')
    expect(page).to have_content('skill4')
    expect(page).not_to have_content('vacancy2')
    expect(page).not_to have_content('vacancy3')
    expect(page).not_to have_content('vacancy4')
    expect(page).not_to have_content('vacancy5')
    expect(page).not_to have_content('vacancy6')
    expect(page).not_to have_content('vacancy7')
    expect(page).not_to have_content('skill1')
    expect(page).not_to have_content('skill2')
  end
end