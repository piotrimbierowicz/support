class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.text :description
      t.integer :author_id
      t.string :status

      t.timestamps
    end
  end
end
