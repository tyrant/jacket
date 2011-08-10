require 'spec_helper.rb'

describe Cover do

  before :each do
    @user_owner1 = Factory :user
    @user_owner2 = Factory :user
    @user_non_owner = Factory :user
  end

  it "creates with both title and illustration present" do
    sign_in @user_owner1
  
    @title = Factory :title, :user => @user_owner1
    @illustration = Factory :illustration, :user => @user_owner1
    @cover = Factory :cover, :title => @title, :illustration => @illustration
    
    assert @cover.save
  end
  
  it "doesn't save when title is absent" do
    sign_in @user_owner1
    
    @illustration = Factory :illustration, :user => @user_owner1
    @cover = Factory :cover, :title => nil, :illustration => @illustration
    
    assert !@cover.save
  end
  
  it "doesn't save when illustration is absent" do
    sign_in @user_owner1
    
    @title = Factory :illustration, :user => @user_owner1
    @cover = Factory :cover, :title => @title, :illustration => nil
    
    assert !@cover.save
  end
  
  it "deletes when owner of both title and illustration is logged in" do
    sign_in @user_owner1
  
    @title = Factory :title, :user => @user_owner1
    @illustration = Factory :illustration, :user => @user_owner1
    @cover = Factory :cover, :title => @title, :illustration => @illustration
    
    assert @cover.destroy
  end
  
  it "doesn't delete when the logged-in user doesn't own the cover's title" do
    sign_in @user_owner1
    
    @title = Factory :title, :user => @user_owner2
    @illustration = Factory :illustration, :user => @user_owner1
    @cover = Factory :cover, :title => @title, :illustration => @illustration
    
    assert !@cover.destroy
  end
  
  it "doesn't delete when the logged-in user doesn't own the cover's illustration" do
    sign_in @user_owner1
    
    @title = Factory :title, :user => @user_owner1
    @illustration = Factory :illustration, :user => @user_owner2
    @cover = Factory :cover, :title => @title, :illustration => @illustration
    
    assert !@cover.destroy
  end
  
  it "doesn't delete when the logged-in user owns neither the title nor the illustration" do
    sign_in @user_owner1
    
    @title = Factory :title, :user => @user_owner2
    @illustration = Factory :illustration, :user => @user_owner2
    @cover = Factory :cover, :title => @title, :illustration => @illustration
    
    assert !@cover.destroy
  end
