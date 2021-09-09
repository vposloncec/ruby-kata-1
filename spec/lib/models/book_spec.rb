# require_relative '../spec_helper'
require_relative "../../../lib/models/book"
require_relative "../../../lib/models/author"

module Echocat
  RSpec.describe Book do
    let(:example_authors) { [Author.new(first_name: "Edgar Allan", last_name: "Poe")] }
    let(:example) { described_class.new(title: "Foo", description: "bar", authors: example_authors, isbn: "24-24") }

    before {
      described_class.all << example
    }
    it "is created with valid params" do
      expect(example.title).to eq "Foo"
    end

    it "can be parsed from csv" do
      csv_file = File.join(File.expand_path("../../../data", __dir__), "books.csv")
      authors = described_class.from_csv(csv_file)

      expect(authors.length).to be > 1
    end

    it "can be fetched by isbn" do
      expect(described_class.find_by(:isbn, "24-24")).to eq(example)
    end
  end

end
