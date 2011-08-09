describe TitleController do

  before :each do
    @user = Factory :user
  end

  it "loads #index" do
    get :index
    assert_response :success
  end
  
  it "loads #new when user's logged in" do
    sign_in @user
    get :new
    assert_response :success
  end
  
  it "doesn't load #new when no-one's logged in" do
    get :new
    assert_response :failure
  end
  
  it "loads #create when given right credentials" do
    sign_in @user
    post :create, Factory.attributes_for(:title)
  
    assert_response :success
  end
  
  it "doesn't load #create when title credentials aren't present" do
    sign_in @user
    post :create, { :foo => 'bar', :bar => 'baz' }
    
    assert_response :failure
  end
  
  it "doesn't load #create when user isn't logged in" do
    post :create, Factory.attributes_for(:title)
  
    assert_response :success
  end
  
  it "loads #destroy when user is logged in and title ID is supplied" do
    sign_in @user
    @title = Factory :title
    delete :destroy, { :id => @title.id }
    
    assert_response :success
  end
  
  it "doesn't load #destroy when no title ID is supplied" do
    sign_in @user
    delete :destroy, { :foo => 'bar', :bar => 'baz' }
    
    assert_response :failure
  end
  
  it "doesn't load #destroy when no-one's logged in" do
    @title = Factory :title
    delete :destroy, { :id => @title.id }
    
    assert_response :failure
  end
end

