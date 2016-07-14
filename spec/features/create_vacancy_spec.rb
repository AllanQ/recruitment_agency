require 'rails_helper'

feature 'create new vacancy' do
  scenario 'with valid data' do
    visit('/')
    click_link('Создать вакансию')

    fill_in('Название', with: 'Ruby developer')

    fill_in('Умение', with: 'Ruby')
    click_button('Добавить')
    fill_in('Умение', with: 'Ruby on Rails')
    click_button('Добавить')

    fill_in('Зарплата', with: 1000)
    fill_in('Контактная информация', with: 'Email: test@email.com')
    fill_in('Срок действия, дней', with: 7)
    click_button('Создать вакансию')

    expect(page).to have_content('Вакансия создана')
    vacancy = Vacancy.last
    expect(vacancy.title).to eq('Ruby developer')
    expect(skills = Skill
      .joins("JOIN skills_vacancies ON vacancies.id = skills_vacancies.vacancy_id")
      .where(["skills_vacancies.vacancy_id = ?", vacancy.id])
      .inject([]) { |arr, skill| arr << skill(:name) })
      .sort.to eq(['Ruby', 'Ruby on rails'])
  end
end
