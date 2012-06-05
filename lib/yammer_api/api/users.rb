module YammerApi
  module Api
    module Users

      include Helper

      # Get information about specified user
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param id [Integer] The ID of user.
      # @see http://developer.yammer.com/api/#users
      def user(id, options={})
        path = "/users/#{id}.json"
        response = get(path, options)
        YammerApi::User.new(response)
      end

    end
  end
end