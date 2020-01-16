ActiveAdmin.register SubCategory do

  permit_params :id, :name, :category_id

  index do
    id_column
    column :name
    column :category
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :category_id, as: :select, :collection => Category.all.map{|c| ["#{c.name}", c.id]}  
    end
    f.actions 
  end

  show do
    attributes_table :name, :category
  end
end