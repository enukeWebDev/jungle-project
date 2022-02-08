class User < ActiveRecord::Base

  

  validates :name, presence: true
  validates :password, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  #validates_uniqueness_of :email, :case_sensitive => false

  has_secure_password

end
# validates_uniqueness_of :email, :case_sensitive => false
# validates :name, presence: true
# validates :password, presence: true, length: {minimum: 3}
#   validates :password_confirmation, presence: true
