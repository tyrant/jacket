describe IllustrationController do

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
    post :create, Factory.attributes_for(:illustration)
  
    assert_response :success
  end
  
  it "doesn't load #create when illustration credentials aren't present" do
    sign_in @user
    post :create, { :foo => 'bar', :bar => 'baz' }
    
    assert_response :failure
  end
  
  it "doesn't load #create when user isn't logged in" do
    post :create, Factory.attributes_for(:illustration)
  
    assert_response :success
  end
  
  it "loads #destroy when user is logged in and illustration ID is supplied" do
    sign_in @user
    @illustration = Factory :illustration
    delete :destroy, { :id => @illustration.id }
    
    assert_response :success
  end
  
  it "doesn't load #destroy when no illustration ID is supplied" do
    sign_in @user
    delete :destroy, { :foo => 'bar', :bar => 'baz' }
    
    assert_response :failure
  end
  
  it "doesn't load #destroy when no-one's logged in" do
    @illustration = Factory :illustration
    delete :destroy, { :id => @illustration.id }
    
    assert_response :failure
  end
end

