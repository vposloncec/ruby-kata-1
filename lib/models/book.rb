require_relative "../csv_importer"

module Echocat
  class Book
    class << self
      def all
        @all ||= []
      end

      def from_csv(path)
        @all = CsvImporter.load_books(path).map { |record| new(record) }
      end
    end

    attr_accessor :title, :description, :isbn

    def initialize(params)
      @title = params[:title]
      @description = params[:description]
      @isbn = params[:isbn]
    end
  end
end
