# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[:food, :meds, :household, :lift].each do |c|
  Category.find_or_create_by_name c
end
require 'vydumschik'
Person.create 10.times.map{{name: Vydumschik::Name.full_name}}
  
