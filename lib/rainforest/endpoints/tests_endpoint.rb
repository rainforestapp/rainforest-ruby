module Rainforest
  class TestsEndpoint < ApiEndpoint

    def new(id)
      Test.new({:id => id}, nil, @client)
    end

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/tests", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Test, json, method)
    end

    def retrieve(test_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :test_id => test_id,
      }, params)
      method = ApiMethod.new(:get, "/tests/:test_id", params, headers, @parent)
      json = @client.execute(method)
      Test.new(json, method)
    end

    def delete(test_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :test_id => test_id,
      }, params)
      method = ApiMethod.new(:delete, "/tests/:test_id", params, headers, @parent)
      json = @client.execute(method)
      Test.new(json, method)
    end

    def update(test_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :test_id => test_id,
      }, params)
      method = ApiMethod.new(:put, "/tests/:test_id", params, headers, @parent)
      json = @client.execute(method)
      Test.new(json, method)
    end

    def create(params={}, headers={})
      method = ApiMethod.new(:post, "/tests", params, headers, @parent)
      json = @client.execute(method)
      Test.new(json, method)
    end

    def history(test_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :test_id => test_id,
      }, params)
      method = ApiMethod.new(:get, "/tests/:test_id/history", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Run, json, method)
    end

  end
end
