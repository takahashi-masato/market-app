require 'rails_helper'
describe DeliverAddress do
  describe '#create' do

    it "family_name_kanji、first_name_kanji、family_name_kana、first_name_kana、postal_code、prefecture、city、address1が存在すれば登録できること" do
      user = build(:deliver_address)
      expect(user).to be_valid
    end

    it "family_name_kanjiがない場合は登録ができないこと" do
      user = build(:deliver_address, family_name_kanji: "")
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("を入力してください", "は不正な値です")
    end

    it "first_name_kanjiがない場合は登録ができないこと" do
      user = build(:deliver_address, first_name_kanji: "")
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("を入力してください", "は不正な値です")
    end

    it "family_name_kanaがない場合は登録ができないこと" do
      user = build(:deliver_address, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "first_name_kanaがない場合は登録ができないこと" do
      user = build(:deliver_address, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "postal_codeがない場合は登録ができないこと" do
      user = build(:deliver_address, postal_code: "")
      user.valid?
      expect(user.errors[:postal_code]).to include("を入力してください")
    end

    it "prefectureがない場合は登録ができないこと" do
      user = build(:deliver_address, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("を入力してください")
    end

    it "cityがない場合は登録ができないこと" do
      user = build(:deliver_address, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "address1がない場合は登録ができないこと" do
      user = build(:deliver_address, address1: "")
      user.valid?
      expect(user.errors[:address1]).to include("を入力してください")
    end


  end
end