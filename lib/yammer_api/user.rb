module YammerApi
  class User < YammerApi::Base

    lazy_attr_reader :full_name, :id, :job_title, :nickname,
                     :profile_url, :profile_image, :stats


    # @return String
    def nickname
      @nickname ||= @attrs["name"] if @attrs["name"]
    end

    # @return String
    def profile_url
      @profile_url ||= @attrs["web_url"] if @attrs["web_url"]
    end

    # @return String
    def profile_image
      @profile_image ||= @attrs["mugshot_url"] if @attrs["mugshot_url"]
    end

  end
end