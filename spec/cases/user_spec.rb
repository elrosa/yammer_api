require 'spec_helper'

describe YammerApi::User do
  before do
    @fixture = MultiJson.decode(fixture "single_user.json")
    @user = YammerApi::User.new(@fixture)
  end

  it "should contain correct user id" do
    @user.id.should == @fixture["id"]
  end

  it "should contain correct user name" do
    @user.full_name.should == @fixture["full_name"]
  end

  it "should contain correct user nickname" do
    @user.nickname.should == @fixture["name"]
  end

  it "should contain correct user profile image" do
    @user.profile_image.should == @fixture["mugshot_url"]
  end

  it "should contain correct user profile url" do
    @user.profile_url.should == @fixture["web_url"]
  end


end