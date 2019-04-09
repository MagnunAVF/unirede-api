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
      array_of_returned_users = response_as_json.map{ |element| User.new(element) }
      all_users_in_db = User.all

      expect(response_as_json).not_to be_empty
      expect(response_as_json.size).to eq(5)
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
        user_in_db = User.find(valid_user_id)
        returned_user = User.new(response_as_json)

        expect(response_as_json.keys).not_to include(:error)
        expect(response_as_json).not_to be_empty
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
        expect(response_as_json['error']).to eq(true)
        expect(response_as_json['message']).to match(/Couldn't find User/)
      end
    end
  end

  context "DELETE /users/:id" do
    context "when user exists in db" do
      before { delete "/users/#{valid_user_id}" }

      it "should return status code 204" do
        expect(response).to have_http_status(204)
      end
    end

    context "when user DOES NOT exists in db" do
      let(:invalid_user_id) { Faker::Number.between(999, 9999) }

      before { delete "/users/#{invalid_user_id}" }

      it "should return status code 404" do
        expect(response).to have_http_status(404)
      end
    end
  end

  context "POST /users" do
    context "when the request has valid parameters" do
      let(:valid_params) {
        {
          name: Faker::Movies::LordOfTheRings.character,
          email: Faker::Internet.free_email,
          password: Faker::Internet.password(10),
          access_level: 'admin'
       }
      }

      before { post '/users', params: valid_params }

      it "should return status code 201" do
        expect(response).to have_http_status(201)
      end

      it "should create a new user" do
        created_user = User.last

        expect(created_user.name).to eq(valid_params[:name])
        expect(created_user.email).to eq(valid_params[:email])
        expect(created_user.access_level).to eq(valid_params[:access_level])
      end
    end

    context "when the request has NOT VALID parameters" do
      let(:invalid_params) {
         {
          name: Faker::Movies::LordOfTheRings.character,
          email: Faker::Internet.free_email,
          access_level: Faker::Movies::LordOfTheRings.location
       }
      }

      before { post '/users', params: invalid_params }

      it "should return status code 422" do
        expect(response).to have_http_status(422)
      end

      it 'should return an error indicator and a error message' do
        empty_password_message = /Password can't be blank/
        invalid_access_level_message = /Access level must be in possible access levels list/

        expect(response_as_json['error']).to eq(true)
        expect(response_as_json['message']).to match(empty_password_message)
        expect(response_as_json['message']).to match(invalid_access_level_message)
      end
    end
  end
end