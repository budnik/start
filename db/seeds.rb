# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

{meds: 'twirl#hospitalIcon', food: 'twirl#shopIcon',
 household: 'twirl#workshopIcon', lift: 'twirl#carIcon'}.each_pair do |c, i|
  Category.create name: c, icon: i
end


require 'vydumschik'
Person.create 30.times.map{{name: Vydumschik::Name.full_name,
  phone: ("555"+(rand(90000)+10000).to_s).to_i
  }}
Person.all.map{|p| p.address='Киев '+Vydumschik::Address.street_address; p.save}
  
require 'json'
json = []
json << '{"category_id":2,"created_at":"2013-04-27T21:27:34Z","deadline":"2013-04-30","description":"фЫВФЫ","name":"фы","person_id":7,"state":"inprogress","updated_at":"2013-04-28T06:55:34Z","volunteer_id":4}'
json << '{"category_id":3,"created_at":"2013-04-28T07:18:04Z","deadline":"2013-04-27","description":"Help in the house to guy that cannot do this himself","name":"Help in the house","person_id":8,"state":"inprogress","updated_at":"2013-04-28T07:44:09Z","volunteer_id":4}'
json << '{"category_id":3,"created_at":"2013-04-28T07:18:04Z","deadline":"2013-04-27","description":"Help in the house to guy that cannot do this himself","name":"Help in the house","person_id":8,"state":"open","updated_at":"2013-04-28T07:44:09Z","volunteer_id":4}'
json << '{"category_id":4,"created_at":"2013-04-28T07:44:46Z","deadline":"2013-04-30","description":"Подвезти детали","name":"Подвезти","person_id":2,"state":"open","updated_at":"2013-04-28T07:44:46Z","volunteer_id":null}'
json << '{"category_id":2,"created_at":"2013-04-28T07:18:04Z","deadline":"2013-04-27","description":"Help in the house to guy that cannot do this himself","name":"Help in the house","person_id":7,"state":"inprogress","updated_at":"2013-04-28T07:44:09Z","volunteer_id":4}'
json << '{"category_id":2,"created_at":"2013-04-28T07:18:04Z","deadline":"2013-04-27","description":"Help in the house to guy that cannot do this himself","name":"Help in the house","person_id":1,"state":"open","updated_at":"2013-04-28T07:44:09Z","volunteer_id":4}'
json << '{"category_id":1,"created_at":"2013-04-28T07:44:46Z","deadline":"2013-04-30","description":"Подв езти детали","name":"Подвезти","person_id":5,"state":"open","updated_at":"2013-04-28T07:44:46Z","volunteer_id":null}'

ac = 10.upto(30).map do |i|
  r = 1+rand(4)
  { category_id: r,
    deadline: "2013-05-01",
    name: ["","Купить лекратсв","Купить еды",
      "Помощь по дому","Подвезти"][r],
    description: Vydumschik::Lorem.sentence,
    state: "open",
    person_id: i
  }
end.each {|j| Activity.new.update_attributes  j, without_protection: true}


json.each {|j| Activity.new.update_attributes( (JSON.parse(j)), without_protection: true)}

