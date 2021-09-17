module Brightwheel
  class EmailEndpoint
    include Endpoint(EmailRequest, EmailResponse)

    post "/email"

    def call : EmailResponse
      raise invalid_email_message unless email_request.valid?
      content_type "application/json"
      response = MailerService.send(email_request)
      EmailResponse.new(response)
    end

    def invalid_email_message
      error "Invalid Email Payload.", 400, email_request.error_messages
    end
  end
end
