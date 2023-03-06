module Moxfield::Api::Search
  # This function searches for cards that match a given query string.
  def query(q : String)
    params = HTTP::Params.build do |form|
      form.add "q", q
    end
    fetch_card_list(API_CARD_SEARCH_PATH, params)
  end

  # This function wraps card list searches to properly set the request URI.
  protected def fetch_card_list(path : String, params : String | Nil = nil)
    uri = make_request_uri(path, params)
    data = make_request(uri)
    Moxfield::CardList(SearchDatum).from_json(data)
  end
end
