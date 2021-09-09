require_relative "../csv_importer"
require_relative "../findable"

module Echocat
  class Book
    extend Findable

    def self.from_csv(path)
      CsvImporter.load_books(path).map { |record| new(record) }
    end

    attr_accessor :title, :description, :isbn, :authors

    def initialize(params)
      @title = params[:title]
      @description = params[:description]
      @isbn = params[:isbn]
      @authors = params[:authors]

      Book.all << self
    end

    def to_s
      "Book: #{title}, #{isbn}, #{authors}, #{description}"
    end
  end
end
