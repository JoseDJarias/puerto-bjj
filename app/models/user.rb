class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  
  validates :password, length: { minimum: 8 }, 
                      format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/,
                               message: "debe contener al menos una letra mayúscula, una minúscula, un número y un carácter especial" },
                      if: -> { password.present? }
  
  def admin?
    admin
  end
end
