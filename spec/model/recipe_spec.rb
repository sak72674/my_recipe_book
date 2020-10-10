require 'rails_helper'

RSpec.describe 'Recipeモデルテスト', type: :model do
  describe 'バリデーションテスト' do
    let!(:user) { build(:user) }
    let!(:genre) { build(:genre) }
    let!(:recipe) { build(:recipe)}
    context 'nameカラム' do
     	it '空欄でないこと' do
        recipe.name = ''
        recipe.valid?
     		expect(recipe).to_not be_valid
     	end

      it 'genre_idカラム' do
      	recipe.genre_id = nil
        recipe.valid?
      	expect(recipe).to_not be_valid
    	end

    	it 'introductionカラム' do
      	recipe.introduction = ""
        recipe.valid?
      	expect(recipe).to_not be_valid
    	end

    	it 'commentカラム' do
      	recipe.comment = ""
        recipe.valid?
        expect(recipe).to_not be_valid
    	end
    end
  end
end