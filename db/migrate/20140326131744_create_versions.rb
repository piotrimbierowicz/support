class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name
      t.integer :project_id
      t.string :version_status

      t.timestamps
    end
  end
end
