# SongAnkiImportFileGenerator

Generates Anki import files from song lyrics. It converts text files with stanza headers into CSV files ready for Anki import, creating cards with context (e.g., previous line shown on the front).

## Installation

Install the gem by executing:

    $ gem install song_anki_import_file_generator

## Usage

Run the executable with your input file:

    $ song-anki-gen path/to/input.txt [path/to/output.csv]

If the output path is omitted, it defaults to the input filename with a `.csv` extension.

### Input Format

The input text file should separate stanzas with headers in square brackets.

Example `song.txt`:

```text
[Intro]
Line 1
Line 2

[Verse 1]
Line 3
Line 4
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gsmendoza/song_anki_import_file_generator.
