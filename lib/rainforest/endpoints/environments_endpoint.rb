module Rainforest
  class EnvironmentsEndpoint < ApiEndpoint

    def new(id)
      Environment.new({:id => id}, nil, @client)
    end

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/environments", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Environment, json, method)
    end

    def retrieve(environment_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :environment_id => environment_id,
      }, params)
      method = ApiMethod.new(:get, "/environments/:environment_id", params, headers, @parent)
      json = @client.execute(method)
      Environment.new(json, method)
    end

    def delete(environment_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :environment_id => environment_id,
      }, params)
      method = ApiMethod.new(:delete, "/environments/:environment_id", params, headers, @parent)
      json = @client.execute(method)
      json
    end

    def update(environment_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :environment_id => environment_id,
      }, params)
      method = ApiMethod.new(:put, "/environments/:environment_id", params, headers, @parent)
      json = @client.execute(method)
      Environment.new(json, method)
    end

    def create(params={}, headers={})
      method = ApiMethod.new(:post, "/environments", params, headers, @parent)
      json = @client.execute(method)
      Environment.new(json, method)
    end

  end
end
