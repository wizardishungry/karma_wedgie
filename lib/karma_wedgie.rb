require 'rubygems'
require 'keychain'


class KarmaWedgie
  VERSION = '0.0.0'
  def query(line)
      begin
        item = Keychain.items.find { |item| item.password =~ Regexp.new(line) && i.security_domain }
      rescue
        puts "got error #{$!}\n"
        item = nil
      end

      if item
        puts "#{item.account}/#{item.label}\n"
      end
      # modified_date
      # server
      # authentication_type => form
      # password
      # account
      # creation_date
      # protocol => http
      # creator
      # path
  end
  def list
    count = 0
    Keychain.items.each do |i|
      puts "#{i.account}\t#{i.server}\t#{i.modified_date}\t#{i.protocol}\t#{i.path}\n" 
      count=count+1
    end
  end
end
