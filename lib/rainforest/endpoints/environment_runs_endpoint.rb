module Rainforest
  class EnvironmentRunsEndpoint < ApiEndpoint

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/environments/:id/runs", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Run, json, method)
    end

  end
end
