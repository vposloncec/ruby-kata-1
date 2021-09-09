# frozen_string_literal: true
require "dry/cli"
require "models/book"
require "models/author"
require "models/magazine"

module Echocat
  class << self
    def run
      Dry::CLI.new(Echocat::Commands).call
    end
  end

  module Commands
    extend Dry::CLI::Registry

    class Book < Dry::CLI::Command
      desc "Print books"

      argument :isbn, desc: "Find magazine by isbn"

      def call(isbn: nil, **)
        mags = Echocat::Book.from_csv(File.join(File.expand_path("../data", __dir__), "book.csv"))
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
        mags = Echocat::Magazine.from_csv(File.join(File.expand_path("../data", __dir__), "magazines.csv"))
        if isbn
          puts Echocat::Magazine.find_by(:isbn, isbn)
        else
          puts mags
        end
      end
    end

    class Author < Dry::CLI::Command
      desc "Print authors"

      def call(*args)
        puts Echocat::Author.from_csv(File.join(File.expand_path("../data", __dir__), "authors.csv"))
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

  end
end
