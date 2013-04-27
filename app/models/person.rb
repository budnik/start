class Person < ActiveRecord::Base
  has_many :activities
  attr_accessible :address, :name
end
