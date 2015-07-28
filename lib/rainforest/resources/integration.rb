module Rainforest
  class Integration < ApiResource
    attr_accessor :created_at
    attr_accessor :id
    attr_accessor :recent_upstream_errors
    attr_accessor :settings
    attr_accessor :state
    attr_accessor :type

    def self.all(params={}, headers={})
      res = client.integrations.all(params, headers)
      res
    end

    def self.retrieve(integration_id, params={}, headers={})
      res = client.integrations.retrieve(integration_id, params, headers)
      res
    end

    def self.update(integration_id, params={}, headers={})
      res = client.integrations.update(integration_id, params, headers)
      res
    end

    def refresh(params={}, headers={})
      res = client.integrations.retrieve(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def update(params={}, headers={})
      res = client.integrations.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def save(params={}, headers={})
      params = ParamsBuilder.merge(api_attributes, params)
      res = client.integrations.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "integration")
    @api_attributes = {
      :created_at => {},
      :id => {},
      :recent_upstream_errors => {},
      :settings => {},
      :state => {},
      :type => {},
    }
  end
end
