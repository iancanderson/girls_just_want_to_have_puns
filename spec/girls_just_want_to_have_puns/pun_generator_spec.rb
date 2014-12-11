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
end
