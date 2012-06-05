module YammerApi
  module Api
    module Messages

      include Helper
      # Creates a new message from the authenticating user
      #
      # @note A status update with text identical to the authenticating user's current status will be ignored to prevent duplicates.
      # @format `:json`
      # @authenticated true
      # @rate_limited false
      # @param body [String] The text of your message.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :group_id The ID of the group in which this message belongs.
      # @option options [Integer] :replied_to_id The message ID this message is in reply to, if applicable.
      # @option options [Integer] :direct_to_id the ID of the user to which this message will be sent as a private message.
      # @option options [String] :broadcast If `true` this message should be broadcasted to all users. *Must be an admin*
      # @option options [Integer] :topic*n* Topics to apply to the message. Can use topic1 through topic20.
      # @return [YammerApi::Post] The created message.
      # @see http://developer.yammer.com/api/#messages-manipulating
      def update(message, options={})
        path = "/messages.json"
        response = post(path, {:body => message}.merge(options).to_json)
        parse_post(response)
      end


      # Creates a new direct message from the authenticating user to selected user
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited false
      # @param body [String] The text of your message.
      # @param user_id [String] The id of message recipient.
      # @return [YammerApi::Post] The created message.
      # @see http://developer.yammer.com/api/#messages-manipulating
      def send_direct_message(message, user_id, options={})
        path = "/messages.json"
        response = post(path, {:body => message, :direct_to_id => user_id}.merge(options).to_json)
        parse_post(response)
      end

      # Deletes a specified message from the authenticating user
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited false
      # @param id [Integer] The ID of your message.
      # @return [YammerApi::Post] The deleted message.
      # @see http://developer.yammer.com/api/#messages-manipulating
      def delete_message(id, options={})
        path = "/messages/#{id}"
        delete(path, options)
      end

      private
        def parse_post response
          raw_messages = response.fetch("messages", [])
          raw_ref = response.fetch("references", [])
          post = raw_messages.first
          sender = raw_ref.find{|u| u.id == post.sender_id && u.type == "user" || u.type == "guide"}
          YammerApi::Post.new(post.merge(:sender => sender))
        end
    end
  end
end