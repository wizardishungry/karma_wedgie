$:.unshift File.join(File.dirname(__FILE__))
require 'karma_wedgie/fsm'
require 'karma_wedgie/action'
require 'karma_wedgie/base'
require 'karma_wedgie/console'

module KarmaWedgie

  class Keychain::Item

    attr_accessor :url

    def to_s
      "#{account}\t#{server}\t#{modified_date}\t#{protocol}\t#{path}\t#{creator}"
    end

    def display
          puts "#{to_s}\n"
          Action.defaults(self).each_with_index { |action,i| action.present(i) }
    end

  end

end
