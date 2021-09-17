require "azu"
require "halite"

module Brightwheel
  include Azu

  SNAILGUN_API_KEY  = ENV.fetch "SNAILGUN_API_KEY"
  SPENDGRID_API_KEY = ENV.fetch "SPENDGRID_API_KEY"
  DEFAULT_MAILER    = ENV.fetch "DEFAULT_MAILER"

  MAILERS = {
    "snailgun":  Snailgun,
    "spendgrid": Spendgrid,
  }
end

require "./brightwheel/mailer_adapter"
require "./brightwheel/requests/*"
require "./brightwheel/responses/*"
require "./brightwheel/adapters/*"
require "./brightwheel/services/*"
require "./brightwheel/endpoints/*"

Brightwheel.start [
  Azu::Handler::Rescuer.new,
  Azu::Handler::Logger.new,
]
