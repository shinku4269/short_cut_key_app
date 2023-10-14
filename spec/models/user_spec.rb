require 'rails_helper'

describe User do
  before do
      @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録ができるとき" do

      it "nickname, password, password_confirmation, emailが存在すれば登録できる" do
      expect(@user).to be_valid
      end
      
    end

    context "新規登録ができないとき" do

      it "nicknameが空では登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@がないと登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが数字のみ場合は登録できない" do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
      end

      it "passwordが全角文字を含む場合は登録できない" do
        @user.password = "Ａa12345"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
      end

      it "passwordが英語のみ場合は登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
      end

      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "testtest634"
        @user.password_confirmation = "testtest765"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end