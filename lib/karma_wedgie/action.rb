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
  end
end
