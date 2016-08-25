require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :home
      assert_select "title", @base_title + " | Home"
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :contact
      assert_select "title", @base_title + " | Contact"
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :about
      assert_select "title", @base_title + " | About"
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :help
      assert_select "title", @base_title + " | Help"
    end
  end

end
