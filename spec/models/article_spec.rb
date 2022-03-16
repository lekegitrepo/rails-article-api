require 'rails_helper'

RSpec.describe Article, type: :model do
  it "create an instance of an article" do
    article = create(:article)
    expect(article).to be_an(Object)
    expect(article.title).to be_a(String)  
  end
    
end
