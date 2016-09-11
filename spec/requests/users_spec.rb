require 'rails_helper'

RSpec.describe "Users", type: :request do
  
	describe "Users" do

		describe "signup" do

			describe "failure" do

				it "should not make a new user" do
					visit signup_path
					fill_in "Name", :with => ""
					fill_in "Email", :with => ""
					fill_in "Password", :with => ""
					fill_in "Confirmation", :with => ""
					expect{ click_button "Sign up" }.not_to change(User, :count)
					#should have_selector("div#error_explanation") test the css content.
				end
			end

			describe "success" do

				it "should make a new user" do
					visit signup_path
					fill_in "Name", :with => "Example user"
					fill_in "Email", :with => "user@example.com"
					fill_in "Password", :with => "foobar"
					fill_in "Confirmation", :with => "foobar"
					expect{ click_button "Sign up" }.to change(User, :count)
				end
			end
		end
	end

end
