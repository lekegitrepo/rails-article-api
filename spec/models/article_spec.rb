require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validation' do
    let(:article) { build(:article) }
 
    it "test article validity" do
      expect(article).to be_valid  
    end

    it "check article title validity" do
      article.title = ""
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end
    
    it "check article content validity" do
      article.content = ""
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it "check article slug validity" do
      article.slug = ""
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end
    
  end
end
