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
          puts "\nInterrupt, exiting."
          system "stty echo"
          exit 1
      #rescue
      #  puts "ERROR: #{$!}\n"
      end
    end

    def display(i)
          puts "#{i.account}\t#{i.server}\t#{i.modified_date}\t#{i.protocol}\t#{i.path}\t#{i.creator}\n" 
          Action.defaults.each_with_index { |action,i| action.present(i) }
    end

  end
end
