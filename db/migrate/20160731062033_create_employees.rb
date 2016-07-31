class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string  :name
      t.string  :contact
      t.boolean :search
      t.integer :salary

      t.timestamps
    end
  end
end
