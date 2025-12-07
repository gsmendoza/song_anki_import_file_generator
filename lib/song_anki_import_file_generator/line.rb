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
      if first_in_stanza?
        if stanza.first?
          "First Line"
        else
          @stanza.previous.lines.last.to_s
        end
      else
        previous.to_s
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
      "#{@stanza.title}\n#{@text}"
    end
  end
end
