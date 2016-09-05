# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do
	factory :user do
	name					"Vincent Gosselin"
	email					"vincentgosselin1@gmail.com"
	password 				"foobar"
	password_confirmation 	"foobar"
	end
end

