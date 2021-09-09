require_relative "../csv_importer"
require 'pry'

module Echocat
  class Book
    class << self
      def all
        @all ||= []
      end

      def find_by(key, value)
        all.detect { |e| e.send(key) == value }
      end

      def from_csv(path)
        @all = CsvImporter.load_books(path).map { |record| new(record) }
      end
    end

    attr_accessor :title, :description, :isbn, :authors

    def initialize(params)
      @title = params[:title]
      @description = params[:description]
      @isbn = params[:isbn]
      @authors = params[:authors]
    end

    def to_s
      "Book: #{title}, #{isbn}, #{authors}, #{description}"
    end
  end
end
