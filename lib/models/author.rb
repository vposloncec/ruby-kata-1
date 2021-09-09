require_relative "../csv_importer"

module Echocat
  class Author
    class << self
      def all
        @all ||= []
      end

      def from_csv(file)
        @all = CsvImporter.load_authors(file).map { |record| new(record) }
      end
    end

    attr_accessor :email, :first_name, :last_name

    def initialize(params)
      @email = params[:email]
      @first_name = params[:first_name]
      @last_name = params[:last_name]
    end
  end
end