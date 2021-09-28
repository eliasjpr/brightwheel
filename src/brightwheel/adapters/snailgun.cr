module Brightwheel
  class Snailgun < MailerAdapter
    CONTENT_TYPE = "application/json"
    ENDPOINT     = "https://bw-interviews.herokuapp.com/snailgun/emails"

    def send(email : EmailRequest)
      Halite.headers(
        "Content-Type": CONTENT_TYPE,
        "X-Api-Key": Brightwheel::SNAILGUN_API_KEY
      ).post(ENDPOINT, json: message(email))
    end

    def status_for(id : String) : Status
      response = Halite.headers(
        "Content-Type": CONTENT_TYPE,
        "X-Api-Key": Brightwheel::SNAILGUN_API_KEY
      ).get(ENDPOINT, params: {"id" => id})

      json = JSON.parse(response.body)

      Status.parse json["status"].to_s
    end

    private def message(email)
      {
        "from_email": email.from,
        "from_name":  email.from_name,
        "to_email":   email.to,
        "to_name":    email.to_name,
        "subject":    email.subject,
        "body":       email.body,
      }
    end
  end
end
