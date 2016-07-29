require 'rails_helper'

feature 'create new vacancy' do
  xscenario 'add skill' do
    visit('/')
    click_link('Создать вакансию')
    fill_in('Умение', with: 'PostgreSQL')
    click_button('Добавить')

    expect(page).to have_button('Postgresql')
  end

  xscenario 'cancel add skills' do
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
    fill_in('Умение', with: 'Ruby on rails')
    click_button('Добавить')
    fill_in('Зарплата', with: 1000)
    fill_in('Контактная информация', with: 'Email: test@email.com')
    fill_in('Срок действия, дней', with: 7)
    click_button('Создать вакансию')

    expect(page).to have_content('Вакансия создана')
    expect.to change(Vacancy, :count).by(1)
    vacancy = Vacancy.last
    expect(vacancy.title).to eq('Ruby developer')
    expect(vacancy.skills.map{ |skill| skill.name })
      .to eq(['Ruby', 'Ruby on rails'])
  end

  context 'with invalid data' do
    xscenario 'without title' do
      visit('/')
      click_link('Создать вакансию')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on rails')
      click_button('Добавить')
      fill_in('Зарплата', with: 1000)
      fill_in('Контактная информация', with: 'Email: test@email.com')
      fill_in('Срок действия, дней', with: 7)
      click_button('Создать вакансию')

      expect(page).to have_content('Введите название вакансии')
      expect(page).not_to have_content('Вакансия создана')
      expect.not_to change(Vacancy, :count)
    end

    xscenario 'few skills' do
      visit('/')
      click_link('Создать вакансию')
      fill_in('Название', with: 'Ruby developer')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Зарплата', with: 1000)
      fill_in('Контактная информация', with: 'Email: test@email.com')
      fill_in('Срок действия, дней', with: 7)
      click_button('Создать вакансию')

      expect(page).to have_content('Укажите несколько требуемых умений')
      expect(page).not_to have_content('Вакансия создана')
      expect.not_to change(Vacancy, :count)
    end

    xscenario 'without salary' do
      visit('/')
      click_link('Создать вакансию')
      fill_in('Название', with: 'Ruby developer')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on rails')
      click_button('Добавить')
      fill_in('Контактная информация', with: 'Email: test@email.com')
      fill_in('Срок действия, дней', with: 7)
      click_button('Создать вакансию')

      expect(page).to have_content('Укажите зарплату')
      expect(page).not_to have_content('Вакансия создана')
      expect.not_to change(Vacancy, :count)
    end

    xscenario 'with negative salary' do
      visit('/')
      click_link('Создать вакансию')
      fill_in('Название', with: 'Ruby developer')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on rails')
      click_button('Добавить')
      fill_in('Зарплата', with: -1000)
      fill_in('Контактная информация', with: 'Email: test@email.com')
      fill_in('Срок действия, дней', with: 7)
      click_button('Создать вакансию')

      expect(page).to have_content('Укажите зарплату')
      expect(page).not_to have_content('Вакансия создана')
      expect.not_to change(Vacancy, :count)
    end

    xscenario 'with fractional salary' do
      visit('/')
      click_link('Создать вакансию')
      fill_in('Название', with: 'Ruby developer')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on rails')
      click_button('Добавить')
      fill_in('Зарплата', with: 1000.5)
      fill_in('Контактная информация', with: 'Email: test@email.com')
      fill_in('Срок действия, дней', with: 7)
      click_button('Создать вакансию')

      expect(page).to have_content('Укажите зарплату')
      expect(page).not_to have_content('Вакансия создана')
      expect.not_to change(Vacancy, :count)
    end

    xscenario 'without contacts' do
      visit('/')
      click_link('Создать вакансию')
      fill_in('Название', with: 'Ruby developer')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on rails')
      click_button('Добавить')
      fill_in('Зарплата', with: 1000)
      fill_in('Срок действия, дней', with: 7)
      click_button('Создать вакансию')

      expect(page).to have_content('Укажите контактную информацию')
      expect(page).not_to have_content('Вакансия создана')
      expect.not_to change(Vacancy, :count)
    end

    xscenario 'without validity' do
      visit('/')
      click_link('Создать вакансию')
      fill_in('Название', with: 'Ruby developer')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on rails')
      click_button('Добавить')
      fill_in('Зарплата', with: 1000)
      fill_in('Контактная информация', with: 'Email: test@email.com')
      click_button('Создать вакансию')

      expect(page).to have_content('Укажите срок действия')
      expect(page).not_to have_content('Вакансия создана')
      expect.not_to change(Vacancy, :count)
    end
  end

end
