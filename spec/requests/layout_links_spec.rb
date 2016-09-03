require 'rails_helper'


RSpec.describe "LayoutLinks", type: :request do

    it "should have a Home page at '/'" do
      	get '/'
      	expect(response).to have_http_status(:success)
    end

    it "should have a Contact page at '/contact'" do
    	get '/contact'
    	expect(response).to have_http_status(:success)
    end

    it "should have a Contact page at '/about'" do
    	get '/about'
    	expect(response).to have_http_status(:success)
    end

    it "should have a Contact page at '/help'" do
    	get '/help'
    	expect(response).to have_http_status(:success)
    end

    it "should have a Sign up page at '/signup'" do
        get '/signup'
        expect(response).to have_http_status(:success)
    end
 
end
