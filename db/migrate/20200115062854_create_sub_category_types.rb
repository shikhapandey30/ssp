class CreateSubCategoryTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_category_types do |t|
      t.string :name
      t.integer :sub_category_id

      t.timestamps
    end
  end
end
