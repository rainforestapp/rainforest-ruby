module Rainforest
  class Schedule < ApiResource
    attr_accessor :created_at
    attr_accessor :filters
    attr_accessor :id
    attr_accessor :repeat_rules

    def self.all(params={}, headers={})
      res = client.schedules.all(params, headers)
      res
    end

    def self.retrieve(schedule_id, params={}, headers={})
      res = client.schedules.retrieve(schedule_id, params, headers)
      res
    end

    def self.update(schedule_id, params={}, headers={})
      res = client.schedules.update(schedule_id, params, headers)
      res
    end

    def self.delete(schedule_id, params={}, headers={})
      res = client.schedules.delete(schedule_id, params, headers)
      res
    end

    def self.create(params={}, headers={})
      res = client.schedules.create(params, headers)
      res
    end

    def refresh(params={}, headers={})
      res = client.schedules.retrieve(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def update(params={}, headers={})
      res = client.schedules.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def save(params={}, headers={})
      params = ParamsBuilder.merge(api_attributes, params)
      res = client.schedules.update(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def delete(params={}, headers={})
      res = client.schedules.delete(id, params, headers)
      res
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "schedule")
    @api_attributes = {
      :created_at => {},
      :filters => { :editable => true },
      :id => {},
      :repeat_rules => { :editable => true },
    }
  end
end
