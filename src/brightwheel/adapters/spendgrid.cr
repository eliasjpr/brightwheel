module Brightwheel
  class Spendgrid < MailerAdapter
    CONTENT_TYPE = "application/json"
    ENDPOINT     = "https://bw-interviews.herokuapp.com/snailgun/emails/snailgun_email_8I
    c0RUqvZQuZkyK1rMwZSMqb"

    def send(email : EmailRequest)
      Halite.headers(
        "Content-Type": CONTENT_TYPE,
        "X-Api-Key": Brightwheel::SPENDGRID_API_KEY
      ).post(ENDPOINT, json: message(email))
    end

    def status_for(id : String) : Status
      # Todo Implement
      Status::Failed
    end

    private def message(email)
      {
        "sender":    email.sender,
        "recipient": email.recipient,
        "subject":   email.subject,
        "body":      email.body,
      }
    end
  end
end
