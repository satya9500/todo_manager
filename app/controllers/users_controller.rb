class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.pretty_print }.join("\n")
  end

  def create
    email = params[:email]
    password = params[:password]
    name = params[:name]
    user = User.create!(email: email, password: password, name: name)
    render plain: "User created successfully with id #{user.id}"
  end
end
