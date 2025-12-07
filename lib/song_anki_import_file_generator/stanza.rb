module SongAnkiImportFileGenerator
  class Stanza
    def initialize(text)
      @text = text
    end

    # Treating the whole stanza as a single "line" for the card logic
    # to match existing test expectations of one card per stanza.
    def lines
      [Line.new(@text)]
    end
  end
end
