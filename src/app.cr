require "azu"
require "halite"
require "circuit_breaker"
require "myhtml"

module Brightwheel
  include Azu

  SNAILGUN_API_KEY  = ENV.fetch "SNAILGUN_API_KEY"
  SPENDGRID_API_KEY = ENV.fetch "SPENDGRID_API_KEY"
  DEFAULT_MAILER    = ENV.fetch "DEFAULT_MAILER"
end

require "./brightwheel/mailers"
require "./brightwheel/mailer_adapter"
require "./brightwheel/models/*"
require "./brightwheel/repositories/*"
require "./brightwheel/requests/*"
require "./brightwheel/responses/*"
require "./brightwheel/adapters/*"
require "./brightwheel/services/*"
require "./brightwheel/endpoints/*"
