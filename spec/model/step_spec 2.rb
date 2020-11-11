require 'rails_helper'

RSpec.describe 'stepモデルテスト', type: :model do
	it 'textカラムが空欄でないこと' do
		recipe = build(:recipe)
		step = build(:step)
		step.valid?
		expect(step).to_not be_valid
	end
end
