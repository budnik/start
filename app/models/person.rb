class Person < ActiveRecord::Base
  has_many :activities
  attr_accessible :address, :name
  geocoded_by :address   # can also be an IP address
  after_validation :geocode  
end
