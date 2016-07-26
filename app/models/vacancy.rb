class Vacancy < ApplicationRecord
  has_and_belongs_to_many :skills

  validates :title, :date, :validity, :salary, :contacts, presence: true

end
