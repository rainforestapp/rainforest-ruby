require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class ApiMethodTest < ::Test::Unit::TestCase
    setup do
      @method = :get
      @path = "/testing"
      @params = { :param_a => "1" }
      @headers = { :header_a => "a" }
      @object = mock
      @api_method = ApiMethod.new(@method, @path, @params, @headers, @object)
    end

    context '#initialize' do
      should 'set the api_base' do
        assert_equal(Rainforest.api_base, @api_method.api_base)
      end

      should 'use PathBuilder with path, object, and params' do
        PathBuilder.expects(:build).with(@path, @object, @params).returns(@path)
        ApiMethod.new(@method, @path, @params, @headers, @object)
      end

      should 'use ParamsBuilder with params' do
        ParamsBuilder.expects(:build).with(@params).returns(@params)
        ApiMethod.new(@method, @path, @params, @headers, @object)
      end

      should 'use HeadersBuilder with headers, api_key, and nil auth_header' do
        HeadersBuilder.expects(:build).with(@headers).returns(@headers)
        ApiMethod.new(@method, @path, @params, @headers, @object)
      end
    end

    context '#execute' do
      setup do
        @mock_response = mock
        @mock_response.stubs(:body).returns('{"status": "success"}')
        @mock_response.stubs(:code).returns(200)
      end

      should 'call Requester.request with the set attrs' do
        Requester.expects(:request).with(@method, @api_method.url, @api_method.params, @api_method.headers).returns(@mock_response)
        @api_method.execute
      end

      should 'create an ApiError if the request fails' do
        Requester.expects(:request).raises(RestClient::RequestTimeout.new)

        assert_raises(ApiError) { @api_method.execute }
      end

      should 'return the response parsed as json' do
        Requester.expects(:request).returns(@mock_response)
        assert_equal({:status => "success"}, @api_method.execute)
      end

      should 'return an AuthenticationError if the status is 401' do
        error = RestClient::ExceptionWithResponse.new
        error.expects(:http_code).returns(401)

        Requester.expects(:request).raises(error)
        assert_raises(AuthenticationError) { @api_method.execute }
      end
    end

    context '#response_json' do
      setup do
        @api_method.response_body = 'not-valid-json'
      end

      should 'throw an error if the response_body isnt valid json' do
        assert_raises(ApiError) { @api_method.response_json }
      end
    end

  end
end
