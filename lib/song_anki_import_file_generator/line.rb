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
        previous_stanza = nil
        if @stanza.song
          stanza_index = @stanza.song.stanzas.index(@stanza)
          previous_stanza = @stanza.song.stanzas[stanza_index - 1] if stanza_index > 0
        end

        front = if previous_stanza
          "#{previous_stanza.title}\n#{previous_stanza.lines.last.text}"
        else
          "First Line"
        end
      else
        previous_line = @stanza.lines[index - 1]
        front = "#{@stanza.title}\n#{previous_line.text}"
      end

      back = "#{@stanza.title}\n#{@text}"

      Card.new(front: front, back: back)
    end
  end
end
