module KarmaWedgie
  class Action < Proc
    attr_accessor :item, :label

    def initialize(item,label)
      @item=item
      @label=label
      super()
    end

    def to_s
      label
    end

    def present(i)
      puts "#{sprintf "%2d",i}\t#{to_s}\n"
    end


    def self.defaults(item)
    [
      Action.new(item,"Visit site to change password #{item.url}"){ `open #{item.url}` },
      Action.new(item,"Change password right now"){},
      Action.new(item,"Continue matching"){},
      Action.new(item,"Continue matching, ignoring same site for the remainder of the session"){},
      Action.new(item,"Delete entry"){},
      Action.new(item,"Delete entry and all other entries for #{item.server}"){},
      Action.new(item,"Clear ignore list and return to regular expression entry"){},
      Action.new(item,"Return to regular expression entry"){},
    ]
    end
  end
end
