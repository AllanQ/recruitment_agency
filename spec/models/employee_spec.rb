require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relations' do
    it { should have_and_belong_to_many(:skills) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:contact) }
    it { should validate_presence_of(:search) }
    it { should validate_presence_of(:salary) }
  end
end
