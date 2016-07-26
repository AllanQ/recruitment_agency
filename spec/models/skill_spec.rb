require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'relations' do
    it { should have_and_belong_to_many(:vacancies) }
    it { should have_and_belong_to_many(:employees) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
