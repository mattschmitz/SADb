# frozen_string_literal: true

require "test_helper"

describe "Selection" do
  before do
    csv = File.join(File.dirname(__FILE__), "mock_data.csv")
    filescan = Sadb::Executor::FilescanCSV.new(file_path: csv)
    is_under_40 = ->(row) { row["age"].to_i < 40 }
    @selection = Sadb::Executor::Selection.new(
      predicate: is_under_40,
      next_node: filescan,
    )
  end

  it "gets only those under 40" do
    # map over the first 3 ages in test_data
    output = []
    next_row = @selection.next()
    while next_row
      output.push(next_row)
      next_row = @selection.next()
    end
    assert_equal(2, output.length)
    assert_equal("Donald", output[1]["first"])
  end

  it "returns nil if child returns nil" do
    4.times { @selection.next() }
    fifth_call_res = @selection.next()
    assert_nil(fifth_call_res)
  end
end
