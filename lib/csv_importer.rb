require "csv"

module CsvImporter
  class << self
    def load_authors(path)
      [].tap do |authors|
        CSV.foreach(path, col_sep: ";", headers: true) do |entry|
          authors << {
            email: entry["email"],
            first_name: entry["firstname"],
            last_name: entry["lastname"],
          }
        end
      end
    end

    def load_books(path)
      [].tap do |books|
        CSV.foreach(path, col_sep: ";", headers: true) do |entry|
          books << {
            title: entry["title"],
            description: entry["description"],
            authors: entry["authors"],
            isbn: entry["isbn"],
          }
        end
      end
    end

    def load_magazines(path)
      [].tap do |mags|
        CSV.foreach(path, col_sep: ";", headers: true) do |entry|
          mags << {
            title: entry["title"],
            description: entry["description"],
            authors: entry["authors"],
            isbn: entry["isbn"],
            published_at: entry["publishedAt"],
          }
        end
      end
    end
  end
end
