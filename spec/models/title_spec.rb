describe Title do

  before :each do
    @title_owner = Factory :user
    @title_non_owner = Factory :user
  end

  it "creates a new Title" do
    sign_in @title_owner
    
    @title = Factory.create :title, :user => @title_owner
    assert @title.save
  end
  
  it "doesn't create a Title without a user" do
    sign_in @title_owner
    
    @title = Factory.create :title, :user => nil
    assert !@title.save
  end
  
  it "deletes a Title" do
    sign_in @title_owner
    @title = Factory.title, :user => @title_owner
    assert @title.destroy
  end
  
  it "doesn't delete a Title if the user doesn't own it" do
    sign_in @title_non_owner
    @title = Factory.title, :user => @title_owner
    assert !@title.destroy
  end
  
  it "doesn't delete a Title if there's no logged-in user" do
    # sign_in nil
    @title = Factory.title, :user => @title_owner
    assert !@title.destroy
  end
  
end
