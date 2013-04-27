class Category < ActiveRecord::Base
  attr_accessible :icon, :name
  has_many :activies
end
