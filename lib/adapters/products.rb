module Adapters
  class Products
    def self.get_products(url)
      uri      = URI.parse(url)
      http     = Net::HTTP.start(uri.host, uri.port,
                                 :use_ssl => uri.scheme == 'https',
                                 :verify_mode => OpenSSL::SSL::VERIFY_NONE)
      request  = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      json     = JSON.load(response.body)
    end
  end
end
