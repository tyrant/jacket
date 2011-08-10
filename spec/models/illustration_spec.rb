require 'spec_helper.rb'

describe Illustration do

  before :each do
    @illustration_owner = Factory :user
    @illustration_non_owner = Factory :user
  end

  it "creates a new Illustration" do
    sign_in @illustration_owner
    @illustration = Factory.create :illustration, :user => @illustration_owner
    assert @illustration.save
  end
  
  it "doesn't create an Illustration without a user" do
    sign_in @illustration_owner
    @illustration = Factory.create :illustration, :user => nil
    assert !@illustration.save
  end
  
  it "deletes an Illustration" do
    sign_in @illustration_owner
    @illustration = Factory :illustration, :user => @illustration_owner
    assert @illustration.destroy
  end
  
  it "doesn't delete an Illustration if the user doesn't own it" do
    sign_in @illustration_non_owner
    @illustration = Factory :illustration, :user => @illustration_owner
    assert !@illustration.destroy
  end
  
  it "doesn't delete an Illustration if there's no logged-in user" do
    # sign_in nil
    @illustration = Factory :illustration, :user => @illustration_owner
    assert !@illustration.destroy
  end
  
end
