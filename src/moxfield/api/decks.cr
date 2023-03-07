module Moxfield::Api::Decks
  def deck(id : String)
    # Make the HTTP request and parse the response as a Moxfield::CardList object
    data = make_request(make_request_uri("/v2/decks/all/#{id}"))
    Moxfield::Types::Deck.from_json(data)
  end
end
