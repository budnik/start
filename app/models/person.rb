class Person < ActiveRecord::Base
  has_many :activities, inverse_of: :person
  attr_accessible :address, :name, :dob, :phone
  geocoded_by :address   # can also be an IP address
  after_validation :geocode  


  rails_admin do
    configure :dob, :date
  end
end
