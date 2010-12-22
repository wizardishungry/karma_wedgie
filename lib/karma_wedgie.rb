require 'rubygems'
require 'keychain'
require 'readline'

class KarmaWedgie
  VERSION = '0.0.0'
  def self.query(line)
      item = Keychain.items.find { |item| item.password =~ Regexp.new(line) }
      puts "#{item.account}@#{item.label}\n"
  end
end
