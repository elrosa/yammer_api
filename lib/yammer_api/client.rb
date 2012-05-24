module YammerApi
  class Client
    def initialize(options={})
      @consumer_key    = options[:consumer_key]
      @consumer_secret = options[:consumer_key]
      @auth_token      = options[:oauth_token]
    end
  end
end