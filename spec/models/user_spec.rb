require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validation of credentials' do

    before(:each) do
      @user = User.create(
        name: 'Angel Batista',
        email: 'angel@batista.com',
        password: 'dextershow',
        password_confirmation: 'dextershow',
      )
    end


    it 'should validate successfully whe the user information is valid' do
      expect(@user).to be_valid
    end

    it 'should fail validation when password is not enter' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:password)).to include(match(/blank/i))
    end

    it 'should fail validation when password does not match after the confirmation' do
      @user.password_confirmation = 'NotMatch'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:password_confirmation)).to include(match(/match/i))
    end

    it 'should fail validation when email is NOT unique - email is not case sensitive' do
      existing_user = User.create(
        @user.attributes.merge(
          email: 'angel@batista.com',
          password: 'dextershow',
          password_confirmation: 'dextershow',   
      )
    )
      expect(existing_user).to_not be_valid
    end

    it 'should fail validation when email is NOT enter' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:email)).to include(match(/blank/i))
    end
  
  end
end

