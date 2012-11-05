class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :activity
      t.references :project

      t.timestamps
    end
    add_index :actions, :project_id
  end
end
