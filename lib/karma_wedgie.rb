require 'rubygems'
require 'keychain'

class KarmaWedgie
  VERSION = '0.0.0'
  def query(line)
      begin
        item = @items.find { |item| item.password =~ Regexp.new(line) }
      rescue
        puts "got error #{$!}\n"
        item = nil
      end

      if item
        display item
        choice = yield 5
      end
 
  end

  def display(i)
        puts "#{i.account}\t#{i.server}\t#{i.modified_date}\t#{i.protocol}\t#{i.path}\t#{i.creator}\n" 
  end

  def list
    @items.select { |i| 
        #!(i.protocol=~/http|htps/) &&
        i.protocol==nil #&& i.creator!=''
      }.each do |i|
        puts "#{i.account}\t#{i.server}\t#{i.modified_date}\t#{i.protocol}\t#{i.path}\t#{i.creator}\n" 
      end
    # FIELDS
    # modified_date
    # server
    # authentication_type => form
    # password
    # account
    # creation_date
    # protocol => http,htps,afp,smtp,imap,etc <-- 4 letter codes
    # creator
    # path
    # security_domain
  end

  def initialize
    @items = Keychain.items.
      select { |i| (i.protocol=~/^(http|htps)$/) }. # change this to suit you
      sort { |a,b| b.modified_date <=> a.modified_date } # newest first
  end

end
