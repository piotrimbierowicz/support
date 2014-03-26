class CreateManualTests < ActiveRecord::Migration
  def change
    create_table :manual_tests do |t|
      t.integer :project_id
      t.integer :user_id
      t.text :content
      t.string :name
      t.string :test_status

      t.timestamps
    end
  end
end
