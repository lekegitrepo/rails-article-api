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
    
    it "has a valid content" do
      article.content = ""
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it "has a valid slug" do
      article.slug = ""
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end    
  end

  context "validate uniqueness of the slug" do

    it "has a unique slug" do
      article_one = create(:article)
      expect(article_one).to be_valid
      article_two = build(:article, slug: article_one.slug)
      expect(article_two).not_to be_valid
      expect(article_two.errors[:slug]).to include("has already been taken")
    end
    
  end
  
end
