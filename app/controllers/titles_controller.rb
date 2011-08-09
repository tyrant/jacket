class TitlesController < ApplicationController

  authorize_resource
  
  def index
    @titles = Title.all
    @page_title = 'All book titles'
  end
  
  def show
    @title = Title.find(params[:id])
    @page_title = 'Show title'
  end
  
  def new
    @title = Title.new
    @page_title = 'New title'
  end
  
  def create 
    @title = Title.new(params[:title])
    if @title.save
      redirect_to @title 
    else
      render :action => 'new'
    end 
  end
  
  def destroy
    @title = Title.find(params[:id])
    @title.destroy
    redirect_to :index
  end

end
