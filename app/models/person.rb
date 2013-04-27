class Person < ActiveRecord::Base
  has_many :activities
  attr_accessible :address, :name, :dob
  geocoded_by :address   # can also be an IP address
  after_validation :geocode  


  rails_admin do
    configure :dob, :date
  end
end
