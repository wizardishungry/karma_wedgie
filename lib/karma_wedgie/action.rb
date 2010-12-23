module KarmaWedgie
  class Action
    attr_accessor :url, :label
    def initialize(url,label)
      @url=url
      @label=label
    end
    def to_s
      "#{@label} #{@url}"
    end

    def self.defaults(item)
    [
      Action.new("http://#{item.server}/","Visit site to change password"),
      Action.new("","Change password right now"),
      Action.new(nil,"Continue matching"),
      Action.new(nil,"Continue matching, ignoring same site for the remainder of the session"),
      Action.new(nil,"Delete entry"),
      Action.new(nil,"Delete entry and all other entries for #{item.server}"),
      Action.new(nil,"Clear ignore list and return to regular expression entry"),
      Action.new(nil,"Return to regular expression entry"),
    ]
    end
  end
end
