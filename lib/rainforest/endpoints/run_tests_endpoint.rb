module Rainforest
  class RunTestsEndpoint < ApiEndpoint

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/runs/:id/tests", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Test, json, method)
    end

    def retrieve(test_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :test_id => test_id,
      }, params)
      method = ApiMethod.new(:get, "/runs/:id/tests/:test_id", params, headers, @parent)
      json = @client.execute(method)
      Test.new(json, method)
    end

  end
end
