require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 5) }
  let(:valid_user_id) { users.last.id }

  context "GET /users" do
    before { get "/users" }

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

  context "GET /users/:id" do
    context "when user exists in db" do
      before { get "/users/#{valid_user_id}" }

      it "should return status code 200" do
        expect(response).to have_http_status(200)
      end

      it "should return the correct user" do
        returned_json = JSON.parse(response.body)
        user_in_db = User.find(valid_user_id)
        returned_user = User.new(returned_json)

        expect(returned_json.keys).not_to include(:error)
        expect(returned_json).not_to be_empty
        expect(returned_user).to eq(user_in_db)
      end
    end

    context "when user DOES NOT exists in db" do
      let(:invalid_user_id) { Faker::Number.between(999, 9999) }

      before { get "/users/#{invalid_user_id}" }

      it "should return status code 404" do
        expect(response).to have_http_status(404)
      end

      it 'should return an error indicator and a error message' do
        returned_json = JSON.parse(response.body)

        expect(returned_json['error']).to eq(true)
        expect(returned_json['message']).to match(/Couldn't find User/)
      end
    end
  end
end