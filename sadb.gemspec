require_relative "lib/sadb/version"

Gem::Specification.new do |spec|
  spec.name = "sadb"
  spec.version = Sadb::VERSION
  spec.authors = ["Matthew Schmitz", "Tyler Arbus"]
  spec.summary = "A simple relational database written in Ruby"
  spec.homepage = "https://github.com/mattschmitz/SADb"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mattschmitz/SADb"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rufo", "~> 0.12"
  spec.add_development_dependency "rubocop", "~> 0.82.0"
  spec.add_development_dependency "rubocop-config-rufo", "~> 0.1.0"
end
