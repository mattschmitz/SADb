# frozen_string_literal: true

require 'minitest/autorun'

module Sadb
  module Executor
    class Limit 
      def initialize(params:, next_node:)
        @limit = params[:limit]
        @current_row_count = 0
        @next_node = next_node
      end

      def next
        return nil if @current_row_count > @limit
        @current_row_count += 1
        @next_node.next()
      end
    end
  end
end
