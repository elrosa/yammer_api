require 'spec_helper'

describe YammerApi do
  describe "Creating YammerApi instance" do

    it "should delegate to YammerApi::Client" do
      @yammer = YammerApi.new
      @yammer.should be_an_instance_of(YammerApi::Client)
    end


  end

end