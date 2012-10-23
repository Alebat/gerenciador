class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :story
      t.integer :code
      t.integer :points
      t.references :project

      t.timestamps
    end
    add_index :cards, :project_id
  end
end
