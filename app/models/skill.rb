class Skill < ApplicationRecord
  has_and_belongs_to_many :vacancies
  has_and_belongs_to_many :employees
end
