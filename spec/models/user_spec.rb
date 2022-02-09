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
      @user = User.create(
        # @user.attributes.merge(
          email: 'angel@batista.com',
          password: 'dextershow',
          password_confirmation: 'dextershow',   
      # )
    )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:email))
    end

    it 'should fail validation when email is NOT enter' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:email)).to include(match(/blank/i))
    end

    it 'should fail validation when name (first & last name) is NOT enter' do
      @user.name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:name)).to include(match(/blank/i))
    end


    it 'should fail validation when password is too short' do
      @user.password = 'no'
      @user.password_confirmation = 'no'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:password)).to include("Password is too short (minimum is 3 characters)" )
    end

  end


     
    describe '.authenticate_with_credentials' do
      before(:each) do
        @existing_user = User.create(
          name: 'existing user',
          email: 'angel@batista.com',
          password: 'dextershow',
          password_confirmation: 'dextershow',
        )
      end

      context 'with valid credentials' do
        it 'returns the user with valid credentials' do
          expect(User.authenticate_with_credentials('angel@batista.com', 'dextershow')).to eq(@existing_user)
        end
      end

        context 'with invalid credentials' do
          it 'returns false when email does not exist' do
            expect(!!User.authenticate_with_credentials('ngel@batista.com', 'dextershow')).to be false
          end

          it 'returns false when password is incorrect' do
            expect(!!User.authenticate_with_credentials('angel@batista.com', 'dextershow12')).to be false
          end
        end
    end
end

