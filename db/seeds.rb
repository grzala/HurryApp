# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#by Mikolaj Panasiuk
@user = User.new(:name => "test", :password => "testtest", :email => "test@test.com")
@user.save

@user = User.new(:name => "test2", :password => "test2test2", :email => "test2@test.com")
@user.save

@user = User.new(:name => "test3", :password => "test3test3", :email => "test3@test.com")
@user.save

@admin = User.new(:name => "admin", :password => "adminadmin", :email => "admin@test.com", :admin => true)
@admin.save