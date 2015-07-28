module Rainforest
  class RunsEndpoint < ApiEndpoint

    def new(id)
      Run.new({:id => id}, nil, @client)
    end

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/runs", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Run, json, method)
    end

    def retrieve(run_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :run_id => run_id,
      }, params)
      method = ApiMethod.new(:get, "/runs/:run_id", params, headers, @parent)
      json = @client.execute(method)
      Run.new(json, method)
    end

    def delete(run_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :run_id => run_id,
      }, params)
      method = ApiMethod.new(:delete, "/runs/:run_id", params, headers, @parent)
      json = @client.execute(method)
      Run.new(json, method)
    end

    def abort(run_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :run_id => run_id,
      }, params)
      method = ApiMethod.new(:delete, "/runs/:run_id", params, headers, @parent)
      json = @client.execute(method)
      Run.new(json, method)
    end

    def create(params={}, headers={})
      method = ApiMethod.new(:post, "/runs", params, headers, @parent)
      json = @client.execute(method)
      Run.new(json, method)
    end

  end
end
