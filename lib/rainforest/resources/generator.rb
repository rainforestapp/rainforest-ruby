module Rainforest
  class Generator < ApiResource
    attr_accessor :columns
    attr_accessor :created_at
    attr_accessor :data
    attr_accessor :description
    attr_accessor :generator_type
    attr_accessor :id
    attr_accessor :name
    attr_accessor :row_count

    def self.all(params={}, headers={})
      res = client.generators.all(params, headers)
      res
    end

    def self.retrieve(generator_id, params={}, headers={})
      res = client.generators.retrieve(generator_id, params, headers)
      res
    end

    def self.update(generator_id, params={}, headers={})
      res = client.generators.update(generator_id, params, headers)
      res
    end

    def self.delete(generator_id, params={}, headers={})
      res = client.generators.delete(generator_id, params, headers)
      res
    end

    def self.create(params={}, headers={})
      res = client.generators.create(params, headers)
      res
    end

    def refresh(params={}, headers={})
      res = client.generators.retrieve(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def update(params={}, headers={})
      res = client.generators.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def delete(params={}, headers={})
      res = client.generators.delete(id, params, headers)
      res
    end

    def rows()
      GeneratorRowsEndpoint.new(client, self)
    end

    def save(params={}, headers={})
      params = ParamsBuilder.merge(api_attributes, params)
      res = client.generators.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "generator")
    @api_attributes = {
      :columns => {},
      :created_at => {},
      :data => {},
      :description => { :editable => true },
      :generator_type => {},
      :id => {},
      :name => { :editable => true },
      :row_count => {},
    }
  end
end
