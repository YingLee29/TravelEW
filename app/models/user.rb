class User < ApplicationRecord
  ratyrate_rater
  has_many :booktours
  has_many :reviews, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates :name, presence: true
  #validates :phone, presence: true
  enum role: {admin: 0, user: 1}
  
  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, name: name_split[0], email: auth.info.email, password: Devise.friendly_token[0, 20])
      user
  end
end
