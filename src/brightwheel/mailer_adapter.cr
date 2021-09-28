module Brightwheel
  abstract class MailerAdapter
    def initialize
    end

    abstract def send(email : EmailRequest)
    abstract def status_for(id : String) : Status
  end
end
