require 'rails_helper'

module Models
  RSpec.describe User, :type => :model do

    it "is valid with valid attributes" do
      user = create(:user)
      expect(user).to be_valid
    end

    it "has a unique email" do
      user = create(:user)
      another_user = build(:user)
      expect(another_user).to_not be_valid
    end

    it "is not valid without a password" do
      user = create(:user)
      another_user = build(:user, password: nil)
      expect(another_user).to_not be_valid
    end

    it "is not valid without a email" do
      user = create(:user)
      another_user = build(:user, email: nil)
      expect(another_user).to_not be_valid
    end

    it 'is successfully authenticated with password' do
      user = create(:user)
      expect( user.authenticate("secret") ).to be user
      expect( user.authenticate("wrong") ).to be false
    end

  end
end