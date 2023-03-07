require "./spec_helper"

describe Moxfield do
  describe Moxfield::Types::Card do
    it "serializes" do
      Moxfield::Types::Card.from_json(File.read("./spec/fixtures/search_datum.json"))
    end
  end

  describe Moxfield::Types::Decks do
    it "serializes" do
      Moxfield::Types::Decks.from_json(File.read("./spec/fixtures/decks.json"))
    end
  end
end
