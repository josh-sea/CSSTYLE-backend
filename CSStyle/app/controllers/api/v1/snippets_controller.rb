class Api::V1::SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
    render json: @snippets, status: :ok
  end

  def create
    @tags=params[:tags].split(",")
    @tags.map!{|tag|tag.strip}
    @tagInstances=@tags.map do |tag|
      Tag.find_or_create_by(tag_name: tag.downcase)
    end
    @snippet = Snippet.create(snippet_params)
    @tagInstances.each do |tag|
      SnippetTag.find_or_create_by(snippet_id: @snippet.id, tag_id: tag.id)
    end
    render json: @snippet, status: :ok
  end

  def show
    @snippet = Snippet.find(params[:id])
    render json: @snippet, status: :ok
  end


  private

  def snippet_params
    params.require(:snippet).permit(:html, :css, :user_id, :name, :tags)
  end

end
