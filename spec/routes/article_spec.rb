require 'rails_helper'

RSpec.describe 'articles routes' do
  it "route to articles#index" do
    # expect(gets '/articles').to route_to (controller: 'articles', action: 'index')
    aggregate_failures do
      expect(gets '/articles').to route_to ('articles#index')
      expect(gets '/articles?page[number]=3').to route_to('articles#index', page:{ 'number': 3 })
    end
  end
  
end
