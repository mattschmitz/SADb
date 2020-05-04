# frozen_string_literal: true

require "test_helper"

describe "Executor" do
  it "runs a simple query" do
    executor = Sadb::Executor::Executor.new
    limit = 10
    movies_query = [
      { type: "limit", params: { limit: limit } },
      { type: "filescan", params: { table: "movies" } },
    ]
    results = executor.execute(query: movies_query)
    assert(limit, results.length)
    first_row = results[0]
    assert_equal({
      "movieId" => "1",
      "title" => "Toy Story (1995)",
      "genres" => "Adventure|Animation|Children|Comedy|Fantasy",
    }, first_row.to_h())
  end

  it "runs a more complext query" do
    # get only the titles of 3 movies in the 'comedy' genre
    is_comedy = ->(row) { row["genres"].include?("Comedy") }
    query = [
      { type: "limit", params: { limit: 3 } },
      { type: "col_projection", params: { cols: ["title"] } },
      { type: "selection", params: { predicate: is_comedy } },
      { type: "filescan", params: { table: "movies" } },
    ]
    executor = Sadb::Executor::Executor.new
    results = executor.execute(query: query)
    assert_equal(
      { "title" => "Grumpier Old Men (1995)" },
      results[1].to_h(),
    )
  end
end
