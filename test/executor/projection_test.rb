# frozen_string_literal: true

require "test_helper"

describe "Projection" do
  before do
    csv = File.join(File.dirname(__FILE__), "mock_data.csv")
    filescan = Sadb::Executor::FilescanCSV.new(file_path: csv)
    get_age = ->(row) { row["age"] }
    @projection = Sadb::Executor::Projection.new(map_fn: get_age, next_node: filescan)
  end
  
  it "gets just the age" do
    # map over the first 3 ages in test_data
    ["30", "60", "75", "5"].each do |age|
      res = @projection.next()
      assert_equal(age, res)
    end
  end

  it "returns nil if child returns nil" do
    4.times { @projection.next() } # file is only 4 lines long
    fifth_call_res = @projection.next()
    assert_nil(fifth_call_res)
  end
end
