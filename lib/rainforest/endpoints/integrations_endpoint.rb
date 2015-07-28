module Rainforest
  class IntegrationsEndpoint < ApiEndpoint

    def new(id)
      Integration.new({:id => id}, nil, @client)
    end

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/integrations", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Integration, json, method)
    end

    def retrieve(integration_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :integration_id => integration_id,
      }, params)
      method = ApiMethod.new(:get, "/integrations/:integration_id", params, headers, @parent)
      json = @client.execute(method)
      Integration.new(json, method)
    end

    def update(integration_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :integration_id => integration_id,
      }, params)
      method = ApiMethod.new(:put, "/integrations/:integration_id", params, headers, @parent)
      json = @client.execute(method)
      Integration.new(json, method)
    end

  end
end
