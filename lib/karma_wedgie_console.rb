require 'karma_wedgie'
require 'rubygems'
require 'highline/import'

class KarmaWedgieConsole < KarmaWedgie
  def run
    while line = ask("Password regexp?: "){|q| q.echo = false}
      query(line){|range| ask "action?: " }
    end
  end
end
