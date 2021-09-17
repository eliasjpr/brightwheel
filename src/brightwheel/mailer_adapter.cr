module Brightwheel
  abstract class MailerAdapter
    getter email : EmailRequest

    def self.send(email : EmailRequest)
      new(email).send
    end

    def initialize(@email : EmailRequest)
    end

    abstract def send
  end
end
