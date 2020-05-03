# frozen_string_literal: true

require "test_helper"

describe "Limit" do
  before do
    csv = File.join(File.dirname(__FILE__), "mock_data.csv")
    filescan = Sadb::Executor::FilescanCSV.new(file_path: csv)
    # duplicate filescan to compare against
    @filescan2 = Sadb::Executor::FilescanCSV.new(file_path: csv)
    @limit = 2
    @limit_node = Sadb::Executor::Limit.new(limit: @limit, next_node: filescan)
  end
  it "limits to 2 values" do
    rows_read = 0
    next_row = @limit_node.next()
    while (next_row != nil)
      assert_equal(next_row.to_s, @filescan2.next().to_s)
      rows_read += 1
      next_row = @limit_node.next()
    end
    assert_equal(@limit, rows_read)
  end

  it "returns nil once limit has been reached" do
    @limit.times do
      refute_nil(@limit_node.next())
    end
    3.times do # 3 here is arbitrary
      assert_nil(@limit_node.next())
    end
  end
end
