require 'rails_helper'

module Models
  RSpec.describe Message, type: :model do

    it "is valid with valid attributes" do
      user = create(:user)
      message = create(:message, :user => user)
      expect(message).to be_valid
    end
  end

end
