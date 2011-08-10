class IllustrationsController < ApplicationController

  authorize_resource

  def index
    @page_title = 'All illustrations'
    @illustrations = Illustration.paginate :page => (params.has_key?('page') ? params[:page] : 1)
  end
  
  def show
    @page_title = 'Show illustration'
    @illustration = Illustration.find(params[:id])
  end
  
  def new
    @page_title = 'New illustration'
    @illustration = Illustration.new
  end
  
  def create
    @illustration = Illustration.new(params[:illustration])
    if @illustration.save
      redirect_to @illustration, :notice => 'New Illustration created!'
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @illustration = Illustration.find(params[:id])
    @illustration.destroy
    redirect_to illustrations_path, :notice => 'Illustration deleted'
  end
  
end
