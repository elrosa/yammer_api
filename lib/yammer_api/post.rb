module YammerApi
  class Post < YammerApi::Base
    lazy_attr_reader :attachment, :client_url, :id, :message_type, :network_id,
                     :posted_at, :replied_to_id, :sender_id, :text, :web_url

    # @return Hashie::Mash
    def attachment
      attachment = @attrs['attachments'].first
      if attachment
        @attachment ||= Mash.new(type: attachment['type'], id: attachment['id'], image_url: attachment.fetch("image", {"url" => ""}).fetch("url"))
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

    # @return Hashie::Mash
    def user
      @user ||= Yammer::User.new(@attrs['sender']) if @attrs['sender']
    end
  end
end