# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
 	
	before(:each) do
		@attr = {:name => "Example User", :email => "user@example.com"}
	end

	it "should create a new instance given valid attributes" do
		User.create!(@attr)
	end

	it "should require a name" do
		no_name_user = User.new(@attr.merge(:name => ""))
		no_name_user.should_not be_valid
	end

	it "should require an email address" do
		no_email_user = User.new(@attr.merge(:email => ""))
		no_email_user.should_not be_valid
	end

	it "should reject names that are too long" do
		long_name = "a" * 51
		long_name_user  = User.new(@attr.merge(:name => long_name))
		long_name_user.should_not be_valid
	end

	it "should accept valid email addresses" do
		addresses = %w{user@foo.com user@email.com henryVI@majeste.com}
		addresses.each do |address|
			valid_email_address = User.new(@attr.merge(:email => address))
			valid_email_address.should be_valid
		end
	end

	it "should reject invalid email addresses" do
		addresses = %w{@foo.JAMboncom useremail.com @majeste.com}
		addresses.each do |address|
			invalid_email_address = User.new(@attr.merge(:email => address))
			invalid_email_address.should_not be_valid
		end
	end

	it "should reject duplicate email addresses" do
		#Put a user with a given email adress into the database
		User.create!(@attr)
		user_with_duplicate_email = User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end

	it "should reject email addresses identical up to case" do
		upcased_email = @attr[:email].upcase
		User.create!(@attr.merge(:email => upcased_email))
		user_with_duplicate_email = User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end



end
