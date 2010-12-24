module KarmaWedgie
  module FSM # Flying Spaghetti Monster, not
    attr_accessor :item, :items, :items_ignore, :items_ignore_session

    def copy_into(b)
      b.item=@item
      b.items=@items
      b.items_ignore=@items_ignore
      b.items_ignore_session=@items_ignore_session
    end

  end
end
