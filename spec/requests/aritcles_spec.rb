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
      get '/articles'
      body = JSON.parse(response.body).deep_symbolize_keys
      expect(body).to eq(
        data: [
          {
            type: "article",
            id: article.id.to_s,
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

