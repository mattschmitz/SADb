# frozen_string_literal: true

# ColProjection extends Projection by returning only the specified columns
module Sadb
  module Executor
    class ColProjection < Projection
      def initialize(next_node:, cols:)
        # TODO: throw if no cols
        @next_node = next_node
        @map_fn = ->(row) do
          hash = {}
          cols.each do |col|
            hash[col] = row[col]
          end
          hash
        end
      end
    end
  end
end
