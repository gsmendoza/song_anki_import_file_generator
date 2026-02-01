require "cgi"

module SongAnkiImportFileGenerator
  class Line
    LINE_DELIMITER = "<br/>\n".freeze

    attr_accessor :stanza
    attr_reader :text

    def initialize(text:)
      @text = text
    end

    def to_card
      Card.new(front:, back:)
    end

    def front
      front_texts = [
        "#{stanza.song.artist} - #{stanza.song.title}",
        "",
        previous_texts,
        "",
        cloze_texts
      ].flatten

      front_texts.join(LINE_DELIMITER)
    end

    def previous_texts
      return ["0. First Line"] if stanza.first? && first_in_stanza?
      return @stanza.previous.lines.last.texts if first_in_stanza?

      previous.texts
    end

    def back
      ""
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

    def texts
      [
        "#{@stanza.index + 1}. #{@stanza.title}",
        "#{index + 1}. #{CGI.escapeHTML(@text)}"
      ]
    end

    def cloze_texts
      [
        "#{@stanza.index + 1}. #{@stanza.title}",
        "#{index + 1}. {{c1::#{CGI.escapeHTML(@text)}}}"
      ]
    end
  end
end
