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
    @new_file = File.open("public/snippet#{@snippet.id}.css", 'w+'){ |file| file.write(@snippet.css) }
    render json: {filename: "http://localhost:9000/snippet#{@snippet.id}.css"}, status: :ok
  end

  def download
    @snippet = Snippet.find(params[:id])
    @css = @snippet.css
    render json: @snippet, status: :ok
  end

  def update
    @snippet = Snippet.find(params[:id])
    @snippet.update(snippet_params)
    render json: @snippet, status: :ok
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy
    render json: @snippet, status: :ok
  end

  def render_snippet
    @height=params[:height]
    @width=params[:width]
    @snippet = Snippet.find(params[:id])
    @html="<body>#{@snippet.html}</body>"
    @css=@snippet.css
    @css2="<head><style>#{@css}</style></head>"
    @testing="<html>#{@css2}#{@html}</html>"
    render html: @testing.html_safe
  end

  private

  def snippet_params
    params.require(:snippet).permit(:html, :css, :user_id, :name, :tags)
  end
end
