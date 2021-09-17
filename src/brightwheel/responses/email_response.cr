module Brightwheel
  class EmailResponse
    include Response

    def initialize(@response : String)
    end

    def render
      @response
    end
  end
end
