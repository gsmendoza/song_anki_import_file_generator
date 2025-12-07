module SongAnkiImportFileGenerator
  class Input
    def initialize(content)
      @content = content
    end

    def to_song
      song = Song.new
      current_stanza = nil
      in_stanza = false
      current_stanza_lines = []
      current_stanza_title = nil

      @content.each_line do |line|
        line = line.chomp
        if line.start_with?("[")
          if in_stanza && current_stanza
            current_stanza_lines.each { |l| current_stanza.add_line(Line.new(text: l)) }
            song.add_stanza(current_stanza)
          end
          current_stanza_title = line
          current_stanza = Stanza.new(title: current_stanza_title)
          current_stanza_lines = []
          in_stanza = true
        elsif in_stanza
          current_stanza_lines << line
        end
      end

      if in_stanza && current_stanza
        current_stanza_lines.each { |l| current_stanza.add_line(Line.new(text: l)) }
        song.add_stanza(current_stanza)
      end

      song
    end
  end
end
