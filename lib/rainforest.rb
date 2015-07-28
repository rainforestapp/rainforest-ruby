# Rainforest Ruby bindings
# API Docs are located at https://docs.rainfroestqa.com
require 'cgi'
require 'set'
require 'openssl'
require 'rest_client'
require 'json'
require 'base64'

# Version
require 'rainforest/version'

# Errors
require 'rainforest/errors/rainforest_error'
require 'rainforest/errors/api_error'
require 'rainforest/errors/api_connection_error'
require 'rainforest/errors/authentication_error'

# Wrapper around RestClient
require 'rainforest/apibits/requester'

# Builders for creating API methods.
require 'rainforest/apibits/path_builder'
require 'rainforest/apibits/headers_builder'
require 'rainforest/apibits/params_builder'
require 'rainforest/apibits/api_method'

# Generic resources
require 'rainforest/apibits/api_endpoint'
require 'rainforest/apibits/api_client'
require 'rainforest/apibits/api_object'
require 'rainforest/apibits/api_resource'
require 'rainforest/apibits/api_list'
require 'rainforest/apibits/util'

# API specific resources
require 'rainforest/resources/client_stats'
require 'rainforest/resources/environment'
require 'rainforest/resources/generator'
require 'rainforest/resources/integration'
require 'rainforest/resources/run'
require 'rainforest/resources/schedule'
require 'rainforest/resources/site_environment'
require 'rainforest/resources/site'
require 'rainforest/resources/test'
require 'rainforest/resources/user'

# API specific endpoints
require 'rainforest/endpoints/client_stats_endpoint'
require 'rainforest/endpoints/environment_runs_endpoint'
require 'rainforest/endpoints/environments_endpoint'
require 'rainforest/endpoints/generators_endpoint'
require 'rainforest/endpoints/generator_rows_endpoint'
require 'rainforest/endpoints/integrations_endpoint'
require 'rainforest/endpoints/run_tests_endpoint'
require 'rainforest/endpoints/runs_endpoint'
require 'rainforest/endpoints/schedules_endpoint'
require 'rainforest/endpoints/site_environments_endpoint'
require 'rainforest/endpoints/sites_endpoint'
require 'rainforest/endpoints/tests_endpoint'
require 'rainforest/endpoints/users_endpoint'

# API specific clients
require 'rainforest/clients/default_client'


module Rainforest
  @api_base = "https://app.rainforestqa.com/api/1"
  @api_staging = "https://app.rnfrst.com/api/1/"
  @api_version = "v1"
  @support_email = "help@rainforestqa.com"
  @docs_url = "https://docs.rainfroestqa.com"

  class << self
    attr_accessor :api_base, :api_version
    attr_reader :api_staging, :support_email, :docs_url
    attr_accessor :api_key
  end

  def self.default_client
    DefaultClient.new(Rainforest.api_key)
  end
end
