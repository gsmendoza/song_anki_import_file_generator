module SongAnkiImportFileGenerator
  class Line
    attr_accessor :stanza
    attr_reader :text

    def initialize(text:)
      @text = text
    end

    def to_card
      Card.new(front:, back:)
    end

    def front
      front_text = if first_in_stanza?
        if stanza.first?
          "First Line"
        else
          @stanza.previous.lines.last.to_s
        end
      else
        previous.to_s
      end

      if stanza.song.artist && stanza.song.title
        "#{stanza.song.artist} - #{stanza.song.title}\n#{front_text}"
      else
        front_text
      end
    end

    def back
      to_s
    end

    def first_in_stanza?
      index == 0
    end

    def index
      @index ||= @stanza.lines.index(self)
    end

    def previous
      @previous ||= @stanza.lines[index - 1]
    end

    def to_s
      "#{@stanza.index + 1}. #{@stanza.title}\n#{index + 1}. #{@text}"
    end
  end
end
