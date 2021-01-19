class User < ApplicationRecord
  def pretty_print
    "#{id}. Name:#{name} | Email: #{email}  |  Password: #{password}"
  end
end
