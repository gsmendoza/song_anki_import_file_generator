module SongAnkiImportFileGenerator
  class Line
    attr_accessor :stanza
    attr_reader :text

    def initialize(text:)
      @text = text
    end

    def to_card
      # This logic assumes the first line of the stanza is the "First Line"

      front = "First Line"
      back = "#{@stanza.title}\n#{@text}"

      Card.new(front: front, back: back)
    end
  end
end
