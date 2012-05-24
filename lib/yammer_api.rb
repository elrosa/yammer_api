require 'omniauth-oauth2'

module YammerApi
  autoload :Client, 'yammer_api/client'

  class << self
    #Alias for YammerApi::Client.new
    #@return [YammerApi::Client]
    def new(options={})
      YammerApi::Client.new(options)
    end

    # Delegate to Yammer::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end


end
