# require_relative '../spec_helper'
require_relative "../../../lib/models/book"

module Echocat
  RSpec.describe Book do
    it "is created with valid params" do
      title = "Poodr"
      authors = [Author.new(first_name: "Sandi", last_name: "Metz")]
      description = "foo"
      book = described_class.new(title: title, description: description, authors: authors)
      expect(book.title).to eq title
    end

    it "can be parsed from csv" do
      csv_file = File.join(File.expand_path("../../../data", __dir__), "books.csv")
      authors = described_class.from_csv(csv_file)

      expect(authors.length).to be > 0
    end
  end

end
