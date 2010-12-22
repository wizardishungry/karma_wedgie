require 'karma_wedgie'
require 'rubygems'
require 'highline/import'

class KarmaWedgieConsole < KarmaWedgie
  def run
    begin
      while line = ask("Password regexp?: "){|q| q.echo = false}
        query(line){|range| ask "action?: " }
      end
      rescue EOFError
        # do nothing for now
      rescue Interrupt
          puts
          system "stty echo"
          exit
      rescue
        puts "ERROR: #{$!}\n"
      end
    end
end
