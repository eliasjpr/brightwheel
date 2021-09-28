require "./app"

Brightwheel.start [
  Brightwheel::Handler::Rescuer.new,
  Brightwheel::Handler::Logger.new,
]
