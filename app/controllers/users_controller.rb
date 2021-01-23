class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render plain: User.all.map { |user| user.pretty_print }.join("\n")
  end

  def new
    render "users/new"
  end

  def create
    user = User.create!(
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      password: params[:password]
      )
    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where(email: email, password: password)
    render plain: user.length == 0 ? false : true
  end
end
