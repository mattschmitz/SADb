# frozen_string_literal: true

# TODO: Out-of-core sort

module Sadb
  module Executor
    class Sort
      def initialize(sort_col:, next_node:)
        @sort_col = sort_col
        @next_node = next_node
      end

      # next returns the next row from the csv file as a CSV::ROW
      # sort of like an array-hash hybrid
      # https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV/Row.html
      def next
        # call next on child until you have all rows
        # sort all rows on sort_col
      end
    end
  end
end
