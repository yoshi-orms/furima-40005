require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'usernameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirthdateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.username = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Username can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'メールアドレスは、@を含む必要があること。' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'パスワードが必須であること。' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'yosi1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'パスワードは、半角英語のみでは登録できないこと' do
        @user.password = 'yoshisaku'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は英字と数字の両方を含めて設定してください"
      end

      it 'パスワードは、数字だけでは登録できないこと。' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は英字と数字の両方を含めて設定してください"
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'よし1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は英字と数字の両方を含めて設定してください"
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
        @user.password = 'y123456'
        @user.password_confirmation = 'y1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'お名前(全角)は、名字が必須であること。' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'お名前(全角)は、名前が必須であること。' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'お名前(全角)(苗字)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.last_name = 'ueda' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end

      it 'お名前(全角)(名前)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.first_name = 'yoshi' 
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end

      it 'お名前カナ(全角)は、名字が必須であること。' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'お名前カナ(全角)は、名前が必須であること。' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'ueda'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角カタカナを使用してください"
      end

      it '名前（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'yoshi'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カタカナを使用してください"
      end

      it '生年月日が必須であること。' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthdate can't be blank"
      end
    end
  end
end
