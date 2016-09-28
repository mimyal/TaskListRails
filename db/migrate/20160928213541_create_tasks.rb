class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :owner
      t.boolean :completion_status
      t.date :completion_date

      t.timestamps null: false
    end
  end
end
