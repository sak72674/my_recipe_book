require 'rails_helper'

RSpec.describe 'Bookmarkモデルテスト', type: :model do
  let!(:user) { build(:user) }
  let!(:genre) { build(:genre) }
  let!(:bookmark) { build(:bookmark) }
	subject { bookmark. valid? }

 	it '名前がなければ登録できないこと' do
 		bookmark.name = ""
    expect(bookmark).to_not be_valid
  end

  it 'ジャンルがなければ登録できないこと' do
  	bookmark.genre_id = nil
  	expect(bookmark).to_not be_valid
	end

	it 'URLがなければ登録できないこと' do
  	bookmark.url = ""
  	expect(bookmark).to_not be_valid
	end

	it 'サイト名がなければ登録できないこと' do
  	bookmark.site = ""
  	expect(bookmark).to_not be_valid
	end
end