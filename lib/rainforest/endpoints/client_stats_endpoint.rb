module Rainforest
  class ClientStatsEndpoint < ApiEndpoint

    def retrieve(params={}, headers={})
      method = ApiMethod.new(:get, "/clients/stats", params, headers, @parent)
      json = @client.execute(method)
      ClientStats.new(json, method)
    end

  end
end
