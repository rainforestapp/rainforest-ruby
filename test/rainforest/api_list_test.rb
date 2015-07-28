require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class ApiListTest < ::Test::Unit::TestCase

    context '#initialize' do
      setup do
        @fake_resource = { :data => "fake-data" }
        @list = ApiList.new(ApiResource, [@fake_resource])
      end

      should 'set the klass' do
        assert_equal(ApiResource, @list.klass)
      end

      should 'convert the data to klass instances' do
        assert(@list.first.is_a?(ApiResource))
        assert_equal(@fake_resource, @list.first.json)
      end
    end

    context '#refresh_from' do
      setup do
        @fake_resource = { :data => "fake-data" }
        @fake_method = "fake-api-method"
        @fake_client = "fake-client"
        @list = ApiList.new(ApiResource, [], "invalid", "invalid")
      end

      should 'update the api_method' do
        @list.refresh_from([@fake_resource], @fake_method)
        assert_equal(@list.api_method, @fake_method)
      end

      should 'update the client' do
        @list.refresh_from([@fake_resource], nil, @fake_client)
        assert_equal(@list.client, @fake_client)
      end

      should 'clear existing data' do
        @list.refresh_from(["new-data"])

        assert_nil(@list.api_method)
        assert_nil(@list.client)
      end
    end

  end
end
