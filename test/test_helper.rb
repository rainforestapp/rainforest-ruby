require 'rainforest'
require 'test/unit'
require 'mocha/setup'
require 'stringio'
require 'shoulda'
require File.expand_path('../test_data', __FILE__)
# require File.expand_path('../mock_resource', __FILE__)

# monkeypatch request methods
module Rainforest
  class << self
    attr_accessor :mock_rest_client
  end

  module Requester
    def self.request(method, url, params, headers)
      case method
      when :get then Rainforest::mock_rest_client.get(url, headers, params)
      when :put then Rainforest::mock_rest_client.put(url, headers, params)
      when :post then Rainforest::mock_rest_client.post(url, headers, params)
      when :delete then Rainforest::mock_rest_client.delete(url, headers, params)
      else
        raise "Invalid method"
      end
    end
  end
end

class ::Test::Unit::TestCase
  include Rainforest::TestData
  include Mocha

  setup do
    @mock = mock
    Rainforest.mock_rest_client = @mock
  end

  teardown do
    Rainforest.mock_rest_client = nil
  end
end
