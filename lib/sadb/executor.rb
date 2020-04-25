# frozen_string_literal: true

# Include all executor files
resources = File.join(File.dirname(__FILE__), 'executor', '*.rb')
Dir.glob(resources, &method(:require))

module Sadb
  # The Executor module handles the actual execution of a query after it has
  # been fully parsed
  module Executor
  end
end
