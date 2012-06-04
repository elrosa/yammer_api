require 'spec_helper'

describe YammerApi::Client do
  before do
    client.stub(:consumer).and_return(consumer)
  end

  let(:client) {YammerApi::Client.new(:consumer_key => "consumer_key", :consumer_secret => "consumer_secret", :oauth_token => "oauth_token")}
  let(:consumer){OAuth2::Client.new('token', 'secret', {:site => 'https://yammer.com'})}

  describe "User's network feed" do

    it "client should get users feed" do
      stub_http_request(:get, /https:\/\/yammer.com\/api\/v1\/messages.*/).
          to_return(:body => "{}")
      posts = client.messages
      posts.length.should == 0
      posts.should be_an_instance_of(Array)
    end

    it "returned array should contain posts" do
      stub_http_request(:get, /https:\/\/yammer.com\/api\/v1\/messages.*/).
          to_return(:body => fixture("network_feed.json"))

      posts = client.messages

      posts.length.should == 18
      posts.first.should be_an_instance_of(YammerApi::Post)
    end

  end

  describe "User's private messages" do


    it "returned array should contain posts" do
      stub_http_request(:get, /https:\/\/yammer.com\/api\/v1\/messages\/private.*/).
          to_return(:body => fixture("private.json"))

      posts = client.direct_messages

      posts.length.should == 1
      posts.first.should be_an_instance_of(YammerApi::Post)

    end
  end

  describe "Posting messages" do
    it "should be possible to post message" do
      stub_http_request(:post, /https:\/\/yammer.com\/api\/v1\/messages.*/).
          to_return(:body => fixture("newly_posted.json"))

      post = client.update("OHAI")
      post.should be_an_instance_of(YammerApi::Post)
    end

    it "should be possible to post direct message" do
      stub_http_request(:post, /https:\/\/yammer.com\/api\/v1\/messages.*/).
          to_return(:body => fixture("newly_posted.json"))

      post = client.send_direct_message("OHAI", "123")
      post.should be_an_instance_of(YammerApi::Post)
    end
  end

end