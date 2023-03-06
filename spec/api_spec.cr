require "./spec_helper"

describe Moxfield::Api do
  describe "#cards" do
    it "can search" do
      list = Moxfield::Api.query("Jodah, Archmage Eternal")
      list.data.size.should eq 1
    end
  end

  describe "#decks" do
    it "can search" do
      list = Moxfield::Api.decks(size: 100)
      list.data.size.should eq 100
    end
  end
end
