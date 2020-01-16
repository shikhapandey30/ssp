class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :sub_category_type_id
      t.float :price
      t.float :full_price
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end
