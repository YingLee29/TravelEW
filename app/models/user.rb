class User < ApplicationRecord
  has_many :booktours
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :phone, presence: true
  enum role: {admin: 0, user: 1}
end
