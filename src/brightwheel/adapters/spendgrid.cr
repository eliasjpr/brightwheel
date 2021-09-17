module Brightwheel
  class Spendgrid < MailerAdapter
    CONTENT_TYPE = "application/json"
    ENDPOINT     = "https://bw-interviews.herokuapp.com/snailgun/emails/snailgun_email_8I
    c0RUqvZQuZkyK1rMwZSMqb"

    def send
      response = Halite.headers(
        "Content-Type": CONTENT_TYPE,
        "X-Api-Key": Brightwheel::SPENDGRID_API_KEY
      ).post(ENDPOINT, json: message)

      response.body
    end

    def message
      {
        "sender":    email.sender,
        "recipient": email.recipient,
        "subject":   email.subject,
        "body":      email.body,
      }
    end
  end
end
