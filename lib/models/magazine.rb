require_relative "../csv_importer"

module Echocat
  class Magazine
    class << self
      def all
        @all ||= []
      end

      def from_csv(file)
        @all = CsvImporter.load_magazines(file).map { |record| new(record) }
      end
    end
    attr_accessor :title, :isbn, :authors, :published_at

    def initialize(params)
      @title = params[:title]
      @isbn = params[:isbn]
      @authors = params[:authors]
      @published_at = params[:published_at]
    end

    def to_s
      "Magazine: #{title}, #{isbn}, #{authors}, #{published_at}"
    end
  end
end
