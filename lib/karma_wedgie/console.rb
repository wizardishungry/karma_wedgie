require 'karma_wedgie'
require 'rubygems'
require 'highline/import'

module KarmaWedgie
  class Console < Base 


    def run
      begin
        while line = ask("Password regexp?: "){|q| q.echo = false}
          query(line)
        end
      rescue EOFError
        # do nothing for now
      rescue Interrupt
          puts "Interrupt, exiting"
          system "stty echo"
          exit 1
      rescue
        puts "ERROR: #{$!}\n"
      end
    end

    def present_actions(actions)
    end

    def present_action(action,i=nil)
      print i if i
    end

  end
end
