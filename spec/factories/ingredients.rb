FactoryBot.define do
  factory :ingredient do
  	recipe_id { 1 }
  	name { "豚肉" }
  	quantity { "300g" }
  end
end