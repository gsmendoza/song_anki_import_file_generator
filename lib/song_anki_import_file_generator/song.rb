module SongAnkiImportFileGenerator
  class Song
    def initialize(content)
      @content = content
    end

    def stanzas
      stanzas_text = []
      current_stanza = []
      in_stanza = false

      @content.each_line do |line|
        if line.start_with?("[")
          stanzas_text << current_stanza.join("\n") if in_stanza && current_stanza.any?
          current_stanza = []
          in_stanza = true
        end

        current_stanza << line.chomp if in_stanza
      end

      stanzas_text << current_stanza.join("\n") if in_stanza && current_stanza.any?
      stanzas_text.map { |text| Stanza.new(text) }
    end
  end
end
