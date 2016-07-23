class Skill < ApplicationRecord
  has_and_belongs_to_many :vacancies
  has_and_belongs_to_many :employees

  def self.add_skills(vacancy_or_employee, all_params)
    skills = all_params.to_h[:skills][2..-1].split(', ')
    skills.each do |str|
      i = str.rindex('=')
      skill = str[0...i]
      id = str[i+1..-1].to_i
      add_skill(vacancy_or_employee, skill, id)
    end
  end

  private

  def self.add_skill(vacancy_or_employee, skill, id)
    if id == 0
      vacancy_or_employee.skills << Skill.create(name: skill)
    else
      vacancy_or_employee.skills << Skill.find(id)
    end
  end
end
