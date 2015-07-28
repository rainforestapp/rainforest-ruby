module Rainforest
  class DefaultClient < ApiClient

    def initialize(api_key)
      self.refresh_from(api_key)
    end

    def refresh_from(api_key)
      headers = {
        :Accept => "application/json",
        :"Content-Type" => "application/x-www-form-urlencoded",
        :CLIENT_TOKEN => api_key,
      }
      params = {}
      super(headers, params)
    end

    def client_stats
      @client_stats ||= ClientStatsEndpoint.new(self)
    end

    def environments
      @environments ||= EnvironmentsEndpoint.new(self)
    end

    def generators
      @generators ||= GeneratorsEndpoint.new(self)
    end

    def integrations
      @integrations ||= IntegrationsEndpoint.new(self)
    end

    def runs
      @runs ||= RunsEndpoint.new(self)
    end

    def schedules
      @schedules ||= SchedulesEndpoint.new(self)
    end

    def site_environments
      @site_environments ||= SiteEnvironmentsEndpoint.new(self)
    end

    def sites
      @sites ||= SitesEndpoint.new(self)
    end

    def tests
      @tests ||= TestsEndpoint.new(self)
    end

    def users
      @users ||= UsersEndpoint.new(self)
    end

  end
end
