class CreateJoinTableVacancySkill < ActiveRecord::Migration[5.0]
  def change
    create_join_table :vacancies, :skills do |t|
      # t.index [:vacancy_id, :skill_id]
      # t.index [:skill_id, :vacancy_id]
    end
  end
end
