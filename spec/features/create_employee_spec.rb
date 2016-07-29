require 'rails_helper'

feature 'create new employee' do
  xscenario 'add skill' do
    visit('/')
    click_link('Создать работника')
    fill_in('Умение', with: 'PostgreSQL')
    click_button('Добавить')

    expect(page).to have_button('Postgresql')
  end

  xscenario 'cancel add skills' do
    visit('/')
    click_link('Создать работника')
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
    click_link('Создать работника')
    fill_in('ФИО', with: 'Александр Сергеевич Пушкин')
    fill_in('Умение', with: 'Ruby')
    click_button('Добавить')
    fill_in('Умение', with: 'Ruby on Rails')
    click_button('Добавить')
    fill_in('Желаемая зарплата', with: 1000)
    fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
    check('В поиске работы')
    click_button('Создать работника')

    expect(page).to have_content('Работник создан')
    expect.to change(Employee, :count).by(1)
    employee = Employee.last
    expect(employee.contact).to eq('+123(45) 123-45-67')
    expect(employee.skills.map{ |skill| skill.name })
      .to eq(['Ruby', 'Ruby on rails'])
  end

  context 'with invalid data' do
    xscenario 'without name' do
      visit('/')
      click_link('Создать работника')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on Rails')
      click_button('Добавить')
      fill_in('Желаемая зарплата', with: 1000)
      fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('Укажите ФИО')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end

    xscenario 'with name of 2 words' do
      visit('/')
      click_link('Создать работника')
      fill_in('ФИО', with: 'Александр Сергеевич')
      click_link('Создать работника')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on Rails')
      click_button('Добавить')
      fill_in('Желаемая зарплата', with: 1000)
      fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('ФИО должно содержать 3 слова и только кириллические буквы и пробелы')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end

    xscenario 'with name in latin letters' do
      visit('/')
      click_link('Создать работника')
      fill_in('ФИО', with: 'Alexandr Sergeevich Pushkin')
      click_link('Создать работника')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on Rails')
      click_button('Добавить')
      fill_in('Желаемая зарплата', with: 1000)
      fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('ФИО должно содержать 3 слова и только кириллические буквы и пробелы')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end

    xscenario 'with few skills' do
      visit('/')
      click_link('Создать работника')
      fill_in('ФИО', with: 'Александр Сергеевич Пушкин')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Желаемая зарплата', with: 1000)
      fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('Введите несколько умений')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end

    xscenario 'without salary' do
      visit('/')
      click_link('Создать работника')
      fill_in('ФИО', with: 'Александр Сергеевич Пушкин')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on Rails')
      click_button('Добавить')
      fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('Укажите желаемую зарплату')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end

    xscenario 'with negative salary' do
      visit('/')
      click_link('Создать работника')
      fill_in('ФИО', with: 'Александр Сергеевич Пушкин')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on Rails')
      click_button('Добавить')
      fill_in('Желаемая зарплата', with: -1000)
      fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('Зарплата должна быть целым, положительным числом')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end

    xscenario 'with fractional salary' do
      visit('/')
      click_link('Создать работника')
      fill_in('ФИО', with: 'Александр Сергеевич Пушкин')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on Rails')
      click_button('Добавить')
      fill_in('Желаемая зарплата', with: 1000.5)
      fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67')
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('Зарплата должна быть целым, положительным числом')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end

    xscenario 'without contact' do
      visit('/')
      click_link('Создать работника')
      fill_in('ФИО', with: 'Александр Сергеевич Пушкин')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on Rails')
      click_button('Добавить')
      fill_in('Желаемая зарплата', with: 1000)
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('Укажите номер телефона или адрес эл.почты')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end

    xscenario 'with invalid e-mail' do
      visit('/')
      click_link('Создать работника')
      fill_in('ФИО', with: 'Александр Сергеевич Пушкин')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on Rails')
      click_button('Добавить')
      fill_in('Желаемая зарплата', with: 1000)
      fill_in('Номер телефона или адрес эл.почты', with: 'test@gmail.c')
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('Проверьте номер телефона или адрес эл.почты. Необходимо указать что-то одно: либо номер телефона, либо адрес эл.почты')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end

    xscenario 'with e-mail and phone at the same time' do
      visit('/')
      click_link('Создать работника')
      fill_in('ФИО', with: 'Александр Сергеевич Пушкин')
      fill_in('Умение', with: 'Ruby')
      click_button('Добавить')
      fill_in('Умение', with: 'Ruby on Rails')
      click_button('Добавить')
      fill_in('Желаемая зарплата', with: 1000)
      fill_in('Номер телефона или адрес эл.почты', with: '+123(45) 123-45-67, test@gmail.com')
      check('В поиске работы')
      click_button('Создать работника')

      expect(page).to have_content('Проверьте номер телефона или адрес эл.почты. Необходимо указать что-то одно: либо номер телефона, либо адрес эл.почты')
      expect(page).not_to have_content('Работник создан')
      expect.not_to change(Employee, :count).by(1)
    end
  end
end
