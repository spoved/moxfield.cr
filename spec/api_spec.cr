require "./spec_helper"

describe Moxfield::Api do
  describe "#card_query" do
    it "can search" do
      list = Moxfield::Api.card_query("Jodah, Archmage Eternal")
      list.data.size.should eq 1
    end
  end

  describe "#deck_query" do
    it "can search" do
      list = Moxfield::Api.deck_query(size: 100)
      list.data.size.should eq 100
    end
  end

  describe "#deck" do
    it "can fetch by id" do
      deck = Moxfield::Api.deck("iB8WyjxdR061hpRZNRxj-A")
      deck.should be_a Moxfield::Types::Deck
    end
  end
end
