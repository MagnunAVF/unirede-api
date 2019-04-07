require 'rails_helper'

RSpec.describe User, type: :model do
  context "When created" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:access_level) }
  end
end
