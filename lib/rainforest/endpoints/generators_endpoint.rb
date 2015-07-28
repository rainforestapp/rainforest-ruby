module Rainforest
  class GeneratorsEndpoint < ApiEndpoint

    def new(id)
      Generator.new({:id => id}, nil, @client)
    end

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/generators", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Generator, json, method)
    end

    def retrieve(generator_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :generator_id => generator_id,
      }, params)
      method = ApiMethod.new(:get, "/generators/:generator_id", params, headers, @parent)
      json = @client.execute(method)
      Generator.new(json, method)
    end

    def delete(generator_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :generator_id => generator_id,
      }, params)
      method = ApiMethod.new(:delete, "/generators/:generator_id", params, headers, @parent)
      json = @client.execute(method)
      Generator.new(json, method)
    end

    def update(generator_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :generator_id => generator_id,
      }, params)
      method = ApiMethod.new(:put, "/generators/:generator_id", params, headers, @parent)
      json = @client.execute(method)
      Generator.new(json, method)
    end

    def create(params={}, headers={})
      method = ApiMethod.new(:post, "/generators", params, headers, @parent)
      json = @client.execute(method)
      Generator.new(json, method)
    end

  end
end
