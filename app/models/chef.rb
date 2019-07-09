class Chef < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :chefname, presence: true, :length => {maximum: 30}
  validates :email, presence: true, :length => {maximum: 255},
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" },
            uniqueness: { case_sensitive: false }
end