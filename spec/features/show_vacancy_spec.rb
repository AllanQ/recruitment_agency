require 'rails_helper'

feature 'vacancy page' do
  scenario 'header' do
    visit('/')
    click_link('Работники')

    expect(page).to have_content('Работники')
  end

  let(:vacancy1) { create(:vacancy, title: 'Front-end developer', salary: 999,
    contacts: 'email: js@developer.com' ) }
  let(:vacancy2) { create(:vacancy, title: 'Rails developer') }
  let(:skill1) { create(:skill, name: 'Js') }
  let(:skill2) { create(:skill, name: 'Angular') }
  let(:skill3) { create(:skill, name: 'React') }
  let(:skill4) { create(:skill, name: 'Ror') }
  let(:skill5) { create(:skill, name: 'Haml') }
  let(:skill6) { create(:skill, name: 'Cucumber') }

  scenario 'show vacancy' do
    vacancy1.skills << skill1
    vacancy1.skills << skill2
    vacancy1.skills << skill3
    vacancy2.skills << skill4
    vacancy2.skills << skill5
    vacancy2.skills << skill6
    visit('/')
    click_link('Front-end developer')

    expect(page).to have_content('Front-end developer')
    expect(page).to have_content('999')
    expect(page).to have_content('email: js@developer.com')
    expect(page).to have_content('Js')
    expect(page).to have_content('Angular')
    expect(page).to have_content('React')
    expect(page).not_to have_content('Rails developer')
    expect(page).not_to have_content('Ror')
    expect(page).not_to have_content('Haml')
    expect(page).not_to have_content('Cucumber')
  end
end
