require "./spec_helper"

describe Moxfield do
  describe Moxfield::CardDatum do
    it "serializes" do
      Moxfield::CardDatum.from_json(File.read("./spec/fixtures/search_datum.json"))
    end
  end

  describe Moxfield::Decks do
    it "serializes" do
      Moxfield::Decks.from_json(File.read("./spec/fixtures/decks.json"))
    end
  end
end
