module Yammer
  module Helper
    def params options
      params_str = ""
      params = options[:params] || {}
      params.each { |key, value| params_str << "#{key}=#{value}&"}
      ("?" + params_str.chop) unless (params_str == "")
    end
  end
end