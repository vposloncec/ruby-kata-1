# frozen_string_literal: true

require "dry/cli"
require "models/book"
require "models/author"
require "models/publication"
require "models/magazine"

module Echocat
  AUTHOR_CSV = File.join(File.expand_path("../data", __dir__), "authors.csv")
  MAGAZINE_CSV = File.join(File.expand_path("../data", __dir__), "magazines.csv")
  BOOK_CSV = File.join(File.expand_path("../data", __dir__), "books.csv")

  class << self
    def run
      load_data
      Dry::CLI.new(Echocat::Commands).call
    end

    def load_data
      Author.from_csv(AUTHOR_CSV)
      Book.from_csv(BOOK_CSV)
      Magazine.from_csv(MAGAZINE_CSV)
    end
  end

  module Commands
    extend Dry::CLI::Registry

    class Book < Dry::CLI::Command
      desc "Print books"

      argument :isbn, desc: "Find magazine by isbn"

      def call(isbn: nil, **)
        mags = Echocat::Book.all
        if isbn
          puts Echocat::Book.find_by(:isbn, isbn)
        else
          puts mags
        end
      end
    end

    class Magazine < Dry::CLI::Command
      desc "Print magazines"
      argument :isbn, desc: "Find magazine by isbn"

      def call(isbn: nil, **)
        mags = Echocat::Magazine.all
        if isbn
          puts Echocat::Magazine.find_by(:isbn, isbn)
        else
          puts mags
        end
      end
    end

    class Author < Dry::CLI::Command
      desc "Print authors"

      def call(*_args)
        puts Echocat::Author.all
      end
    end

    class Publication < Dry::CLI::Command
      desc "Print books and magazines"

      option :sort_by_title, type: :boolean, default: false, desc: "sort output by publication title"

      def call(**options)
        if options[:sort_by_title]
          puts Echocat::Publication.sorted_by_title
        else
          puts Echocat::Publication.all
        end
      end
    end

    class Version < Dry::CLI::Command
      desc "Print version"

      def call(*)
        puts "1.0.0"
      end
    end

    register "version", Version
    register "magazines", Magazine
    register "authors", Author
    register "books", Book
    register "publications", Publication
  end
end
