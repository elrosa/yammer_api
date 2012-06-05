module YammerApi
  module Api
    module Likes

      include Helper

      # Likes a specified message
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param id [Integer] The ID of message.
      # @see http://developer.yammer.com/api/#likes
      def add_like(id, options={})
        path = "/messages/liked_by/current.json"
        post(path, {:message_id => id}.to_json)
      end

      # Unlikes a specified message
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param id [Integer] The ID of message.
      # @see http://developer.yammer.com/api/#likes
      def remove_like(id, options={})
        path = "/messages/liked_by/current.json?message_id=#{id}"
        delete(path, options)
      end

    end
  end
end