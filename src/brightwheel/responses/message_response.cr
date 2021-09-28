module Brightwheel
  class MessageResponse
    include Response

    def initialize(@status : Status)
    end

    def render
      {status: @status}.to_json
    end
  end
end
