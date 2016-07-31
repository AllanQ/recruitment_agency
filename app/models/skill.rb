class Skill < ApplicationRecord
  has_and_belongs_to_many :vacancies
  has_and_belongs_to_many :employees

  validates :name, presence: true

  def self.add_skills_from_new(vacancy_or_employee, all_params)
    skills = all_params.to_h[:skills][2..-1].split(', ')
    skills.each do |str|
      i = str.rindex('=')
      name = str[0...i]
      id = str[i+1..-1].to_i
      add_skill(vacancy_or_employee, name, id)
    end
  end

  def self.add_skills_from_edit(vacancy_or_employee, str)
    skills = []
    str.strip.split(/[,\/]/).each do |st|
      name = st.strip.capitalize
      skill = Skill.find_by(name: name)
      skill = Skill.create(name: name) unless skill
      vacancy_or_employee.skills << skill
      skills << skill
    end
    skills
  end

  private

  def self.add_skill(vacancy_or_employee, name, id)
    if id == 0
      vacancy_or_employee.skills << Skill.create(name: name)
    else
      vacancy_or_employee.skills << Skill.find(id)
    end
  end
end
