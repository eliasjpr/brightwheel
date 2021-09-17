module Brightwheel
  class MailerService
    def self.send(email : EmailRequest)
      new(email).deliver!
    end

    def initialize(@email : EmailRequest)
    end

    # Some resiliency can be implemented here
    def deliver!
      default_mailer.send(@email)
      # We can do some automatic failover by rescuing and enqueing any failures
      #
      # Examples
      #
      # 1. Retry first vendor after x time out or send via another vendor
      # 2. Response failed first vendor then send
      # 3. Alternatively the message can be enqueued and if retries failed then
      # message can be moved to a DLQ from when a different vendor can be used to send
      # 4. Circuit Breaker
    rescue e
      retry_with_alternate_vendor.send(@email)
    end

    def default_mailer : Brightwheel::MailerAdapter.class
      Brightwheel::MAILERS[DEFAULT_MAILER]
    end

    def retry_with_alternate_vendor
      # Hard coded for now, this can be determined dynamically with health checks
      # uptime, etc
      Brightwheel::MAILERS["spendgrid"]
    end
  end
end
