module Rainforest
  class ClientStats < ApiResource
    attr_accessor :has_runs
    attr_accessor :has_schedules
    attr_accessor :has_step_variables
    attr_accessor :has_steps
    attr_accessor :has_test_steps
    attr_accessor :has_tests

    def self.retrieve(params={}, headers={})
      res = client.client_stats.retrieve(params, headers)
      res
    end

    def refresh(params={}, headers={})
      res = client.client_stats.retrieve(params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "client_stats")
    @api_attributes = {
      :has_runs => {},
      :has_schedules => {},
      :has_step_variables => {},
      :has_steps => {},
      :has_test_steps => {},
      :has_tests => {},
    }
  end
end
