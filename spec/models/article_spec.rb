require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validation' do
    let(:article) { build(:article) }
 
    it "test article validity" do
      expect(article).to be_valid  
    end

    it "check article validity" do
      article.title = ""
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end
    
  end
end
