# frozen_string_literal: true

module Sadb
  module Executor
    class Projection
      def initialize(next_node:, map_fn:)
        @next_node = next_node
        @map_fn = map_fn
      end

      # next returns the next row from the csv file as a CSV::ROW
      # sort of like an array-hash hybrid
      # https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV/Row.html
      def next
        next_tuple = @next_node.next()
        return nil if next_tuple.nil?
        @map_fn.call(next_tuple)
      end
    end
  end
end
