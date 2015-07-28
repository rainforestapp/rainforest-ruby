require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class HeadersBuilderTest < ::Test::Unit::TestCase

    setup do
      @headers = {
        :dog => "dog-value"
      }
      @built_headers = HeadersBuilder.build(@headers)
    end

    should 'set the user_agent' do
      assert(@built_headers.has_key?(:user_agent))
      assert(@built_headers[:user_agent].include?(Rainforest::VERSION))
      assert(@built_headers[:user_agent].include?(Rainforest.api_version))
    end

    should 'set a client user agent' do
      # This can be raw or json encoded depending on various things
      unless @built_headers.has_key?(:x_rainforest_client_user_agent) ||
        @built_headers.has_key?(:x_rainforest_client_raw_user_agent)
        raise "No valid client user agent found"
      end
    end

  end
end
