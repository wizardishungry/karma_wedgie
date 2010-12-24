module KarmaWedgie
  class Action

    include FSM

    attr_accessor :label

    def initialize(label,mname)
      @label=label
      @mname=mname
    end

    def to_s
      label
    end

    def call (fsm)
      method(@mname).call
      copy_into fsm
    end

    def present(i)
      puts "#{sprintf "%2d",i+1}\t#{to_s}\n"
    end


    def self.defaults(item,fsm)
      [
        Action.new("Visit site to change password #{item.url}", :open_url),
        #Action.new("Change password right now",:do_nothing),
        Action.new("Continue matching",:do_nothing),
        Action.new("Continue matching, ignoring same site for the remainder of the session",:do_nothing),
        Action.new("Delete entry",:do_nothing),
        #Action.new("Delete all other entries for #{item.server}",:do_nothing),
        #Action.new("Delete entry and all other entries for #{item.server}",:do_nothing),
        Action.new("Clear ignore lists and return to regular expression entry",:do_nothing),
        Action.new("Return to regular expression entry",:do_nothing),
      ].each do |a|
        fsm.copy_into a
      end
    end

    def open_url
      `open #{item.url}`
    end

    def do_nothing
      puts "do_nothing() called\n"
    end

  end
end
