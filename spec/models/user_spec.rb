require 'rails_helper'

RSpec.describe User, type: :model do
  context "When creating" do
    let!(:valid_user) { build(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:access_level) }

    it { should have_secure_password }

    it { should validate_uniqueness_of(:email) }

    it "should validate the correct format of email attribute" do
      expect(valid_user.valid?).to eq(true)

      invalid_user_1 = build(:user, email: Faker::Movies::Hobbit.quote)
      expect(invalid_user_1.valid?).to eq(false)
      invalid_user_2 = build(:user, email: "foo.gmail.com")
      expect(invalid_user_2.valid?).to eq(false)
      invalid_user_3 = build(:user, email: "foo@gmail")
      expect(invalid_user_3.valid?).to eq(false)
      invalid_user_4 = build(:user, email: "@gmail.com")
      expect(invalid_user_4.valid?).to eq(false)
      invalid_user_5 = build(:user, email: "foo@gmail,com")
      expect(invalid_user_5.valid?).to eq(false)
      invalid_user_6 = build(:user, email: "foo@gmail.com!")
      expect(invalid_user_6.valid?).to eq(false)
    end

    it "should validate if access level is in possible access levels list" do
      expect(valid_user.valid?).to eq(true)

      invalid_user = build(:user, access_level: Faker::Games::WorldOfWarcraft.hero)
      expect(invalid_user.valid?).to eq(false)
    end
  end
end
