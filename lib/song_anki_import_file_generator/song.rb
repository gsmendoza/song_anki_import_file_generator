module SongAnkiImportFileGenerator
  class Song
    attr_reader :stanzas

    def initialize
      @stanzas = []
    end

    def add_stanza(stanza)
      stanza.song = self
      @stanzas << stanza
    end
  end
end
