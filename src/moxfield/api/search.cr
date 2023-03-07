module Moxfield::Api::Search
  # This function searches for cards that match a given query string.
  def card_query(q : String) : Moxfield::Types::CardList(Types::Card)
    # Build a hash of query parameters to be used in the HTTP request
    params = HTTP::Params.build do |form|
      form.add "q", q
    end
    # Fetch the card list using the API_CARD_SEARCH_PATH endpoint and the specified query parameters
    fetch_card_list(API_CARD_SEARCH_PATH, params)
  end

  # This function wraps card list searches to properly set the request URI.
  protected def fetch_card_list(path : String, params : String | Nil = nil) : Moxfield::Types::CardList(Types::Card)
    # Build the request URI using the specified path and query parameters
    uri = make_request_uri(path, params)
    # Make the HTTP request and parse the response as a Moxfield::CardList object
    data = make_request(uri)
    resp = Moxfield::Types::CardList(Types::Card).from_json(data)
    resp.uri = uri
    resp
  end

  # This function searches for decks that match the specified criteria.
  def deck_query(page = 1, size = 100, sort : SortType = SortType::Updated, dir = SORT_DES,
                 format : String? = nil, commander_card_id : String? = nil) : Moxfield::Types::PagedResponse(Types::DeckDatum)
    # Build a hash of query parameters to be used in the HTTP request
    params = HTTP::Params.build do |form|
      form.add "pageNumber", page.to_s
      form.add "pageSize", size.to_s
      form.add "sortType", sort.to_s
      form.add "sortDirection", dir

      form.add("fmt", format) if format
      form.add("commanderCardId", commander_card_id) if commander_card_id
    end

    # Fetch the deck list using the API_DECK_SEARCH_PATH endpoint and the specified query parameters
    fetch_deck_list(API_DECK_SEARCH_PATH, params)
  end

  # This function wraps deck list searches to properly set the request URI.
  protected def fetch_deck_list(path : String, params : String | Nil = nil) : Moxfield::Types::PagedResponse(Types::DeckDatum)
    # Build the request URI using the specified path and query parameters
    uri = make_request_uri(path, params)
    # Make the HTTP request and parse the response as a Moxfield::PagedResponse object
    data = make_request(uri)
    resp = Moxfield::Types::PagedResponse(Types::DeckDatum).from_json(data)
    resp.uri = uri
    resp
  end
end
