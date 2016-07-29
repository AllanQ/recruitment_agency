FactoryGirl.define do
  factory :vacancy do
    title 'Ruby developer'
    date '2016-07-13'
    validity 7
    sequence(:salary) { |n| 1000 + n * 10 }
    contacts 'tel: +123(45)1234567, email: test@test.com'
  end
end
