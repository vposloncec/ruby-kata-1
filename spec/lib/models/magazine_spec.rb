# require_relative '../spec_helper'
require_relative "../../../lib/models/magazine"

module Echocat
  RSpec.describe Magazine do
    it "is created with valid params" do
      title = "foo"
      magazine = described_class.new(title: title)

      expect(magazine.title).to eq title
    end

    it "can be parsed from csv" do
      csv_file = File.join(File.expand_path("../../../data", __dir__), "magazines.csv")
      magazines = described_class.from_csv(csv_file)

      expect(magazines.length).to be > 0
      expect(magazines[0].isbn).to eq("5454-5587-3210")
    end
  end

end
