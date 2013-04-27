class Category < ActiveRecord::Base
  belongs_to :invalid
  belongs_to :volunteer
  attr_accessible :deadline, :description, :state
end
