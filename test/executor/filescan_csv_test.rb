# frozen_string_literal: true

require 'test_helper'

module Sadb
  module Executor
    class FilescanCSVTest < Minitest::Test
      def test_initializes
        puts 'here1'

        filescan = Sadb::Executor::FilescanCSV.new(file_path: 'fake_path')
        # gives "NameError: uninitialized constant Sadb::Executor::FilescanCSV"

        puts 'here2'
        refute_nil filescan
      end
    end
  end
end
