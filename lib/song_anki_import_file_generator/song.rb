module SongAnkiImportFileGenerator
  class Song
    attr_reader :stanzas
    attr_accessor :artist, :title

    def initialize(artist: nil, title: nil)
      @artist = artist
      @title = title
      @stanzas = []
    end

    def add_stanza(stanza)
      stanza.song = self
      @stanzas << stanza
    end
  end
end
