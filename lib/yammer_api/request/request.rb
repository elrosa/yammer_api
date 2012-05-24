module YammerApi

  module Request

    DEFAULT_HEADERS = {
        :headers => {"Content-Type" => "application/json"}
    }

    API_PATH = '/api/v1'

    protected

      def get(path, options={})
        response = access_token.get("#{API_PATH}#{path}", DEFAULT_HEADERS.merge(options))
        raise_errors(response)
        Mash.from_json(response.body)
      end

      def post(path, body, options={})
        response = access_token.post("#{API_PATH}#{path}", DEFAULT_HEADERS.merge(options).merge({:body => body}))
        raise_errors(response)
        response.body
      end

      def put(path, options={})
        response = access_token.put("#{API_PATH}#{path}", DEFAULT_HEADERS.merge(options))
        raise_errors(response)
        response.body
      end

      def delete(path, options={})
        response = access_token.delete("#{API_PATH}#{path}", DEFAULT_HEADERS.merge(options))
        raise_errors(response)
        response
      end

    private

      def raise_errors(response)
        OAuth2::Response
        case response.status.to_i
          when 400
            raise YammerApi::Errors::BadRequest.new("(#{response.code}): #{response.message}")
          when 401
            raise YammerApi::Errors::Unauthorized.new("(#{response.code}): #{response.message}")
          when 403
            raise YammerApi::Errors::Forbidden.new("(#{response.code}): #{response.message}")
          when 404
            raise YammerApi::Errors::NotFound.new("(#{response.code}): #{response.message}")
          when 406
            raise YammerApi::Errors::NotAcceptable.new("(#{response.code}): #{response.message}")
          when 500
            raise YammerApi::Errors::InternalServerError.new("(#{response.code}): #{response.message}")
          when 502
            raise YammerApi::Errors::BadGateway.new("(#{response.code}): #{response.message}")
          when 503
            raise YammerApi::Errors::ServiceUnavailable.new("(#{response.code}): #{response.message}")
        end
      end

      def to_query(options)
        options.inject([]) do |collection, opt|
          collection << "#{opt[0]}=#{opt[1]}"
          collection
        end * '&'
      end

      def to_uri(path, options)
        uri = URI.parse(path)

        if options && options != {}
          uri.query = to_query(options)
        end
        uri.to_s
      end

  end

end

