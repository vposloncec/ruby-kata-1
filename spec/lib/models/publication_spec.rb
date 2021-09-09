require_relative "../../../lib/models/publication"
require_relative "../../../lib/models/book"
require_relative "../../../lib/models/magazine"

module Echocat
  RSpec.describe Publication do
    before(:all) {
      Book.new(isbn: "23-23", title: "book1")
      Magazine.new(isbn: "33-33", title: "mag", published_at: "11-10-2021")
      Book.new(isbn: "53-53", title: "book2", description: "foo")
      Magazine.new(isbn: "232-33", title: "aram", published_at: "01-08-2019")
    }

    it "can be fetched by isbn" do
      expect(described_class.find_by(:isbn, "53-53").title).to eq("book2")
    end

    describe ".sorted_by_title" do
      subject(:response) { described_class.sorted_by_title }

      it "returns all publications" do
        expect(response.size).to eq 4
      end

      it "returns by title alphabetically" do
        expect(response.first.title).to eq "aram"
      end
    end
  end
end
