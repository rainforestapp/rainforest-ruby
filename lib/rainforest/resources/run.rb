module Rainforest
  class Run < ApiResource
    attr_accessor :browsers
    attr_accessor :created_at
    attr_accessor :current_progress
    attr_accessor :description
    attr_accessor :environment
    attr_accessor :filters
    attr_accessor :frontend_url
    attr_accessor :id
    attr_accessor :log_url
    attr_accessor :real_cost_to_run
    attr_accessor :result
    attr_accessor :sample_test_titles
    attr_accessor :state
    attr_accessor :state_details
    attr_accessor :stats
    attr_accessor :timestamps
    attr_accessor :total_failed_tests
    attr_accessor :total_no_result_tests
    attr_accessor :total_passed_tests
    attr_accessor :total_tests

    def self.all(params={}, headers={})
      res = client.runs.all(params, headers)
      res
    end

    def self.retrieve(run_id, params={}, headers={})
      res = client.runs.retrieve(run_id, params, headers)
      res
    end

    def self.delete(run_id, params={}, headers={})
      res = client.runs.delete(run_id, params, headers)
      res
    end

    def self.abort(run_id, params={}, headers={})
      res = client.runs.delete(run_id, params, headers)
      res
    end

    def self.create(params={}, headers={})
      res = client.runs.create(params, headers)
      res
    end

    def refresh(params={}, headers={})
      res = client.runs.retrieve(id, params, headers)
      self.refresh_from(res.json, res.api_method, res.client)
    end

    def delete(params={}, headers={})
      res = client.runs.delete(id, params, headers)
      res
    end

    def abort(params={}, headers={})
      res = client.runs.delete(id, params, headers)
      res
    end

    def tests()
      RunTestsEndpoint.new(client, self)
    end

    # Everything below here is used behind the scenes.
    ApiResource.register_api_subclass(self, "run")
    @api_attributes = {
      :browsers => {},
      :created_at => {},
      :current_progress => {},
      :description => {},
      :environment => {},
      :filters => {},
      :frontend_url => {},
      :id => {},
      :log_url => {},
      :real_cost_to_run => {},
      :result => {},
      :sample_test_titles => {},
      :state => {},
      :state_details => {},
      :stats => {},
      :timestamps => {},
      :total_failed_tests => {},
      :total_no_result_tests => {},
      :total_passed_tests => {},
      :total_tests => {},
    }
  end
end
