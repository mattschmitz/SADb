# frozen_string_literal: true

require "test_helper"

class ExecutorTest < Minitest::Test
  def test_initializes
    executor = Sadb::Executor::Executor.new
    limit = 10
    movies_query = [
      { type: "limit", params: { limit: limit } },
      { type: "filescan", params: { table: "movies" } },
    ]
    results = executor.execute(query: movies_query)
    assert(limit, results.length)
  end
end
