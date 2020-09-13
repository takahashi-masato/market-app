require 'rails_helper'
describe User do
  describe '#create' do

    it "nickname、email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録ができないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank")
    end

    it 'emailがない場合は登録できないこと' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.blank")
    end

    it 'パスワードがない場合は登録ができないこと' do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation")
    end

    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.too_short")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.taken")
    end

  end
end

