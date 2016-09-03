require 'rails_helper'

RSpec.describe UsersController, type: :controller do

render_views

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
end

  describe "It should have a title" do
  	it "the page has a title" do
  		get :new
  		#expect(response).to have_selector('title',"Sign up")
  		assert_select "title", "Ruby on Rails Tutorial Sample App | Sign Up"
  	end
  end


end
