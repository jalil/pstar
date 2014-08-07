class VideosController < ApplicationController
  
  def index
      @video = Video.find(1)
  end

  def show
    @category = Category.find(:params[:id])
    @videos = @category.videos
  end

end
