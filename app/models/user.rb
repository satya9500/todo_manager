class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :first_name, length: {minimum: 2}
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :todos

  def pretty_print
    "#{id}. Name:#{name} | Email: #{email}  |  Password: #{password}"
  end
end
