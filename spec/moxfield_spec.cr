require "./spec_helper"

describe Moxfield do
  describe Moxfield::SearchDatum do
    it "serializes" do
      Moxfield::SearchDatum.from_json(File.read("./spec/fixtures/search_datum.json"))
    end
  end
end
