class AddOnSaleInWidgets < ActiveRecord::Migration[6.0]
  def change
    add_column :widgets, :on_sale, :boolean, default: true
  end
end
