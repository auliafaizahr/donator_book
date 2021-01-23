class AddDateDonate < ActiveRecord::Migration[6.0]
  def change
    add_column :donates, :date_donate, :date
  end
end
