module SongAnkiImportFileGenerator
  class Input
    def initialize(content)
      @content = content
    end

    def to_song
      lines = @content.each_line.map { |line| InputLine.new(text: line.chomp) }
      first_line = lines.shift

      if first_line
        artist, title = first_line.text.split(" - ")
        song = Song.new(artist: artist, title: title)
      else
        song = Song.new
      end

      current_stanza = nil

      lines.each do |line|
        if line.stanza_header?
          current_stanza = Stanza.new(title: line.text)
          song.add_stanza(current_stanza)
        elsif current_stanza && line.present?
          current_stanza.add_line(Line.new(text: line.text))
        end
      end

      song
    end
  end
end
