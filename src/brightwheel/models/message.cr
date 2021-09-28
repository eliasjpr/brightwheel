module Brightwheel
  struct Message
    getter id : String
    getter status : Brightwheel::Status
    getter email_vendor : String

    def initialize(@id, @status, @email_vendor)
    end
  end
end
