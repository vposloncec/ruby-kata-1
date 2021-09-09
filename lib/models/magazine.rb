require_relative "../csv_importer"
require_relative "../findable"

module Echocat
  class Magazine
    extend Findable

    def self.from_csv(path)
      CsvImporter.load_magazines(path).map { |record| new(record) }
    end

    attr_accessor :title, :isbn, :authors, :published_at

    def initialize(params)
      @title = params[:title]
      @isbn = params[:isbn]
      @authors = params[:authors]
      @published_at = params[:published_at]

      Magazine.all << self
    end

    def to_s
      "Magazine: #{title}, #{isbn}, #{authors}, #{published_at}"
    end
  end
end
