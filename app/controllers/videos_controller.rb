class VideosController < ApplicationController
  
  def index
    @videos = Video.all
    @category = Category.first
  end
end
