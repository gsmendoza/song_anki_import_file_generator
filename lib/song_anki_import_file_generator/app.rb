module SongAnkiImportFileGenerator
  class App
    def initialize(input_path:, output_path:)
      @input_path = input_path
      @output_path = output_path
    end

    def call
      content = File.read(@input_path)
      stanzas = parse_stanzas(content)
      output_content = stanzas.map { |stanza| format_stanza(stanza) }.join("\n")
      File.write(@output_path, output_content)
      @output_path
    end

    private

    def parse_stanzas(content)
      stanzas = []
      current_stanza = []
      in_stanza = false

      content.each_line do |line|
        if line.start_with?("[")
          stanzas << current_stanza.join("\n") if in_stanza && current_stanza.any?
          current_stanza = []
          in_stanza = true
        end

        current_stanza << line.chomp if in_stanza
      end

      stanzas << current_stanza.join("\n") if in_stanza && current_stanza.any?
      stanzas
    end

    def format_stanza(stanza)
      %{(First line,"#{stanza}"}
    end
  end
end
