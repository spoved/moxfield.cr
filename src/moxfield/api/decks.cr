module Moxfield::Api::Decks
  def decks(page = 1, size = 100, sort : SortType = SortType::Updated, dir = SORT_DES,
            format : String? = nil, commander_card_id : String? = nil)
    params = HTTP::Params.build do |form|
      form.add "pageNumber", page.to_s
      form.add "pageSize", size.to_s
      form.add "sortType", sort.to_s
      form.add "sortDirection", dir

      form.add("fmt", format) if format
      form.add("commanderCardId", commander_card_id) if commander_card_id
    end

    fetch_deck_list(API_DECK_SEARCH_PATH, params)
  end

  protected def fetch_deck_list(path : String, params : String | Nil = nil)
    uri = make_request_uri(path, params)
    data = make_request(uri)
    Moxfield::PagedResponse(DeckDatum).from_json(data)
  end
end
