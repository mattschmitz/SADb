# frozen_string_literal: true

# Include all executor files
resources = File.join(File.dirname(__FILE__), "executor", "*.rb")
Dir.glob(resources, &method(:require))

module Sadb
  # The Executor module handles the actual execution of a query after it has
  # been fully parsed
  module Executor
    class Executor
      private def instantiate_node(type:, params:, next_node:)
        case type
        when "filescan"
          # Todo: remove hardcoded value here
          file_path = "sample_data/#{params[:table]}.csv"
          Sadb::Executor::FilescanCSV.new(file_path: file_path)
        when "limit"
          Sadb::Executor::Limit.new(params: params, next_node: next_node)
        else
          raise "Node type not implemented"
        end
      end

      private def instantiate_nodes(query)
        # TODO: don't mutate input
        current_node = nil
        node_details = query.pop()
        while !node_details.nil?
          next_node = instantiate_node(
            type: node_details[:type],
            params: node_details[:params],
            next_node: current_node,
          )
          current_node = next_node
          node_details = query.pop()
        end
        current_node
      end

      def execute(query:)
        node = instantiate_nodes(query)
        results = []
        current_row = node.next()
        while !current_row.nil?
          results.push(current_row)
          current_row = node.next()
        end
        results
      end
    end
  end
end
