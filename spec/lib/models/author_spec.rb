# require_relative '../spec_helper'
require_relative "../../../lib/models/author"

module Echocat
  RSpec.describe Author do
    it "is created with valid params" do
      email = "example@mail.com"
      name = "John"
      lname = "Doe"
      author = described_class.new(email: email, first_name: name, last_name: lname)

      expect(author.email).to eq email
      expect(author.first_name).to eq name
    end

    it "can be parsed from csv" do
      csv_file = File.join(File.expand_path("../../../data", __dir__), "authors.csv")
      authors = described_class.from_csv(csv_file)

      expect(authors.length).to be > 0
    end
  end

end
