# frozen_string_literal: true

require "test_helper"

describe "Thing" do
  before do
    @csv = File.join(File.dirname(__FILE__), "mock_data.csv")
    @filescan = Sadb::Executor::FilescanCSV.new(file_path: @csv)
  end
  it "initializes" do
    refute_nil @filescan
  end

  it "gives next row, skipping headers" do
    next_row = @filescan.next()
    assert_equal("John,Smith,30\n", next_row.to_s())
    assert_equal("John", next_row[0]) # test array-style access
    assert_equal("John", next_row["first"]) # test hash-style access
  end

  it "returns nil when finished reading" do
    num_lines_read = 0
    while @filescan.next() != nil
      num_lines_read += 1
    end
    assert_equal(3, num_lines_read)
  end
end
