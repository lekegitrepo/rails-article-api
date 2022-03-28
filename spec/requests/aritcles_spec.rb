require 'rails_helper'

RSpec.describe ArticlesController do
  describe "#index" do
    it 'returns success status' do
      get '/articles'
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)  
    end

    it "returns proper JSON" do
      article = create(:article)
      body = JSON.parse(response.body)
      expect(body).to eq(
        data: [
          {
            type: "article",
            id: 1,
            attributes: {
              title: article.title,
              content: article.content,
              slug: article.slug
            }
          }
        ]
      )  
    end
    
  end  
end

