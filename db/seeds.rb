# encoding: UTF-8
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
Person.create 10.times.map{{name: Vydumschik::Name.full_name,
  phone: rand(10000000)
  }}
Person.all.map{|p| p.address='Киев '+Vydumschik::Address.street_address; p.save}
  
puts Activity.count
require 'json'
json = []
json << '{"category_id":2,"created_at":"2013-04-27T21:27:34Z","deadline":"2013-04-30","description":"фЫВФЫ","name":"фы","person_id":7,"state":"inprogress","updated_at":"2013-04-28T06:55:34Z","volunteer_id":4}'
json << '{"category_id":3,"created_at":"2013-04-28T07:18:04Z","deadline":"2013-04-27","description":"Help in the house to guy that cannot do this himself","name":"Help in the house","person_id":8,"state":"inprogress","updated_at":"2013-04-28T07:44:09Z","volunteer_id":4}'
json << '{"category_id":3,"created_at":"2013-04-28T07:18:04Z","deadline":"2013-04-27","description":"Help in the house to guy that cannot do this himself","name":"Help in the house","person_id":8,"state":"open","updated_at":"2013-04-28T07:44:09Z","volunteer_id":4}'
json << '{"category_id":4,"created_at":"2013-04-28T07:44:46Z","deadline":"2013-04-30","description":"Подвезти детали","name":"Подвезти","person_id":5,"state":"open","updated_at":"2013-04-28T07:44:46Z","volunteer_id":null}'
json.each {|j| Activity.new.update_attributes( (JSON.parse(j)), without_protection: true)}
puts Activity.count

