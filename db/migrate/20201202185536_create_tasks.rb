class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string  :name
      t.integer :priority
      t.boolean :done
      t.date    :date
      t.string  :category
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
