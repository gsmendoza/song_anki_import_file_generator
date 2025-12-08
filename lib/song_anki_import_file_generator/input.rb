module SongAnkiImportFileGenerator
  class Input
    def initialize(content)
      @content = content
    end

    def to_song
      song = build_song
      current_stanza = nil

      body_lines.each do |line|
        if line.stanza_header?
          current_stanza = Stanza.new(title: line.text)
          song.add_stanza(current_stanza)
        elsif current_stanza && line.present?
          current_stanza.add_line(Line.new(text: line.text))
        end
      end

      song
    end

    private

    def build_song
      first_line = lines[0]

      if first_line
        artist, title = first_line.text.split(" - ")
        Song.new(artist: artist, title: title)
      else
        Song.new
      end
    end

    def body_lines
      lines[1..] || []
    end

    def lines
      @lines ||= @content.each_line.map { |line| InputLine.new(text: line.chomp) }
    end
  end
end
