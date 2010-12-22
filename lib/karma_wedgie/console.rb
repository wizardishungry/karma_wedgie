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
      actions.each_with_index do |action,i|
        present_action(action,i)
      end
    end

    def present_action(action,i)
      puts "#{sprintf "%2d",i}\t#{action}\n"
    end

    def display(i)
          puts "#{i.account}\t#{i.server}\t#{i.modified_date}\t#{i.protocol}\t#{i.path}\t#{i.creator}\n" 
          present_actions(get_actions i)
    end

  end
end
