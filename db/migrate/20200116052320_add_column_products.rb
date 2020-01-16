class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
  	add_column :products, :sub_category_id, :integer
  end
end
