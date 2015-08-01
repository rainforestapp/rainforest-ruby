module Rainforest
  class Test < ApiResource
    attr_accessor :browsers
    attr_accessor :created_at
    attr_accessor :deletable
    attr_accessor :deleted
    attr_accessor :description
    attr_accessor :dry_run_url
    attr_accessor :editable
    attr_accessor :elements
    attr_accessor :has_been_dry_run
    attr_accessor :id
    attr_accessor :last_run
    attr_accessor :result
    attr_accessor :run_mode
    attr_accessor :site_id
    attr_accessor :start_uri
    attr_accessor :step_count
    attr_accessor :tags
    attr_accessor :test_id
    attr_accessor :title

    def self.all(params={}, headers={})
      res = client.tests.all(params, headers)
      res
    end

    def self.retrieve(test_id, params={}, headers={})
      res = client.tests.retrieve(test_id, params, headers)
      res
    end

    def self.update(test_id, params={}, headers={})
      res = client.tests.update(test_id, params, headers)
      res
    end

    def self.delete(test_id, params={}, headers={})
      res = client.tests.delete(test_id, params, headers)
      res
    end

    def self.create(params={}, headers={})
      res = client.tests.create(params, headers)
      res
    end

    def refresh(params={}, headers={})
      res = client.tests.retrieve(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def update(params={}, headers={})
      res = client.tests.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def delete(params={}, headers={})
      res = client.tests.delete(id, params, headers)
      res
    end

    def history(params={}, headers={})
      res = client.tests.history(id, params, headers)
      res
    end

    def save(params={}, headers={})
      params = ParamsBuilder.merge(api_attributes, params)
      res = client.tests.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "test")
    @api_attributes = {
      :browsers => {},
      :created_at => {},
      :deletable => {},
      :deleted => {},
      :description => {},
      :dry_run_url => {},
      :editable => {},
      :elements => { :editable => true },
      :has_been_dry_run => {},
      :id => {},
      :last_run => {},
      :result => {},
      :run_mode => {},
      :site_id => {},
      :start_uri => { :editable => true },
      :step_count => {},
      :tags => { :editable => true },
      :test_id => {},
      :title => { :editable => true },
    }
  end
end
