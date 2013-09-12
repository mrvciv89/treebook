require 'test_helper'

class UserTest < ActiveSupport::TestCase
 test "a user should enter a first name" do 
 	user = User.new
 	assert !user.save
 	assert !user.errors[:first_name].empty?
 end

 test "a user should enter a last name" do 
 	user = User.new
 	assert !user.save
 	assert !user.errors[:last_name].empty?
 end

  test "a user should enter a profile name" do 
 	user = User.new
 	assert !user.save
 	assert !user.errors[:profile_name].empty?
 end

 test "a user should have a unique profile name" do 
 	user = User.new
 	user.profile_name = 'mrvciv'
 	user.email= "mrvcivelek@hotmail.com"
 	user.first_name= "Merve"
 	user.last_name= "Civelek"
 	user.password= "05348605914"
 	user.password_confirmation="05348605914"

 	assert !user.save
 	puts user.errors.inspect
 	assert !user.errors[:profile_name].empty?
 end

 test "a user should have a profile name without spaces" do 
 	user = User.new
 	user.profile_name = "My Profile with spaces"

 	assert !user.save
 	assert !user.errors[:profile_name].empty?
 	assert user.errors[:profile_name].include?("Must be formatted correctly.")
 end
end
