# frozen_string_literal: true

module Sadb
  module Executor
    class Selection
      def initialize(next_node:, predicate:)
        @next_node = next_node
        @predicate = predicate
      end

      # next returns the next row from the csv file as a CSV::ROW
      # sort of like an array-hash hybrid
      # https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV/Row.html
      def next
        next_row = @next_node.next()
        while next_row != nil
          # return row if it matches predicate
          return next_row if @predicate.call(next_row)
          # otherwise, keep calling next
          next_row = @next_node.next()
        end
        return nil
      end
    end
  end
end
