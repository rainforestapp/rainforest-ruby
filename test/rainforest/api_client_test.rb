require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class ApiClientTest < ::Test::Unit::TestCase
    setup do
      @headers = {
        :Accept => "application/json",
        :Authorization => "Fake Auth"
      }
      @params = {
        :customer_id => 123
      }
      @client = ApiClient.new(@headers, @params)
    end

    context '#execute' do
      setup do
        @api_method = mock
        @api_method.stubs(:headers).returns({
          :fake_header => "fake-header-val"
        })
        @api_method.stubs(:headers=)
        @api_method.stubs(:params).returns({
          :fake_param => "fake-param"
        })
        @api_method.stubs(:params=)
        @api_method.stubs(:execute)
      end

      should 'merge the client headers and params into the api_method' do
        expected_headers = { :hello => true }
        expected_params = { :goodbye => false }

        ParamsBuilder.expects(:merge).with(@api_method.headers, @headers).returns(expected_headers)
        ParamsBuilder.expects(:merge).with(@api_method.params, @params).returns(expected_params)

        @api_method.expects(:headers=).with(expected_headers)
        @api_method.expects(:params=).with(expected_params)

        @client.execute(@api_method)
      end

      should 'call api_method.execute and return the results' do
        expected = { :status => "success!" }
        @api_method.expects(:execute).returns(expected)
        assert_equal(expected, @client.execute(@api_method))
      end
    end

  end
end
