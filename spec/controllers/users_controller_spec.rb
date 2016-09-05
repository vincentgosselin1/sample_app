require 'rails_helper'

RSpec.describe UsersController, type: :controller do

render_views

describe "GET #show" do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it "should be succressful" do
    get :show, :id => @user
    response.should be_success
  end

  it "should find the right user" do
    get :show, :id => @user
    assigns(:user).should == @user
  end

  it "should have the right title" do
    get :show, :id => @user
    assert_select("title", "Ruby on Rails Tutorial Sample App | "+@user.name)
  end

  it "should include the user's name" do
    get :show, :id => @user
    assert_select("h1", @user.name)
  end

  it "should have a profile image" do
    get :show, :id => @user
    assert_select("h1>img", :class => "gravatar")
  end
end

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
