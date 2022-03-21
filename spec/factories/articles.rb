FactoryBot.define do
  factory :article do
    title { "Article Title" }
    content { "Article Content" }
    # slug { "article-slug" }

    sequence (:slug) { |n| "article-slug #{n}" }
  end
end
