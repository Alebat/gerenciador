class AddCardStatusToCard < ActiveRecord::Migration
  def change
    add_column :cards, :card_status_id, :integer
  end
end
