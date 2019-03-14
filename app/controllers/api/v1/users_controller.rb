class Api::V1::UsersController < ApplicationController


  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def login
    @user = User.find_by(username: params[:username])
    @snippets = @user.snippets
    @new_snippets = @snippets.map do |snippet|
      {id: snippet.id, name: snippet.name, user_id: snippet.user_id, html: snippet.html, css: snippet.css, user: @user, tags: snippet.tags}
    end
    # @user_snippets = @user.snippets.map do |snippet|
    #   @return_snippet = snippet
    #   @return_snippet["user"]=""
    #   @return_snippet["user"]<<@user
    #   @return_snippet
    # end
    if @user
      render json: {success: true, user: @user, snippets: @new_snippets}, status: :ok
    else
      render json: {success: false, user: @user}, status: :unauthorized
    end
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: {success: true, user: @user, snippets: @user.snippets}, status: :ok
    else
      render json: {success: false, user: @user, errors: @user.errors.messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    @snippets = @user.snippets
    @obj = {user: @user, snippets: @snippets}
    render json: @obj, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:username, :user_image)
  end
end
