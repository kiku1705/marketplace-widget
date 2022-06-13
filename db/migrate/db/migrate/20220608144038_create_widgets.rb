class CreateWidgets < ActiveRecord::Migration[6.0]
    def change
      create_table :widgets do |t|
        t.integer :seller_id
        t.string :description
        t.decimal :price, precision: 8, scale: 2 
  
        t.timestamps
      end
    end
  end