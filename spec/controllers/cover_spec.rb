describe CoverController do

  before :each do
    @user = Factory :user
  end

  it "loads index and shows all covers" do
    sign_in @user
    get :index
    assert_response :success
  end
  
  it "loads #new and returns html" do
    sign_in @user
    get :new
    assert_response :success
  end
  
  it "doesn't load #new when no-one's logged in" do
    get :new
    assert_response :failure
  end
  
  it "loads #create and accepts create title and illustration ID params" do
    sign_in @user
    
    @title = Factory :title, :user => @user
    @illustration = Factory :illustration, :user => @user
    post :create, { :title_id => @title.id, :illustration_id => @illustration.id }
  
    assert_response :success
  end
  
  it "doesn't load #create when logged-in user doesn't own title" do
    sign_in @user
    @another_user = Factory :user
    
    @title = Factory :title, :user => @another_user
    @illustration = Factory :illustration, :user => @user
    post :create, { :title_id => @title.id, :illustration_id => @illustration.id }
    
    assert_response :failure
  end
  
  it "doesn't load #create when logged-in user doesn't own illustration" do
    sign_in @user
    @another_user = Factory :user
    
    @title = Factory :title, :user => @user
    @illustration = Factory :illustration, :user => @another_user
    post :create, { :title_id => @title.id, :illustration_id => @illustration.id }
    
    assert_response :failure
  end
  
  it "doesn't load #create when title ID is absent" do
    sign_in @user
    
    @illustration = Factory :illustration, :user => @user
    post :create, { :illustration_id => @illustration.id }
  
    assert_response :failure
  end
  
  it "doesn't load #create when illustration ID is absent" do
    sign_in @user
  
    @title = Factory :title, :user => @user
    post :create, { :title_id => @title.id, }
  
    assert_response :failure
  end
  
  it "doesn't load #create when no-one's logged in" do
    @title = Factory :title, :user => @user
    @illustration = Factory :illustration, :user => @user
    post :create, { :title_id => @title.id, :illustration_id => @illustration.id }
  
    assert_response :success 
  end
  
  it "loads #destroy and deletes cover" do
    sign_in @user
    
    @cover = Factory :cover
    delete :destroy, { :id => @cover.id }
  
    assert_response :success
  end
  
  it "doesn't #destroy when wrong user is logged in" do
    @another_user = Factory :user
    sign_in @another_user
    
    @cover = Factory :cover
    delete :destroy, { :id => @cover.id }
    
    assert_response :failure
  
  end
  
  it "doesn't #destroy when no-one's logged in" do
    @cover = Factory.cover
    delete :destroy, { :id => @cover.id }
    
    assert_response :failure
  end

end
