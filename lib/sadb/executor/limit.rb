# frozen_string_literal: true

module Sadb
  module Executor
    class Limit
      def initialize(limit:, next_node:)
        @limit = limit
        @count = 0
        @next_node = next_node
      end

      def next
        return nil if @count >= @limit
        @count += 1
        @next_node.next()
      end
    end
  end
end
