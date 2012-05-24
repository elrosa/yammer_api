require 'omniauth-oauth2'

module YammerApi
  autoload :Api,     "yammer_api/api"
  autoload :Client,  "yammer_api/client"
  autoload :Errors,  "yammer_api/errors"
  autoload :Helper,  "yammer_api/helper"
  autoload :Mash,    "yammer_api/mash"
  autoload :Request, "yammer_api/request/request"

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
