module Brightwheel
  struct MessageRequest
    include Request
    getter id : String

    validate id, message: "Param ID must be present.", presence: true

    def message
      Repo::Messages.get_by(id)
    end

    def mailer
      Mailers[message.email_vendor]
    end
  end
end
