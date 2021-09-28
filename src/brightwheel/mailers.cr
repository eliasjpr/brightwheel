module Brightwheel
  class Mailers
    MAILERS = {
      "snailgun":  Snailgun,
      "spendgrid": Spendgrid,
    }

    def self.default
      MAILERS[DEFAULT_MAILER].new
    end

    def self.alternate
      MAILERS["spendgrid"].new
    end

    def self.[](mailer : String)
      MAILERS[mailer].new
    end
  end
end
