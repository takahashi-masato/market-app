require 'rails_helper'
describe Identification do
  describe '#create' do

    it "family_name_kanji、first_name_kanji、family_name_kana、first_name_kana、birthdayが存在すれば登録できること" do
      user = build(:identification)
      expect(user).to be_valid
    end

    it "family_name_kanjiがない場合は登録ができないこと" do
      user = build(:identification, family_name_kanji: "")
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("を入力してください", "は不正な値です")
    end

    it "first_name_kanjiがない場合は登録ができないこと" do
      user = build(:identification, first_name_kanji: "")
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("を入力してください", "は不正な値です")
    end

    it "family_name_kanaがない場合は登録ができないこと" do
      user = build(:identification, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "first_name_kanaがない場合は登録ができないこと" do
      user = build(:identification, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "birthdayがない場合は登録ができないこと" do
      user = build(:identification, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end
end