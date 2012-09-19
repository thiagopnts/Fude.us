class UrlsController < ApplicationController

  def index
    @url = Url.new :key => params[:key],:url => params[:url]
  end

  def create
    @url = Url.new(params[:url])
    if @url.save
      flash[:key] = @url.key
      render :index
    else
      flash[:key] = nil
      render :index
    end
  end

  def redirect
    url = REDIS.get(params[:key])
    if !url.nil?
      redirect_to url
    else
      render :index
    end
  end

end
