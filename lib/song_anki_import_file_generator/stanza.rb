module SongAnkiImportFileGenerator
  class Stanza
    attr_reader :title, :lines
    attr_accessor :song

    def initialize(title:)
      @title = title
      @lines = []
    end

    def add_line(line)
      line.stanza = self
      @lines << line
    end
  end
end
