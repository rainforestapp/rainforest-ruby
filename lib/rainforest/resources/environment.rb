module Rainforest
  class Environment < ApiResource
    attr_accessor :created_at
    attr_accessor :default
    attr_accessor :id
    attr_accessor :name
    attr_accessor :site_environments
    attr_accessor :webhook
    attr_accessor :webhook_enabled

    def self.all(params={}, headers={})
      res = client.environments.all(params, headers)
      res
    end

    def self.retrieve(environment_id, params={}, headers={})
      res = client.environments.retrieve(environment_id, params, headers)
      res
    end

    def self.update(environment_id, params={}, headers={})
      res = client.environments.update(environment_id, params, headers)
      res
    end

    def self.delete(environment_id, params={}, headers={})
      res = client.environments.delete(environment_id, params, headers)
      res
    end

    def self.create(params={}, headers={})
      res = client.environments.create(params, headers)
      res
    end

    def refresh(params={}, headers={})
      res = client.environments.retrieve(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def update(params={}, headers={})
      res = client.environments.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def delete(params={}, headers={})
      res = client.environments.delete(id, params, headers)
      res
    end

    def runs()
      EnvironmentRunsEndpoint.new(client, self)
    end

    def save(params={}, headers={})
      params = ParamsBuilder.merge(api_attributes, params)
      res = client.environments.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "environment")
    @api_attributes = {
      :created_at => {},
      :default => { :editable => true },
      :id => {},
      :name => { :editable => true },
      :site_environments => { :editable => true },
      :webhook => { :editable => true },
      :webhook_enabled => { :editable => true },
    }
  end
end
