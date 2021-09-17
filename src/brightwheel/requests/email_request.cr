module Brightwheel
  struct EmailRequest
    include Request

    getter to : String
    getter to_name : String
    getter from : String
    getter from_name : String
    getter subject : String
    getter body : String

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validate to, match: VALID_EMAIL_REGEX, message: "Param TO must be valid email address.", presence: true
    validate to_name, message: "Param TO_NAME must be present.", presence: true
    validate from, match: VALID_EMAIL_REGEX, message: "Param FROM must be valid email address.", presence: true
    validate from_name, message: "Param FROM_NAME must be present.", presence: true
    validate subject, message: "Param SUBJECT must be present.", presence: true
    validate body, message: "Param BODY must be present.", presence: true

    def plain_text
      # TODO: parse body to plain text
      # We can remove all the HTML tags but,
      #
      # Open Questions:
      #
      # 1. I ask how do we want to format the plain text?
      # 2. We want to keep the plain text version readable so H1s should be formatted
      # and <p /> should be formatted as well?
      # 3. Do we want to break the length of a sentence to 80 chars which is a common
      # pattern for formatting plain text emails?
    end

    def sender
      "#{from_name} <#{from}>"
    end

    def recipient
      "#{to_name} <#{to}>"
    end
  end
end
