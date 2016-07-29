require 'rails_helper'

feature 'edit vacancy' do
  let(:vacancy1) { create(:vacancy, title: 'vacancy1', salary: 777,
                          contacts: 'test@test.com') }
  let(:skill1) { create(:skill, name: 'Skill1') }
  let(:skill2) { create(:skill, name: 'Skill2') }
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

  xscenario 'skills presence' do
    visit('/')
    click_link('vacancy1')
    click_link('Редактировать')

    expect(page).to have_content('Skill1')
    expect(page).to have_content('Skill2')
  end

  xscenario 'skills edit' do
    visit('/')
    click_link('vacancy1')
    click_link('Редактировать')
    click_button('Skill2')
    fill_in('Умение', with: 'Skill3')
    click_button('Добавить')

    expect(vacancy1.skills.map{ |skill| skill.name })
      .to eq(%w(Skill1 Skill3))
  end

  xscenario 'skills edit' do
    visit('/')
    click_link('vacancy1')
    click_link('Редактировать')
    fill_in('Название', with: 'vacancy2')
    click_button('Skill1')
    click_button('Skill2')
    fill_in('Умение', with: 'Skill3, Skill4')
    click_button('Добавить')
    fill_in('Зарплата', with: 1234567)
    fill_in('Контактная информация', with: 'tel:+0000000')
    click_button('Сохранить вакансию')

    expect(page).to have_content('vacancy2')
    expect(page).not_to have_content('vacancy1')
    expect(page).to have_content('Skill3')
    expect(page).to have_content('Skill4')
    expect(page).not_to have_content('Skill1')
    expect(page).not_to have_content('Skill2')
    expect(page).to have_content('1234567')
    expect(page).not_to have_content('777')
    expect(page).to have_content('tel:+0000000')
    expect(page).not_to have_content('test@test.com')
  end
end
