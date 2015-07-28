module Rainforest
  class ApiEndpoint
    attr_accessor :client
    attr_accessor :parent

    def initialize(client, parent=nil)
      @client = client
      @parent = parent
    end
  end
end
