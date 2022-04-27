require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validation" do
    it "should validate factory" do
      user = build(:user)
      expect(user).to be_valid
    end
    
    it "should validate presence of attributes" do      
      user = build :user, login: nil, provider: nil
      expect(user).not_to be_valid
      expect(user.errors.messages[:login]).to include("can't be blank")
      expect(user.errors.messages[:provider]).to include("can't be blank")
    end

    it "should validate login uniqueness" do
      first_user = create(:user)
      second_user = build :user, login: first_user.login
      expect(second_user).not_to be_valid
      second_user.login = 'newpass'
      expect(second_user).to be_valid
    end
    
  end
  
end
