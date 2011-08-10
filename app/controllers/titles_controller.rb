class TitlesController < ApplicationController
  
  authorize_resource
  
  def index
    @titles = Title.paginate :page => (params.has_key?('page') ? params[:page] : 1)
    
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
    @title.user = current_user
    if @title.save
      redirect_to @title, :notice => 'New Title created!'
    else
      render :action => 'new'
    end 
  end
  
  def destroy
    puts 'INSIDE DESTROY'
    @title = Title.find(params[:id])
    @title.destroy
    redirect_to titles_url
  end

end
