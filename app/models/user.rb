class User < ApplicationRecord
  def pretty_print
    "#{id}. Email: #{email}  |  Password: #{password}"
  end
end
