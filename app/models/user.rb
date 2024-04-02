class User < ApplicationRecord
    has_secure_password
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  has_many :jobs

  def generate_jwt
    JWT.encode({ id: id,
                 exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end
end
