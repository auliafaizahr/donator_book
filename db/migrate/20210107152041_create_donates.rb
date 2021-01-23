class CreateDonates < ActiveRecord::Migration[6.0]
  def change
    create_table :donates do |t|
      t.decimal :amount,        null: false, default: 0
      t.integer :category,      null: false, default: 1
      t.string  :donator,       null: false, default: ""

      t.timestamps
    end
  end
end
