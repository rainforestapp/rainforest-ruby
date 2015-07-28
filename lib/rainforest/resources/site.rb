module Rainforest
  class Site < ApiResource
    attr_accessor :created_at
    attr_accessor :default
    attr_accessor :id
    attr_accessor :name

    def self.all(params={}, headers={})
      res = client.sites.all(params, headers)
      res
    end

    def self.update(site_id, params={}, headers={})
      res = client.sites.update(site_id, params, headers)
      res
    end

    def self.delete(site_id, params={}, headers={})
      res = client.sites.delete(site_id, params, headers)
      res
    end

    def self.create(params={}, headers={})
      res = client.sites.create(params, headers)
      res
    end

    def update(params={}, headers={})
      res = client.sites.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def save(params={}, headers={})
      params = ParamsBuilder.merge(api_attributes, params)
      res = client.sites.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def delete(params={}, headers={})
      res = client.sites.delete(id, params, headers)
      res
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "site")
    @api_attributes = {
      :created_at => {},
      :default => {},
      :id => {},
      :name => {},
    }
  end
end
