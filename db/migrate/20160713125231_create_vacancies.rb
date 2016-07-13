class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.date :date
      t.integer :validity
      t.integer :salary
      t.string :contacts

      t.timestamps
    end
  end
end
