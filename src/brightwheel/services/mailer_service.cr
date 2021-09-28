module Brightwheel
  enum Status
    Queued
    Sent
    Failed
  end

  class MailerService
    def self.status(message : MessageRequest) : Status
      message.mailer.status_for(message.id)
    end

    def self.send(email : EmailRequest)
      mailer = Mailers.default
      response = mailer.send(email)
    rescue e
      mailer = Mailers.alternate
      response = mailer.send(email)
    ensure
      Repo::Messages.save response, mailer
    end
  end
end
