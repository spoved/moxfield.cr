module Moxfield::Types
  struct PagedResponse(T)
    include JSON::Serializable
    include Enumerable(T)

    @[JSON::Field(key: "pageNumber")]
    property page_number : Int32 = 0
    @[JSON::Field(key: "pageSize")]
    property page_size : Int32 = 0
    @[JSON::Field(key: "totalResults")]
    property total_results : Int32 = 0
    @[JSON::Field(key: "totalPages")]
    property total_pages : Int32 = 0
    property data : Array(T) = Array(T).new
    property uri : URI? = nil

    def initialize; end

    def each
      data.each do |card|
        yield card
      end
    end

    def has_more? : Bool
      self.total_pages > self.page_number
    end

    def next_page : URI?
      return nil if self.uri.nil?
      next_uri = URI.parse(self.uri.not_nil!.to_s)
      parms = next_uri.query_params
      parms["pageNumber"] = (self.page_number + 1).to_s
      next_uri.query_params = parms
      next_uri
    end

    # Will make an api request using the next_page value if available
    def fetch_next_page : PagedResponse(T)
      Moxfield::Api.logger.trace { "fetch_next_page : #{next_page.to_s}" }
      nex = next_page
      if has_more? && !uri.nil? && !nex.nil?
        cards = PagedResponse(T).from_json(Moxfield::Api.make_request(nex))
        cards.uri = nex
        cards
      else
        PagedResponse(T).new
      end
    end
  end

  struct CardList(T)
    include JSON::Serializable
    include Enumerable(T)

    @[JSON::Field(key: "hasMore")]
    property has_more : Bool
    @[JSON::Field(key: "totalCards")]
    property total_cards : Int32
    @[JSON::Field(key: "nextPage")]
    property next_page : String? = nil
    property data : Array(T)
    property uri : URI? = nil

    def each
      data.each do |card|
        yield card
      end
    end

    def has_more? : Bool
      self.has_more
    end

    # Will make an api request using the next_page value if available
    def fetch_next_page : CardList(T)
      Moxfield::Api.logger.trace { "fetch_next_page : #{next_page.to_s}" }
      nex = next_page
      if has_more? && !uri.nil?
        cards = CardList(T).from_json(Moxfield::Api.make_request(nex))
        cards.uri = nex
        cards
      else
        CardList(T).new
      end
    end
  end
end
