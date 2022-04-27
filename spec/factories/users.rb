FactoryBot.define do
  factory :user do
    sequence(:login) { |n|  "user #{n}" }
    name { "John Doe" }
    url { "http://article.com" }
    avatar_url { "http://article.com/avatar_url" }
    provider { "github" }
  end
end
