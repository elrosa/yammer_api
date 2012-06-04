module YammerApi
  module Api
    module Feed

      include Helper

      # Returns the 20 most recent messages in this network. Corresponds to the "Company Feed" tab on the website.
      #
      # @note Developers should note that a strict rate limit is applied to all API requests, so clients should never poll for new messages more frequently than every 30 seconds to ensure that the user is still able to use the API for posting messages, etc.
      # @format `:json`, `:xml`
      # @authenticated true
      # @rate_limited true
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :older_than Returns only messages older than the message ID specified. This is useful for paginating messages.
      # @option options [Integer] :newer_than Return only messages newer than the message ID specified. This should always be used when polling for new messages.
      # @option options [String] :threaded Accepts true or extended. When true, will only return the first message in each thread. This parameter is intended for applications which display message threads collapsed. threaded=extended will return the thread starter messages in order of most recently active as well as the two most recent messages, as they are viewed in the default view on our website.
      # @option options [Integer] :limit Return only the specified number of messages. Works for `threaded=true` and `threaded=extended`.
      # @return [Yammer::Post]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the 20 most recent messages in this network.
      #   Yammer.messages
      def messages(options={})
        path = "/messages" + params(options).to_s
        get_and_parse_posts path, options
      end

      # Returns the 20 sent messages by the current logged in user.
      # Alias for `/api/v1/messages/from_user/logged-in_user_id.format`. Corresponds to the "Sent" tab on the website.
      #
      # @note Important to note that the XML format returns a different structure than the JSON one. So we only support the JSON format for this method.
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :older_than Returns only messages older than the message ID specified. This is useful for paginating messages.
      # @option options [Integer] :newer_than Return only messages newer than the message ID specified. This should always be used when polling for new messages.
      # @option options [String] :threaded Accepts true or extended. When true, will only return the first message in each thread. This parameter is intended for applications which display message threads collapsed. threaded=extended will return the thread starter messages in order of most recently active as well as the two most recent messages, as they are viewed in the default view on our website.
      # @option options [Integer] :limit Return only the specified number of messages. Works for `threaded=true` and `threaded=extended`.
      # @return [Yammer::Post]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the 20 most recent sent messages
      #   Yammer.messages_sent
      def messages_sent(options={})
        path = "/messages/sent" + params(options).to_s
        get_and_parse_posts path, options
      end

      # Messages received by the logged-in user. Corresponds to the "Received" tab on the website.
      #
      # @note Important to note that the XML format returns a different structure than the JSON one. So we only support the JSON format for this method.
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :older_than Returns only messages older than the message ID specified. This is useful for paginating messages.
      # @option options [Integer] :newer_than Return only messages newer than the message ID specified. This should always be used when polling for new messages.
      # @option options [String] :threaded Accepts true or extended. When true, will only return the first message in each thread. This parameter is intended for applications which display message threads collapsed. threaded=extended will return the thread starter messages in order of most recently active as well as the two most recent messages, as they are viewed in the default view on our website.
      # @option options [Integer] :limit Return only the specified number of messages. Works for `threaded=true` and `threaded=extended`.
      # @return [Yammer::Post]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the 20 most recent received messages
      #   Yammer.messages_received
      def messages_received(options={})
        path = "/messages/received" + params(options).to_s
        get_and_parse_posts path, options
      end

      # Private Messages (aka Direct Messages) for the logged-in user. Corresponds to the "Direct Messages" section on the website.
      #
      # @note Important to note that the XML format returns a different structure than the JSON one. So we only support the JSON format for this method.
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :older_than Returns only messages older than the message ID specified. This is useful for paginating messages.
      # @option options [Integer] :newer_than Return only messages newer than the message ID specified. This should always be used when polling for new messages.
      # @option options [String] :threaded Accepts true or extended. When true, will only return the first message in each thread. This parameter is intended for applications which display message threads collapsed. threaded=extended will return the thread starter messages in order of most recently active as well as the two most recent messages, as they are viewed in the default view on our website.
      # @option options [Integer] :limit Return only the specified number of messages. Works for `threaded=true` and `threaded=extended`.
      # @return [Yammer::Post]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the 20 most recent private messages
      #   Yammer.direct_messages
      def direct_messages(options={})
        path = "/messages/private" + params(options).to_s
        get_and_parse_dms path, options
      end

      # Messages followed by the logged-in user. Corresponds to the "My Feed" tab on the website.
      #
      # @note Important to note that the XML format returns a different structure than the JSON one. So we only support the JSON format for this method.
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :older_than Returns only messages older than the message ID specified. This is useful for paginating messages.
      # @option options [Integer] :newer_than Return only messages newer than the message ID specified. This should always be used when polling for new messages.
      # @option options [String] :threaded Accepts true or extended. When true, will only return the first message in each thread. This parameter is intended for applications which display message threads collapsed. threaded=extended will return the thread starter messages in order of most recently active as well as the two most recent messages, as they are viewed in the default view on our website.
      # @option options [Integer] :limit Return only the specified number of messages. Works for `threaded=true` and `threaded=extended`.
      # @return [Yammer::Post]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the 20 most recent received messages in my feed
      #   Yammer.my_feed
      def my_feed(options={})
        #response = get('messages/following', options, :json)
        path = "/messages/following" + params(options).to_s
        get_and_parse_posts path, options
      end

      # Messages sent by the user with the given ID. Corresponds to the messages on a user profile page on the website.
      #
      # @note Important to note that the XML format returns a different structure than the JSON one. So we only support the JSON format for this method.
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param id [Integer, String] A user ID or screen name.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :older_than Returns only messages older than the message ID specified. This is useful for paginating messages.
      # @option options [Integer] :newer_than Return only messages newer than the message ID specified. This should always be used when polling for new messages.
      # @option options [String] :threaded Accepts true or extended. When true, will only return the first message in each thread. This parameter is intended for applications which display message threads collapsed. threaded=extended will return the thread starter messages in order of most recently active as well as the two most recent messages, as they are viewed in the default view on our website.
      # @option options [Integer] :limit Return only the specified number of messages. Works for `threaded=true` and `threaded=extended`.
      # @return [Yammer::Post]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the 20 most recent messages from the user
      #   Yammer.messages_from("bruno")
      def messages_from(id, options={})
        path = "/messages/from_user/#{id}" + params(options).to_s
        get_and_parse_posts path, options
      end

      # Messages that have the topic with given ID. Corresponds to the messages on a topic's page on the website.
      #
      # @note Important to note that the XML format returns a different structure than the JSON one. So we only support the JSON format for this method.
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param id [Integer] A topic ID
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :older_than Returns only messages older than the message ID specified. This is useful for paginating messages.
      # @option options [Integer] :newer_than Return only messages newer than the message ID specified. This should always be used when polling for new messages.
      # @option options [String] :threaded Accepts true or extended. When true, will only return the first message in each thread. This parameter is intended for applications which display message threads collapsed. threaded=extended will return the thread starter messages in order of most recently active as well as the two most recent messages, as they are viewed in the default view on our website.
      # @option options [Integer] :limit Return only the specified number of messages. Works for `threaded=true` and `threaded=extended`.
      # @return [Yammer::Post]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the messages in topic with ID 1234567
      #   Yammer.about_topic(1234567)
      def about_topic(id, options={})
        path = "messages/about_topic/#{id}" + params(options).to_s
        get_and_parse_posts path, options
      end

      # Messages in the thread with the given ID. Corresponds to the page you'd see when clicking on "in reply to" on the website.
      #
      # @note Does not accept the threaded parameter.
      # @format `:json`
      # @authenticated true
      # @rate_limited true
      # @param id [Integer] A thread ID
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :older_than Returns only messages older than the message ID specified. This is useful for paginating messages.
      # @option options [Integer] :newer_than Return only messages newer than the message ID specified. This should always be used when polling for new messages.
      # @option options [Integer] :limit Return only the specified number of messages. Works for `threaded=true` and `threaded=extended`.
      # @return [Yammer::Post]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the messages in the thread with ID 1234567
      #   Yammer.thread(1234567)
      def thread(id, options={})
        path = "messages/in_thread/#{id}" + params(options).to_s
        get_and_parse_posts path, options
      end

      private
        def get_and_parse_posts path, options
          response = get(path, options)
          raw_messages = response.fetch("messages", [])
          raw_ref = response.fetch("references", [])
          raw_messages.map{|post|
            sender = raw_ref.find{|u| u.id == post.sender_id && u.type == "user"}
            YammerApi::Post.new(post.merge(:sender => sender))
          }
        end

        def get_and_parse_dms path, options
          response = get(path, options)
          raw_messages = response.fetch("messages", [])
          raw_ref = response.fetch("references", [])
          raw_messages.map{|post|
            sender = raw_ref.find{|u| u.id == post.sender_id && u.type == "user"} || raw_ref.find{|u| u.id == post.sender_id && u.type == "guide"}
            recipient = raw_ref.find{|u| u.id == post.direct_to_id && u.type == "user"}
            YammerApi::Post.new(post.merge(:sender => sender, :recipient => recipient))
          }
        end

    end
  end
end