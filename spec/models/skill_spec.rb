require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'relations' do
    it { should have_and_belong_to_many(:vacancies) }
    it { should have_and_belong_to_many(:employees) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'add_skills' do
    let(:vacancy) { create(:vacancy) }
    let(:employee) { create(:employee) }
    let(:skill) { create(:skill, name: 'Ruby') }
    let(:all_params1) { { skills: ", Ruby=#{skill.id}, Ruby on rails=0" } }
    let(:all_params2) { { skills: ", Ruby=#{skill.id}, Haml=0" } }

    xit 'create new skill belongs to vacancy' do
      Skill.add_skills(vacancy, all_params1)

      expect.to change(Skill, :count).by(1)
      skill = Skill.last
      expect(skill.name).to eq('Ruby on rails')
      expect(vacancy.skills.map{ |skill| skill.name })
        .to eq(['Ruby', 'Ruby on rails'])
    end

    xit 'create new skill belongs to employee' do
      Skill.add_skills(employee, all_params2)

      expect.to change(Skill, :count).by(1)
      skill = Skill.last
      expect(skill.name).to eq('Haml')
      expect(employee.skills.map{ |skill| skill.name }).to eq(%w(Ruby Haml))
    end
  end

end
