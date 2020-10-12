FactoryBot.define do
  factory :recipe do
  	user_id { 1 }
  	genre_id { 1 }
  	name { "豚肉の生姜焼き" }
  	introduction { "簡単美味しい" }
  	comment { "ポイント" }
  	how_many { 2 }
  	is_private { false }
  end
end

