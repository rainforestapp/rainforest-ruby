module Rainforest
  class SiteEnvironmentsEndpoint < ApiEndpoint

    def new(id)
      SiteEnvironment.new({:id => id}, nil, @client)
    end

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/site_environments", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:SiteEnvironment, json, method)
    end

    def update(site_environment_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :site_environment_id => site_environment_id,
      }, params)
      method = ApiMethod.new(:put, "/site_environments/:site_environment_id", params, headers, @parent)
      json = @client.execute(method)
      SiteEnvironment.new(json, method)
    end

  end
end
