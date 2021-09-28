module Brightwheel
  # Represents the persistent layer of the application for messages delivery status
  module Repo::Messages
    MESSAGES = {} of String => Message

    # Uses method overloading depending on the type of mailer
    # the method will be called
    def self.save(response : Halite::Response, mailer : Snailgun)
      json = JSON.parse(response.body)
      status = Status.parse(json["status"].to_s)
      id = json["id"].to_s

      persist(id, status, mailer.to_s)
    end

    def self.save(response : Halite::Response, mailer : Spendgrid)
      # TODO
    end

    def self.get_by(id : String)
      MESSAGES[id]
    end

    # Saves mthisessages to persistent store
    # We talked about having a DB eventually
    # given that there are limitation with in memory store
    private def self.persist(id, status, mailer)
      MESSAGES[id] = Message.new(id, status, mailer)
      true
    rescue e
      false
    end
  end
end
