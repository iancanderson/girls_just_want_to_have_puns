require "spec_helper"

describe GirlsJustWantToHavePuns::PunGenerator do
  it "uses the list of rhymes, if provided" do
    generator = described_class.new(
      "pun",
      rhymes: ["gun"],
      source_phrases: [
        Phrase.new("Beatles songs", "happiness is a warm gun")
      ]
    )
    pun = generator.puns.first

    expect(pun.new_phrase).to eq("happiness is a warm pun")
  end

  it "can accept a minimum number of words" do
    generator = described_class.new(
      "pun",
      minimum_word_count: 6,
      rhymes: ["gun"],
      source_phrases: [
        Phrase.new("Beatles songs", "happiness is a warm gun")
      ]
    )
    pun = generator.puns.first

    expect(pun).to eq(nil)
  end

  it "doesn't match partial words" do
    generator = described_class.new(
      "cats",
      minimum_word_count: 6,
      rhymes: ["bat"],
      source_phrases: [
        Phrase.new("misc", "throw the baby out with the bath water")
      ]
    )
    pun = generator.puns.first

    expect(pun).to eq(nil)
  end
end
