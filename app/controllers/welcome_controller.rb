class WelcomeController < ApplicationController
  def index
    @json = "document.points = "
    @json += Person.joins(:activities).map do |p|
      {
        latitude:   p.latitude,
        longitude:  p.longitude,
        activity: {
          id: p.activities.last.try(:id),
          name: p.activities.last.try(:name),
          deadline: p.activities.last.try(:deadline),
          description: p.activities.last.try(:description)
        }
      }
    end.to_json
  end
end
