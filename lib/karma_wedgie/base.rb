require 'rubygems'
require 'keychain'

module KarmaWedgie
  VERSION = '0.0.0'
  class Base

    include FSM

    def query(line)
        @item = @items.find { |item| item.password =~ Regexp.new(line) }

        while @item
          @item.url = "http://#{@item.server}/" # totally not reasonable
          @item.display
          actions = Action.defaults(@item,self).each_with_index { |action,i| action.present(i) }
          action = actions[choice(actions.count)]
          action.call self
        end
  
    end

    def list
      @items.select { |i| 
          #!(i.protocol=~/http|htps/) &&
          i.protocol==nil #&& i.creator!=''
        }.each do |i|
          puts "#{i.account}\t#{i.server}\t#{i.modified_date}\t#{i.protocol}\t#{i.path}\t#{i.creator}\n" 
        end

    end

    def initialize
      @items = Keychain.items.
        select { |i| (i.protocol=~/^(http|htps)$/) }. # change this to suit you
        sort { |a,b| b.modified_date <=> a.modified_date } # newest first
    end

  end
end
