# frozen_string_literal: true

require_relative "lib/song_anki_import_file_generator/version"

Gem::Specification.new do |spec|
  spec.name = "song_anki_import_file_generator"
  spec.version = SongAnkiImportFileGenerator::VERSION
  spec.authors = ["George Mendoza"]
  spec.email = ["gsmendoza@gmail.com"]

  spec.summary = "Generates Anki import files from song lyrics."
  spec.description = "A CLI tool to convert song lyrics into CSV format suitable for importing into Anki. Supports stanza detection and context-aware card generation."
  spec.homepage = "https://github.com/gsmendoza/song_anki_import_file_generator"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gsmendoza/song_anki_import_file_generator"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "csv"
  spec.add_development_dependency "debug"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
