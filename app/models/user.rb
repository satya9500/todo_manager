class User < ApplicationRecord

  has_many :todos

  def pretty_print
    "#{id}. Name:#{name} | Email: #{email}  |  Password: #{password}"
  end
end
