require_relative "../csv_importer"
require_relative "../findable"

module Echocat
  class Author
    extend Findable

    def self.from_csv(path)
      CsvImporter.load_authors(path).map { |record| new(record) }
    end

    attr_accessor :email, :first_name, :last_name

    def initialize(params)
      @email = params[:email]
      @first_name = params[:first_name]
      @last_name = params[:last_name]

      Author.all << self
    end

    def to_s
      "Author: #{email}, #{first_name}, #{last_name}"
    end
  end
end
