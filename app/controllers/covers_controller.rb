class CoversController < ApplicationController

  authorize_resource
  
  def index
    @page_title = 'All covers'
    @covers = Cover.paginate(:page => (params.has_key?('page') ? params[:page] : 1), :per_page => 10)
  end
  
  def show
    @cover = Cover.find(params[:id])
  end
  
  def new
    @cover = Cover.new
  end
  
  def create
    @cover = Cover.new(params[:cover])
    if @cover.save
      redirect_to @cover, :notice => 'Cover created!'
    else
      render :action => :new
    end
  end
  
  def destroy
    @cover = Cover.find(params[:id])
    @cover.destroy
    redirect_to covers_path, :notice => 'Cover deleted'
  end
end
