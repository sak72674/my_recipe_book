FactoryBot.define do
  factory :bookmark do
  	user_id { 1 }
  	genre_id { 1 }
  	name { "ヒラメのムニエル" }
  	url { "https://github.com/sak72674/my_recipe_book" }
  	site { "github" }
  end
end