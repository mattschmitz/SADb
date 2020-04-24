# frozen_string_literal: true

require 'minitest/autorun'

module Sadb
  module Executor
    # FilescanCSV reads data from a csv file one row at a time
    class FilescanCSV
      require 'csv'

      def initialize(file_path:, starting_row: 0)
        puts 'here in initialize'
        # @row_counter = :starting_row
        # @rows = csv.read(file_path) # array of arrays
      end

      # next returns the next row from the csv file
      def next
        return nil if @rowCounter >= @rows.length

        row = @rows[@row_count]
        @row_counter += 1
        row
      end
    end
  end
end