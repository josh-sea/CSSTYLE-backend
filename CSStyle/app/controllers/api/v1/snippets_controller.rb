class Api::V1::SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
    render json: @snippets, status: :ok
  end

  def create
    @snippet = Snippet.create(snippet_params)
    render json: @snippet, status: :ok
  end

  def show
    @snippet = Snippet.find(params[:id])
    render json: @snippet, status: :ok
  end


  private
  def snippet_params
    params.require(:snippet).permit(:html, :css, :user_id, :name)
  end
end
