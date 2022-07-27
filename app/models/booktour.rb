class Booktour < ApplicationRecord
  enum status: {wait_confirmation: 1, confirmed: 0}
  belongs_to :tour
  belongs_to :user

  def status_i18n
    I18n.t("enums.booktour.status.#{status}")
  end
end
