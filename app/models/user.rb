class User < ApplicationRecord
  has_many :booktours
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  validates :name, presence: true
  validates :phone, presence: true
  enum role: {admin: 0, user: 1}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
      user.skip_confirmation!
    end
  end
  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.#{provider}_data"] &&
        session["devise.#{provider}_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
