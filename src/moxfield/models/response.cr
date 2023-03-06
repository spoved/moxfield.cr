module Moxfield
  struct PagedResponse(T)
    include JSON::Serializable
    @[JSON::Field(key: "pageNumber")]
    property page_number : Int32
    @[JSON::Field(key: "pageSize")]
    property page_size : Int32
    @[JSON::Field(key: "totalResults")]
    property total_results : Int32
    @[JSON::Field(key: "totalPages")]
    property total_pages : Int32
    property data : Array(T)

    def each
      data.each do |card|
        yield card
      end
    end

    def has_more? : Bool
      self.total_pages > self.page_number
    end
  end

  struct CardList(T)
    include JSON::Serializable

    @[JSON::Field(key: "hasMore")]
    property has_more : Bool
    @[JSON::Field(key: "totalCards")]
    property total_cards : Int32
    @[JSON::Field(key: "nextPage")]
    property next_page : String? = nil
    property data : Array(T)

    def each
      data.each do |card|
        yield card
      end
    end

    def has_more? : Bool
      self.has_more
    end
  end
end
