module Rainforest
  class SiteEnvironment < ApiResource
    attr_accessor :created_at
    attr_accessor :environment_id
    attr_accessor :id
    attr_accessor :site_id
    attr_accessor :url

    def self.all(params={}, headers={})
      res = client.site_environments.all(params, headers)
      res
    end

    def self.update(site_environment_id, params={}, headers={})
      res = client.site_environments.update(site_environment_id, params, headers)
      res
    end

    def update(params={}, headers={})
      res = client.site_environments.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def save(params={}, headers={})
      params = ParamsBuilder.merge(api_attributes, params)
      res = client.site_environments.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "site_environment")
    @api_attributes = {
      :created_at => {},
      :environment_id => {},
      :id => {},
      :site_id => {},
      :url => {},
    }
  end
end
