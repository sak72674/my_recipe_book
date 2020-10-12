require 'rails_helper'

RSpec.describe 'Userモデルテスト', type: :model do

 	it '名前、email, passwordが入っていれば登録できること' do
 		user = build(:user)
 		expect(user).to be_valid
 	end

 	it '名前がなければ登録できないこと' do
 		user = build(:user, name: "")
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'emailがなければ登録できないこと' do
  	user = build(:user, email: nil)
    user.valid?
  	expect(user.errors[:email]).to include("can't be blank")
	end

	it 'passwordがなければ登録できないこと' do
  	user = build(:user, password: nil)
    user.valid?
  	expect(user.errors[:password]).to include("can't be blank")
	end
end