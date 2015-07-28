module Rainforest
  class SitesEndpoint < ApiEndpoint

    def new(id)
      Site.new({:id => id}, nil, @client)
    end

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/sites", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Site, json, method)
    end

    def delete(site_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :site_id => site_id,
      }, params)
      method = ApiMethod.new(:delete, "/sites/:site_id", params, headers, @parent)
      json = @client.execute(method)
      Site.new(json, method)
    end

    def update(site_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :site_id => site_id,
      }, params)
      method = ApiMethod.new(:put, "/sites/:site_id", params, headers, @parent)
      json = @client.execute(method)
      Site.new(json, method)
    end

    def create(params={}, headers={})
      method = ApiMethod.new(:post, "/sites", params, headers, @parent)
      json = @client.execute(method)
      Site.new(json, method)
    end

  end
end
