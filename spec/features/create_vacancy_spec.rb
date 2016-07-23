require 'rails_helper'

feature 'create new vacancy' do
  xscenario 'add skills' do
    visit('/')
    click_link('Создать вакансию')
    fill_in('Умение', with: 'PostgreSQL')
    click_button('Добавить')
    expect(page).to have_button('Postgresql')
  end

  xscenario 'add skills' do
    visit('/')
    click_link('Создать вакансию')
    fill_in('Умение', with: 'HTML')
    click_button('Добавить')
    fill_in('Умение', with: 'PostgreSQL')
    click_button('Добавить')
    fill_in('Умение', with: 'ajax')
    click_button('Добавить')
    click_button('Postgresql')
    expect(page).not_to have_button('Postgresql')
  end

  xscenario 'with valid data' do
    visit('/')
    click_link('Создать вакансию')

    fill_in('Название', with: 'Ruby developer')

    fill_in('Умение', with: 'Ruby')
    click_button('Добавить')
    # find('#skill-name').find('Ruby on rails').select_option
    # find('#skill-name').find(text: 'Ruby on rails').select_option
    # find('#skill-name').find(:text, 'Ruby on rails').select_option
    # find('#skill-name', text: 'Ruby on rails').click
    # find('#skill-name', text: 'Ruby on rails').click
    # find(:xpath, "//option[@value='Ruby on rails']").click
    # find(:xpath, "//option[@text='Ruby on rails']").click
    # find(:xpath, "//datalist/option[@value='Ruby on rails']").click
    fill_in('Умение', with: 'Ruby on rails')
    click_button('Добавить')


    fill_in('Зарплата', with: 1000)
    fill_in('Контактная информация', with: 'Email: test@email.com')
    fill_in('Срок действия, дней', with: 7)
    click_button('Создать вакансию')

    expect(page).to have_content('Вакансия создана')
    vacancy = Vacancy.last
    expect(vacancy.title).to eq('Ruby developer')
   # SELECT name FROM (SELECT * FROM skills_vacancies WHERE vacancy_id = 5) AS join_table INNER JOIN skills ON skill_id = id;
    expect(skills = Skill
      .joins("JOIN (SELECT * FROM skills_vacancies\
 WHERE vacancy_id = #{vacancy.id}) AS join_table ON id = skill_id")
      .select(:name)
      .map{|skill| skill[:name]})
      .sort.to eq(['Ruby', 'Ruby on rails'])
  end
end
