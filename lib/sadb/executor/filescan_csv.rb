# frozen_string_literal: true

require "csv"

module Sadb
  module Executor
    # FilescanCSV reads data from a csv file one row at a time
    class FilescanCSV
      def initialize(file_path:)
        @rows = CSV.parse(File.read(file_path), headers: true)
        @current_row = 0
      end

      # next returns the next row from the csv file as a CSV::ROW
      # sort of like an array-hash hybrid
      # https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV/Row.html
      def next
        return nil if @current_row >= @rows.length
        row = @rows[@current_row]
        @current_row += 1
        row
      end
    end
  end
end
