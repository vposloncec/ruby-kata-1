require_relative "../findable"
require_relative "book"
require_relative "magazine"

module Echocat
  module Publication
    extend Findable

    class << self
      def all
        [
          *Book.all,
          *Magazine.all,
        ].flatten
      end

      def sorted_by_title
        all.sort_by(&:title)
      end
    end
  end
end
