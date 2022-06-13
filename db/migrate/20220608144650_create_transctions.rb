class CreateTransctions < ActiveRecord::Migration[6.0]
  def change
    create_table :transctions do |t|
      t.references :seller
      t.references :buyer
      t.references :widget, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
