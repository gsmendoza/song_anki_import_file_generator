module SongAnkiImportFileGenerator
  class Line
    attr_accessor :stanza
    attr_reader :text

    def initialize(text:)
      @text = text
    end

    def to_card
      index = @stanza.lines.index(self)

      if index == 0
        front = "First Line"
      else
        previous_line = @stanza.lines[index - 1]
        front = "#{@stanza.title}\n#{previous_line.text}"
      end

      back = "#{@stanza.title}\n#{@text}"

      Card.new(front: front, back: back)
    end
  end
end
