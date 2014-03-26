class AddVersionIdToManualTest < ActiveRecord::Migration
  def change
    add_column :manual_tests, :version_id, :integer
    remove_column :manual_tests, :project_id
  end
end
