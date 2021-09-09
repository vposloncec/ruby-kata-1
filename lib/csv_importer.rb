require "csv"
require "pry"

module CsvImporter
  class << self
    def load_authors(path)
      load_csv(path) do |row|
        {
          email: row[:email],
          first_name: row[:firstname],
          last_name: row[:lastname],
        }
      end
    end

    def load_books(path)
      load_csv(path) do |row|
        {
          title: row[:title],
          description: row[:description],
          authors: row[:authors],
          isbn: row[:isbn],
        }
      end
    end

    def load_magazines(path)
      load_csv(path) do |row|
        {
          title: row[:title],
          description: row[:description],
          authors: row[:authors],
          isbn: row[:isbn],
          published_at: row[:publishedAt],
        }
      end
    end

    def load_publications(magazine_path:, book_path:)
      load_magazines(magazine_path) + load_books(book_path)
    end

    private

    def load_csv(path)
      [].tap do |entry|
        CSV.foreach(path, col_sep: ";", headers: true, header_converters: :symbol) do |row|
          entry << yield(row)
        end
      end
    end
  end
end
