module Rainforest
  class User < ApiResource
    attr_accessor :analytics_id
    attr_accessor :client_analytics_id
    attr_accessor :created_at
    attr_accessor :email
    attr_accessor :id
    attr_accessor :name
    attr_accessor :profiles
    attr_accessor :role
    attr_accessor :settings
    attr_accessor :state

    def self.all(params={}, headers={})
      res = client.users.all(params, headers)
      res
    end

    def self.retrieve(user_id, params={}, headers={})
      res = client.users.retrieve(user_id, params, headers)
      res
    end

    def self.update(user_id, params={}, headers={})
      res = client.users.update(user_id, params, headers)
      res
    end

    def self.create(params={}, headers={})
      res = client.users.create(params, headers)
      res
    end

    def self.reset_password(email, params={}, headers={})
      res = client.users.reset_password(email, params, headers)
      res
    end

    def refresh(params={}, headers={})
      res = client.users.retrieve(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def update(params={}, headers={})
      res = client.users.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def reset_password(params={}, headers={})
      res = client.users.reset_password(email, params, headers)
      res
    end

    def save(params={}, headers={})
      params = ParamsBuilder.merge(api_attributes, params)
      res = client.users.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "user")
    @api_attributes = {
      :analytics_id => {},
      :client_analytics_id => {},
      :created_at => {},
      :email => {},
      :id => {},
      :name => {},
      :profiles => {},
      :role => {},
      :settings => {},
      :state => {},
    }
  end
end
