module YammerApi
  class Post < YammerApi::Base
    lazy_attr_reader :attachment, :client_url, :id, :message_type, :network_id,
                     :posted_at, :recipient, :replied_to_id, :sender_id, :text, :web_url

    # @return Hashie::Mash
    def attachment
      attachment = @attrs['attachments'].first
      if attachment
        if attachment['type'] == "image"
          @attachment ||= Mash.new(type: "image", id: attachment["id"], image_url: attachment.fetch("image", {"url" => ""}).fetch("url"))
        else
          @attachment ||= Mash.new(type: attachment['type'], name: attachment['name'], id: attachment["id"], image_url: attachment["large_icon_url"], url: attachment["download_url"])
        end
      end
    end

    # @return Time
    def posted_at
      #puts @attrs['created_at']
      @posted_at ||= Time.parse(@attrs['created_at']).utc unless @attrs['created_at'].nil?
    end

    # @return String
    def text
      @text ||= @attrs['body']['plain'] if @attrs['body'] && @attrs['body']['plain']
    end

    # @return YammerApi::User
    def user
      @user ||= YammerApi::User.new(@attrs['sender']) if @attrs['sender']
    end

    # @return YammerApi::User
    def recipient
      @recipient ||= YammerApi::User.new(@attrs['recipient']) if @attrs['recipient']
    end
  end
end