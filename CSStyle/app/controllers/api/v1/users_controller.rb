class Api::V1::UsersController < ApplicationController


  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    @snippets = @user.snippets
    @obj = {user: @user, snippets: @snippets}
    render json: @obj, status: :ok
  end

end
