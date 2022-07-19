class Booktour < ApplicationRecord
  enum status: {wait_confirmation: 1, confirmed: 0}
  belongs_to :tour
  belongs_to :user
end
