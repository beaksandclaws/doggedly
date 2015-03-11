class AccountController < ApplicationController
  def login

    if params[:email].present?
      @user = User.where(email: params[:email]).first
      if @user.password == params[:password] && @user.login_attempts < 10
        give_token
      else
        redirect_to root
      end
    end
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end
end
