class CreateOutputMoneys < ActiveRecord::Migration[6.0]
  def change
    create_table :output_moneys do |t|
      t.date :date_used,           null: false
      t.integer :amount,           null: false, default: 0
      t.string :needs,             null: false
      
      t.timestamps
    end
  end
end
