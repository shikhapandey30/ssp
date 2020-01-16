class Product < ApplicationRecord	
	mount_uploader :image, ImageUploader
	# Association
	belongs_to :sub_category
	# Delegates
	delegate :category, to: :sub_category, allow_nil: true
  STATUS = {:active => "Active", :inactive => "In active"} 

	def display_price
    result = ""
    if self.price.to_f > 0
      result += "#{self.price.to_i}"
    end
    return result
  end

  def display_full_price
    result = ""
    if self.full_price.to_f > 0
      result += "#{self.full_price.to_i}"
    end
    return result
  end
  
  def discount_percentage
    if price.present? && price > 0 && full_price.present? && full_price > 0
      " " + (100 - (price.to_f / full_price.to_f * 100.0)).to_s + "%"
    else
      nil
    end
  end

  def images
    {
      thumb: image.url("thumb".to_sym),
      medium: image.url("medium".to_sym),
      large: image.url("large".to_sym)
    }
  end

  def status_display
    Product::STATUS[status]
  end

end
