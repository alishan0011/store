class VideosController < ApplicationController

before_action :authenticate_user!

  def index
    if current_user.admin?
      @videos = Video.all
    else
      @videos = Video.joins(:category).where(category: current_user.categories)
    end
  end
	
end
