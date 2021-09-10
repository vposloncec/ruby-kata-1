require_relative "../../../lib/models/magazine"

module Echocat
  RSpec.describe Magazine do
    let!(:example) { described_class.new(title: "Foo", isbn: "42-42") }

    before { described_class.all << example }

    after { described_class.all = nil }

    it "is created with valid params" do
      expect(example.title).to eq "Foo"
    end

    it "can be fetched by isbn" do
      expect(described_class.find_by(:isbn, "42-42")).to eq(example)
    end

    it "can be parsed from csv" do
      csv_file = File.join(File.expand_path("../../../data", __dir__), "magazines.csv")
      magazines = described_class.from_csv(csv_file)

      expect(magazines.length).to be > 1
    end
  end
end
