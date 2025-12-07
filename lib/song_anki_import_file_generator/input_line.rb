module SongAnkiImportFileGenerator
  class InputLine
    attr_reader :text

    def initialize(text:)
      @text = text
    end

    def stanza_header?
      @text.start_with?("[")
    end
  end
end
