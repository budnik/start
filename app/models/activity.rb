class Activity < ActiveRecord::Base
  belongs_to :person
  belongs_to :volunteer
  attr_accessible :category, :deadline, :description, :state
end
