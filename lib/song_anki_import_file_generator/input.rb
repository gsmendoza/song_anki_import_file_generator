module SongAnkiImportFileGenerator
  class Input
    def initialize(content)
      @content = content
    end

    def to_song
      song = Song.new
      current_stanza = nil

      @content.each_line.map { |line| InputLine.new(text: line.chomp) }.each do |line|
        if line.stanza_header?
          current_stanza = Stanza.new(title: line.text)
          song.add_stanza(current_stanza)
        elsif current_stanza
          current_stanza.add_line(Line.new(text: line.text))
        end
      end

      song
    end
  end
end
