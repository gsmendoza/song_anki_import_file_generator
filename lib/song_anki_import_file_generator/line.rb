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
      "#{stanza.song.artist} - #{stanza.song.title}\n#{front_text}"
    end

    def front_text
      return "0. First Line" if stanza.first? && first_in_stanza?
      return @stanza.previous.lines.last.to_s if first_in_stanza?

      previous.to_s
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
      "#{@stanza.index + 1}. #{@stanza.title}\n#{index + 1}. #{CGI.escapeHTML(@text)}"
    end
  end
end
