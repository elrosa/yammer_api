require 'spec_helper'

describe YammerApi::Post do
  before do
    @fixture = MultiJson.decode(fixture "single_post.json")
    @post = YammerApi::Post.new(@fixture)
  end

  it "should contain correct posting date" do
    @post.posted_at.should == Time.parse(@fixture["created_at"]).utc
  end

  it "should contain correct text" do
    @post.text.should == @fixture["body"]["plain"]
  end

  it "should have attachment" do
    @post.attachment.should be_an_instance_of(YammerApi::Mash)
    @post.attachment.type.should == "image"
  end

  it "should have sender" do
    @post.user.should be_an_instance_of(YammerApi::User)
  end

end