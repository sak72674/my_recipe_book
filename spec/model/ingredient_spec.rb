require 'rails_helper'

RSpec.describe 'ingredientモデルテスト', type: :model do
	let!(:recipe) { build(:recipe) }
	subject { ingredient.valid? }
	it '名前がなければ登録できないこと' do
		ingredient = build(:ingredient, name: "")
		expect(ingredient).to_not be_valid
	end

	it '分量がなければ登録できないこと' do
		ingredient = build(:ingredient, quantity: "")
		expect(ingredient).to_not be_valid
	end
end
