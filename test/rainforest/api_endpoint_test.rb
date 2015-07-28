require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class ApiEndpointTest < ::Test::Unit::TestCase
    context '#initialize' do
      should 'set the client and parent' do
        ep = ApiEndpoint.new("client", "parent")
        assert_equal("client", ep.client)
        assert_equal("parent", ep.parent)
      end
    end
  end
end
