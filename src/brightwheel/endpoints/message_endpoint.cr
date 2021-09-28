module Brightwheel
  class MessageEndpoint
    include Endpoint(MessageRequest, MessageResponse)

    get "/email/:id"

    def call : MessageResponse
      status = MailerService.status(message_request)
      MessageResponse.new status
    end
  end
end
