class AccountController < ApplicationController
  def login
    if session[:user_id].present?
      redirect_to root_path
    elsif params[:email].present?
      @user = User.where(email: params[:email]).first
      if @user.present? && @user.password == params[:password] && @user.login_attempts.to_i < 10
        session[:user_id] = @user.id
      else
        redirect_to root_path
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    if User.where(email: params[:user][:email]).empty?
      @user = User.new(name: params[:user][:name], email: params[:user][:email])
      @user.password = params[:user][:password]
      @user.save!
    end

    redirect_to root_path
  end
end
