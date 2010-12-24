module KarmaWedgie
  class Action < Proc

    include FSM

    attr_accessor :label

    def initialize(label)
      @label=label
      super()
    end

    def to_s
      label
    end

    def present(i)
      puts "#{sprintf "%2d",i+1}\t#{to_s}\n"
    end


    def self.defaults(item,fsm)
      [
        Action.new("Visit site to change password #{item.url}"){ `open #{item.url}` },
        Action.new("Change password right now"){},
        Action.new("Continue matching"){},
        Action.new("Continue matching, ignoring same site for the remainder of the session"){},
        Action.new("Delete entry"){},
        Action.new("Delete all other entries for #{item.server}"){},
        Action.new("Delete entry and all other entries for #{item.server}"){},
        Action.new("Clear ignore list and return to regular expression entry"){},
        Action.new("Return to regular expression entry"){},
      ].each do |a|
        fsm.copy_into a
      end
    end

  end
end
