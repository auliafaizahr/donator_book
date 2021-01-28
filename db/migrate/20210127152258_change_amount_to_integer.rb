class ChangeAmountToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :donates, :amount, :integer
  end
end
