require_relative "../../../lib/models/author"

module Echocat
  RSpec.describe Author do
    let(:example) { described_class.new(email: "example@mail.com", first_name: "John", last_name: "Doe") }

    it "is created with valid params" do
      expect([example.email, example.first_name, example.last_name]).to eq %w[example@mail.com John Doe]
    end

    it "can be parsed from csv" do
      csv_file = File.join(File.expand_path("../../../data", __dir__), "authors.csv")
      authors = described_class.from_csv(csv_file)

      expect(authors.length).to be > 1
    end
  end
end
