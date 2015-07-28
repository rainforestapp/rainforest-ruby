module Rainforest
  class GeneratorRowsEndpoint < ApiEndpoint

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/generators/:id/rows", params, headers, @parent)
      json = @client.execute(method)
      json
    end

    def create(params={}, headers={})
      method = ApiMethod.new(:post, "/generators/:id/rows", params, headers, @parent)
      json = @client.execute(method)
      json
    end

  end
end
