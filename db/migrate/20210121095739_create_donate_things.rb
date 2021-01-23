class CreateDonateThings < ActiveRecord::Migration[6.0]
  def change
    create_table :donate_things do |t|
      t.date      :date_donate,     null: false
      t.string    :donator,         null: false, default: ""
      t.integer   :category,        null: false, default: 0
      t.string    :name,            null: false
      t.integer   :amount,          null: false
      
      t.timestamps
    end
  end
end
