require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  context "GET /users" do
    let!(:users) { create_list(:user, 5) }

    before { get '/users' }

    it "should return status code 200" do
      expect(response).to have_http_status(200)
    end

    it "should return all users" do
      returned_json = JSON.parse(response.body)
      array_of_returned_users = returned_json.map{ |element| User.new(element) }
      all_users_in_db = User.all

      expect(returned_json).not_to be_empty
      expect(returned_json.size).to eq(5)
      expect(array_of_returned_users).to eq(all_users_in_db)
    end
  end
end