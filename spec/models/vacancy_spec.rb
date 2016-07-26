require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  describe 'relations' do
    it { should have_and_belong_to_many(:skills) }
  end
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:validity) }
    it { should validate_presence_of(:salary) }
    it { should validate_presence_of(:contacts) }
  end
end
