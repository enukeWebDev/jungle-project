class User < ActiveRecord::Base

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  #validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :password, presence: true, length: {minimum: 3}

  

end
# validates_uniqueness_of :email, :case_sensitive => false
# validates :name, presence: true
# validates :password, presence: true, length: {minimum: 3}
# validates :password_confirmation, presence: true
