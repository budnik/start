class Activity < ActiveRecord::Base
  belongs_to :person
  belongs_to :volunteer
  belongs_to :category
  attr_accessible :deadline, :description, :state, :person_id, :category_id
end

