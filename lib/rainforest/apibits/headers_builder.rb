module Rainforest
  module HeadersBuilder

    def self.build(headers)
      headers ||= {}
      default_headers.merge(headers)
    end

    def self.default_headers
      headers = {
        :user_agent => "Rainforest/#{Rainforest.api_version} RubyBindings/#{Rainforest::VERSION}",
      }

      begin
        headers.update({
          :x_rainforest_client_user_agent => JSON.generate(user_agent)
        })
      rescue => e
        headers.update({
          :x_rainforest_client_raw_user_agent => user_agent.inspect,
          :error => "#{e} (#{e.class})"
        })
      end
      headers
    end

    def self.user_agent
      lang_version = "#{RUBY_VERSION} p#{RUBY_PATCHLEVEL} (#{RUBY_RELEASE_DATE})"

      {
        :bindings_version => Rainforest::VERSION,
        :lang => 'ruby',
        :lang_version => lang_version,
        :platform => RUBY_PLATFORM,
        :publisher => 'rainforest',
        :uname => get_uname
      }
    end

    def self.get_uname
      `uname -a 2>/dev/null`.strip if RUBY_PLATFORM =~ /linux|darwin/i
    rescue Errno::ENOMEM => ex # couldn't create subprocess
      "uname lookup failed"
    end

  end
end
