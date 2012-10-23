class PopulateCardStatus < ActiveRecord::Migration
  def up
    CardStatus.create(status: "To Do")
    CardStatus.create(status: "Doing")
    CardStatus.create(status: "Done")
  end

  def down
    CardStatus.delete_all
  end
end
