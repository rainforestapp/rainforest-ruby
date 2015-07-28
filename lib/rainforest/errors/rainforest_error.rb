module Rainforest
  class RainforestError < StandardError
    attr_reader :message

    def initialize(message=nil)
      @message = message
    end

    def to_s
      "#{@message}"
    end
  end
end
