# frozen_string_literal: true

require "test_helper"

describe "ColProjection" do
  before do
    csv = File.join(File.dirname(__FILE__), "mock_data.csv")
    filescan = Sadb::Executor::FilescanCSV.new(file_path: csv)
    cols = ["first", "age"]
    @col_projection = Sadb::Executor::ColProjection.new(cols: cols, next_node: filescan)
  end

  it "gets just the 'first' and 'age' columns" do
    # map over the first 3 ages in test_data
    output = []
    2.times do
      res = @col_projection.next()
      output.push(res)
    end
    assert_equal({ "first" => "Bill", "age" => "60" }, output[1])
  end
end
