module YammerApi
  class Client
    include Api::Feed
    include Api::Messages
    include Api::Likes
    include Request

    def initialize(options={})
      @consumer_key     = options[:consumer_key]
      @consumer_secret  = options[:consumer_key]
      @auth_token       = options[:oauth_token]
      @consumer_options = options[:oauth_options] || {}
    end

    def consumer
      @consumer ||= ::OAuth2::Client.new(@consumer_key, @consumer_secret, @consumer_options.merge(DEFAULT_OAUTH_OPTIONS))
    end

    def access_token
      @access_token ||= ::OAuth2::AccessToken.new(consumer, @auth_token)
    end

    protected
      DEFAULT_OAUTH_OPTIONS = {
          :site => 'https://www.yammer.com',
          :authorize_url => '/dialog/oauth',
          :token_url => '/oauth2/access_token.json'
      }
  end
end