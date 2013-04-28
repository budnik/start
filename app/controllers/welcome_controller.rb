class WelcomeController < ApplicationController
  def index
    @json = "document.points = "
    @json += Person.joins(:activities).map do |p|
      {
        latitude:   p.latitude,
        longitude:  p.longitude,
        id: p.activities.last.try(:id)
      }
    end.to_json
  end
end
