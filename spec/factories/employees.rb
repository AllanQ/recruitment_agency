FactoryGirl.define do
  factory :employee do
    name 'Иванов Иван Иванович'
    contact '+123(45)1234567'
    search true
    sequence(:salary) { |n| 1000 + n * 10 }
  end
end
