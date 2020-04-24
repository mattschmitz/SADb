# frozen_string_literal: true

require 'test_helper'

class SadbTest < Minitest::Test
  def test_that_it_has_a_version_number
    # this test passes fine
    refute_nil ::Sadb::VERSION
  end
end
