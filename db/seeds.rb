# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Organisation.create name:"1"
Organisation.create name:"2"
Organisation.create name:"3"
Organisation.create name:"4"
Organisation.create name:"5"
Organisation.create name:"6"
Organisation.create name:"7"
Organisation.create name:"8"
Organisation.create name:"9"
Organisation.create name:"10"

u = []
u << User.create(:password => "password", :password_confirmation => "password", :email => "admin@example.com")
u << User.create( :password => "password", :password_confirmation => "password", :email => "admin1@example.com")
u << User.create( :password => "password", :password_confirmation => "password", :email => "admin2@example.com")
u << User.create( :password => "password", :password_confirmation => "password", :email => "admin3@example.com")
u << User.create( :password => "password", :password_confirmation => "password", :email => "admin4@example.com")
u << User.create( :password => "password", :password_confirmation => "password", :email => "admin5@example.com")
u << User.create( :password => "password", :password_confirmation => "password", :email => "admin6@example.com")
u << User.create( :password => "password", :password_confirmation => "password", :email => "admin7@example.com")

u.each do |user|
  user.organisation_id = Organisation.last.id
  user.add_role "admin", Organisation.last   if user.id != 2 and user.id!=3
  user.add_role "team_member", Organisation.last if user.id == 2
  user.add_role "guest", Organisation.last       if user.id == 3
  user.save!
end