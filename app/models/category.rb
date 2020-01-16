class Category < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :name, :presence => true
	has_many :sub_categories

	def self.form_select_categories(blog)
  	result = ""
  	Category.all.each do |super_category|
  		result += "<optgroup label='#{super_category.name}'>"
  		super_category.sub_categories.each do |category|
	  		result += "<optgroup label='&nbsp;&nbsp;#{category.name}'>"
	  	end
  		result += "</optgroup>"
  	end
    result.html_safe
  end

  def as_json(options = {})
    all_options = options.merge!(:except => [:created_at, :updated_at, :image])
    super(all_options).tap do |json|
    end
  end

  # def images
  #   {
  #     thumb: image.url("thumb".to_sym),
  #     medium: image.url("medium".to_sym),
  #     large: image.url("large".to_sym)
  #   }
  # end
end


