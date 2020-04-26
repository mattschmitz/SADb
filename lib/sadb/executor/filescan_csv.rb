# frozen_string_literal: true

require 'minitest/autorun'
require 'csv'

# Expects sample data to live in sample_data directory
# Let's refactor this later!
def get_csv_file_path(table)
  "sample_data/#{table}.csv"
end

module Sadb
  module Executor
    # FilescanCSV reads data from a csv file one row at a time
    class FilescanCSV
      def initialize(params:, next_node:)
        file_path = get_csv_file_path(params[:table])
        @rows = CSV.parse(File.read(file_path), headers: true)
        @current_row = 0
      end

      # next returns the next row from the csv file
      def next
        return nil if @current_row >= @rows.length
        row = @rows[@current_row]
        @current_row += 1
        row
      end
    end
  end
end
