class CreateCardStatuses < ActiveRecord::Migration
  def change
    create_table :card_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
